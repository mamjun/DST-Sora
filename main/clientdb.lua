local key = env.MODKEY or env.modkey or env.modname or "" -- 防冲突       可以在外面定义
local rpcprint = env.DEBUGPRINT or env.DebugPrint or print -- 可以在外面定义在实现根据条件屏蔽RPC的print 太多太刷屏了！
--[[
    基本参考MainDB 主要说一下区别
    1,ClientDB分为 服务器和客户端版本  服务器初始化服务器的 客户端初始化客户端的 
    2,客户端没有Set的权限，主动发送SyncReply报文也是无效的 
    3,删除了 AsynGet 和 AsynSet  因为不想给客户端权限，如果需要建议用 RPC 获取 

    --下面暂未实现
    4,增加了BindMainDB 方法  可以把一整个根直接从MainDB获取
    5,增加了 BindRootFn 方法  可以允许一个根 不正常读写数据 而是自己提供Get和Set方法 （这样不会提供保存和读取）

    --使用上的区别  不能直接CreateClietDB
    要先创建 CreateClietDBTemp 
    选人界面可以收发event 但是不会无法触发RPC 因为选人界面无法触发task  Get Set的只会同步一次 

]]
local dbnamespace = key .. "ClientDB"
dbnamespace = dbnamespace:lower()
local serverdbhandles = {}
local clientdbhandles = {}
local clientlink = {}
local ismaster = TheNet:IsDedicated()
local ismastershard = TheShard:IsMaster()
local alltemps = {}
function AddClientLinkFn(fn)
    table.insert(clientlink, fn)
end

local function serverandclientrpchandle(id, ns, cmd, data, ...)
    -- rpcprint("Client DB RPC!", id, ns, cmd, data, ...)
    if not ns and id  and cmd == "link" then
        --rpcprint("rpc 尝试初始化",id)
        for k, temp in pairs(alltemps) do
            if not GetClientDB(temp.namespace, id, true) then -- 找不到就创建
                CreateClientDB(temp, id, true)
                rpcprint("rpc 初始化",temp.namespace, id)
            end
            
        end
        return
    end
    local dbhandles = id and serverdbhandles or clientdbhandles
    if not (dbhandles[ns] and dbhandles[ns].Handle) then
        return
    end -- 无handle
    if id then -- 客户端发给服务器的 要验证的 
        if dbhandles[ns].userid ~= id then
            rpcprint("Client DB RPC", "ERROR ID ")
            return -- 防止仿冒
        end
    end
    rpcprint("Client DB RPC", id, ns, cmd, data, ...)
    return dbhandles[ns]:Handle(id, cmd, data, ...)
end

env.AddModRPCHandler(dbnamespace, "ClientDB", serverandclientrpchandle)
env.AddClientModRPCHandler(dbnamespace, "ClientDB", serverandclientrpchandle)
MarkUserIDRPC(dbnamespace, "ClientDB")
local function encode(data)
    local r, str = pcall(json.encode, data)
    if not r then
        print("ClientDB:ERROE ENCODE", str, tostring(data))
    end
    return str
end

local function decode(str)
    local r, data = pcall(json.decode, str)
    if not r then
        print("Client:ERROE DECODE", data, tostring(str))
    end
    return data
end
local srpc = MOD_RPC[dbnamespace]["ClientDB"]
local crpc = CLIENT_MOD_RPC[dbnamespace]["ClientDB"]

local ClientDB = Class(function(self)
    self.namespace = nil
    self.rawnamespace = nil
    self.Inited = false
    self.IsServer = false
    self.inst = nil
    self.userid = nil
    self.player = nil -- 从这儿拿玩家的话 自己判断有效性 
    self.saveindex = 0 -- 因为世界和玩家都会存一份 用这个保障版本号
    -- 数据
    self.data = {}
    self.noSyn = {}
    self.rootbind = {}
    -- 事件
    self.listenid = 1
    self.events = {}
    -- 异步
    self.AsynId = 1
    self.Asyns = {}
    -- RPC！
    self.RPCHandles = {}

    self.Bigs = {} -- 大数据传输
    self.Syn = { -- 记录同步顺序和同步状态
        syntime = 600, -- 默认600秒同步一次
        roottime = 1, -- 默认每1秒同步一个根

        syning = 0,
        rooting = 0,
        this = nil
    }
end)
-- 基础模块

function ClientDB:Init(namespace, userid, syntime, roottime, isserver) -- 初始化
    if self.Inited then
        return
    end
    self.rawnamespace = namespace
    namespace = namespace .. "|" .. tostring(userid)
    if isserver then
        serverdbhandles[namespace] = self
    else
        clientdbhandles[namespace] = self
    end
    self.namespace = namespace
    self.userid = userid
    self.Inited = true
    self.IsServer = isserver
    self.Syn.syntime = syntime or 600 -- 默认600秒同步一次  0 不同步
    self.Syn.roottime = roottime or 1 -- 默认每1秒只同步一个 根 注意 根数量 * 根更新时间 要小于同步时间
end

function ClientDB:UnInit(e) -- 卸载 基本不调用
    if not self.Inited then
        return
    end
    if self.inst and next(self.rootbind) then
        for k, v in pairs(self.rootbind) do
            if v and v.Remove() then
                v:Remove()
            end
        end
    end
    if self.IsServer then
        serverdbhandles[self.namespace] = nil
    else
        clientdbhandles[self.namespace] = nil
    end
    if self.player then
        if self.player[key] then
            self.player[key][self.rawnamespace] = nil
        end
        self.player = nil
    end
    self.rawnamespace = nil
    self.namespace = nil
    self.Inited = false
end
function ClientDB:OnRemoveEntity()
    self:UnInit()
end
local maxsenddata = 60000
function ClientDB:IsPlayerLinked ()

end
function ClientDB:Send(id, cmd, data, data2, data3, ...) -- 发送数据   数据长度不做检查 单参数最大长度 65535！
    if not self.Inited then     --还没初始化呢
        return
    end
    if type(data3) == "string" and #data3 > maxsenddata then
        local all = math.ceil(#data3 / maxsenddata)
        local hashs = hash(data3)
        local bigdataid = sid .. "|" .. tostring(os.time()) .. "|" .. tostring(hashs)

        for i = 1, all do
            if i == 1 then -- 只有第一部分带全部的参数 和 data3的第一个分段
                local data3tosend = data3:sub(1, maxsenddata)
                self:Send(id, "BigData", encode({
                    bid = bigdataid,
                    all = all,
                    i = i,
                    hashs = hashs
                }), encode({
                    cmd = cmd,
                    data = data,
                    data2 = data2
                }), data3tosend, ...)
            else
                local data3tosend = data3:sub(maxsenddata * i - maxsenddata + 1, maxsenddata * i)
                self:Send(id, "BigData", encode({
                    bid = bigdataid,
                    all = all,
                    i = i,
                    hashs = hashs
                }), nil, data3tosend, nil)
            end
        end
        return
    end

    if self.IsServer then
        SendModRPCToClient(crpc, self.userid, nil, self.namespace, cmd, data, data2, data3, ...)
    else
        --print("begen",srpc, self.namespace, cmd, data, data2, data3, ...)
        SendModRPCToServer(srpc, self.namespace, cmd, data, data2, data3, ...)
        --print("end",srpc, self.namespace, cmd, data, data2, data3, ...)
    end
end
function ClientDB:Notice(event, data)
    if self.inst and self.inst:IsValid() then
        self.inst:PushEvent(event, data)
    end
end

function ClientDB:Handle(id, cmd, data, data2, data3, ...) -- 处理收到的数据 --数据有效性自己处理 shardRPC不存在客户端  不会被攻击
    if cmd == "event" then -- 推送事件
        return self:HandleEvent(id, data, decode(data3))
    elseif cmd == "Sync" then -- 对方要求我方发送所有数据 进行同步
        if not self.IsServer then
            return
        end -- 客户端不需要处理同步请求
        local keys, hashs = self:GetRootHash(data, false) -- 第一次只计算key key数量不一致直接同步 节省性能
        if keys == data2 then
            keys, hashs = self:GetRootHash(data, true)
            if hashs == data3 then
                return self:Send(id, "SyncReply", data, hashs) -- 数据一致 不需要同步
            end
        end
        local str = ""
        if data then
            str = encode(self:GetRoot(data))
        else
            local tosend = {}
            for k, v in pairs(self.data) do
                if k and (not self.noSyn[k] or self.noSyn[k] == 2) then
                    tosend[k] = self:GetRoot(k)
                end
            end
            str = encode(tosend)
        end
        return self:Send(id, "SyncReply", data, hash(str), str) -- 数据一致 不需要同步
    elseif cmd == "SyncReply" then -- 对方要求我方发送所有数据 进行同步
        if self.IsServer then
            return
        end -- 服务器不接受客户的同步 防攻击 
        if not data3 then
            return -- 数据一致 不需要更新
        end
        local hashs = data2
        if hashs ~= hash(data3 or "") then
            print("ClientDB:ERROE HASH CHECK FAILD", data)
            return
        end
        local d = decode(data3)
        if type(d) == "table" then
            if data then
                if self.data[data] then
                    self.data[data] = d
                    self:Notice("ClientDBRootSync", {
                        namespace = self.namespace,
                        root = data,
                        value = d
                    })
                end
            else
                for k, v in pairs(self.data) do
                    if d[k] then
                        self.data[k] = d[k]
                        self:Notice("ClientBRootSync", {
                            namespace = self.namespace,
                            root = k,
                            value = v
                        })
                    end
                end
            end
        end
        return
    elseif cmd == "Set" then -- 通知对方有数据修改
        if self.IsServer then
            return
        end -- 服务器不接受客户端的Set
        if self.data[data] then
            self.data[data][data2] = decode(data3)
            self:Notice("ClientDBSet", {
                namespace = self.namespace,
                root = data,
                key = data2,
                value = self.data[data][data2]
            })
        end

        return
    elseif cmd == "Asyn" then -- 异步请求
        local aid = data
        local cmdd = data2
        local req = decode(data3)
        local d = {self:RPCHandle(id, cmdd, req)}
        return self:AsynReply(id, aid, cmd, d)
    elseif cmd == "AsynReply" then -- 异步回复
        local aid = data
        local cmd = data2
        local ret = decode(data3)
        if self.Asyns[aid] then
            self.Asyns[aid].ret = ret
            self.Asyns[aid].status = 1
        end
        return
    elseif cmd == "BigData" then -- 异步回复
        data = decode(data)
        if not (type(data) == "table") then
            return
        end
        local bid = data.bid
        if not self.Bigs[bid] then
            self.Bigs[bid] = {
                all = data.all,
                data3s = {},
                cmd = nil,
                hashs = nil,
                data = nil,
                data2 = nil,
                endtime = os.time() + 5,
                others = nil
            }
        end
        if data.i == 1 then
            self.Bigs[bid].cmd = data2 and decode(data2).cmd
            self.Bigs[bid].data = data2 and decode(data2).data
            self.Bigs[bid].data2 = data2 and decode(data2).data2
            self.Bigs[bid].others = {...}
            self.Bigs[bid].hashs = data.hashs
        end
        self.Bigs[bid].data3s[data.i] = data3
        if #self.Bigs[bid].data3s == self.Bigs[bid].all then -- 收齐了 组包！
            local bigdata3 = table.concat(self.Bigs[bid].data3s)
            local bigdata = self.Bigs[bid]
            self.Bigs[bid] = nil
            if hash(bigdata3) == bigdata.hashs then
                self:Handle(id, bigdata.cmd, bigdata.data, bigdata.data2, bigdata3,
                    bigdata.others and unpack(bigdata.others))
            else
                print("Client DB BIG DATA CHECK FAILED", bid)
            end
        end
        -- 清理过期的 
        local time = os.time()
        local todel = {}
        for k, v in pairs(self.Bigs) do
            if v and v.endtime < time then -- 五秒还没数据清了算了
                todel[k] = 1
            end
        end
        for k, v in pairs(todel) do
            self.Bigs[k] = nil
            print("Client DB BIG DATA TIME OUT", k)
        end
        return
    end

end
function ClientDB:Asyn(id, cmd, req) -- 创建异步
    local asyn = {
        AsynId = "A" .. self.AsynId, -- 请求ID
        cmd = cmd,
        req = req, -- 请求数据
        ret = {}, -- 返回数据
        status = 0, --
        timeout = 90 -- 默认最多等待3s
    }
    asyn.Wait = function(s)
        while s.status < 1 and s.timeout > 0 do
            s.timeout = s.timeout - 1
            Sleep(FRAMES)
        end
        self.Asyns[s.AsynId] = nil
        if s.timeout < 1 then
            return false, "TimeOut"
        end
        return true, s.ret
    end
    self.Asyns[asyn.AsynId] = asyn
    self.AsynId = self.AsynId + 1
    self:Send(id, "Asyn", asyn.AsynId, cmd, encode(req))
    return asyn
end

function ClientDB:AsynReply(id, aid, cmd, ret) -- 异步回复
    self:Send(id, "AsynReply", aid, cmd, encode(ret))
end

function ClientDB:GetTableHash(t) -- 性能低就低吧
    local kv = {}
    for k, v in pairs(t) do
        if type(v) == "table" then
            table.insert(kv, k .. self:GetTableHash(v))
        else
            table.insert(kv, k .. tostring(v))
        end
    end
    table.sort(kv, function(a, b)
        return hash(a) < hash(b)
    end)
    return hash(table.concat(kv))
end
function ClientDB:GetRootHash(root, needhash) -- 获取hash值 用于对比同步
    local keys = 0
    local hashs = 0
    local str = ""
    if not root then
        local roothash = ""
        for k, v in pairs(self.data) do
            local t = self:GetRoot(k)
            for ik, iv in pairs(t) do
                keys = keys + 1
                if needhash then
                    roothash = roothash .. "|" .. tostring(self:GetTableHash(t))
                end
            end
        end
        hashs = hash(roothash)

    elseif self.data[root] then
        local t = self:GetRoot(root)
        for k, v in pairs(t) do
            keys = keys + 1
        end
        if needhash then
            hashs = self:GetTableHash(t)
        end
    end
    return keys, hashs
end

function ClientDB:Save() -- 保存数据--组件保存 如果想写到文件 请重写这个方法
    return self.data
end

function ClientDB:Load(data) -- 读取数据--组件读取
    if data and next(data) then
        for k, v in pairs(self.data) do
            if self.rootbind[k] then

            elseif data[k] then
                self.data[k] = data[k] 
                local str = encode(self.data[k])
                self:Send(nil, "SyncReply", k, hash(str), str)
            else
                self.data[k] = {}
                local str = encode({})
                self:Send(nil, "SyncReply", k, hash(str), str)
            end
        end
    end
end

-- 数据同步模块
function ClientDB:InitRoot(root, noSyn) -- 创建根 参数是是否自动同步 
    -- noSyn  1 不进行 定时同步  2 不进行手动同步 3 定时手动同步都不进行
    self.data[root] = {}
    self.noSyn[root] = noSyn
end
function ClientDB:BindRootFn(root, getfn, setfn, getrootfn)
    self.rootbind[root] = {
        Get = getfn,
        Set = setfn,
        GetRoot = getrootfn -- 不提供这个参数 可以在Sync的时候不参与校验
    }
    self.data[root] = {}
    return self.rootbind[root]
end

function ClientDB:BindMainDB(selfroot, maindb, root)
    if not maindb and root then
        return false, "Not Root"
    end
    local selfroot, maindb, root = selfroot, maindb, root
    local getfn = function(s, r, k, v)
        return maindb:Get(root, k, v)
    end

    local setfn = function(s, r, k, v)
        return maindb:Set(root, k, v)
    end

    local getrootfn = function(s, r)
        return maindb:GetRoot(root)
    end
    local changefn = function(i, data)
        --print("changefn", data.root, data.key)
        if data.root == root then
            if data.key then
                self:Send(nil, "Set", selfroot, data.key, encode(data.value))
            else
                local str = encode(data.value)
                self:Send(nil, "SyncReply", selfroot, hash(str), str)
            end
        end
    end
    if self.inst and maindb.inst then -- 如果双方都有实体 就监听event
        self.inst:ListenForEvent("MainDBRootSync", changefn, maindb.inst)
        self.inst:ListenForEvent("MainDBSet", changefn, maindb.inst)
    end
    local bind = self:BindRootFn(selfroot, getfn, setfn, getrootfn)
    bind.Remove = function()
        self.inst:RemoveEventCallback("MainDBRootSync", changefn, maindb.inst)
        self.inst:RemoveEventCallback("MainDBSet", changefn, maindb.inst)
    end
end

function ClientDB:UnInitRoot(root) -- 销毁根 不再进行相关操作  一般不需要
    self.data[root] = nil
end

function ClientDB:Get(root, key, value) -- 获取数据 value是默认值 获取的是缓存的数据 
    if self.IsServer and self.rootbind[root] and self.rootbind[root].Get then
        return self.rootbind[root].Get(self, root, key, value)
    end
    return self.data[root] and self.data[root][key] or value
end

function ClientDB:GetRoot(root) -- 获取整个根的数据 可以用于遍历 但是请勿修改！！！
    if self.IsServer and self.rootbind[root] and self.rootbind[root].GetRoot then
        return self.rootbind[root].GetRoot(self, root)
    end
    return self.data[root]
end
function ClientDB:Set(root, key, value) -- 设置数据 并通知其他世界更新 
    if not self.IsServer then
        return false, "Not Server"
    end
    if self.IsServer and self.rootbind[root] and self.rootbind[root].Set then
        return self.rootbind[root].Set(self, root, key, value)
    end
    if self.data[root] then
        self.data[root][key] = value
        if self.noSyn[root] and self.noSyn[root] > 1 then -- 不进行手动同步
            return true
        end
        self:Send(nil, "Set", root, key, encode(value)) -- 通知所有人修改
        return true
    end
    return false, "No Root"
end

function ClientDB:Sync(root) -- 强制同步 允许只同步一个 根 或者 同步所有的根  非必要不建议整根同步
    if self.IsServer then
        return
    end
    local keys, hashs = self:GetRootHash(root, true)
    self:Send(mid, "Sync", root, keys, hashs) -- 同步数据 同步完不要立刻获取 有延迟！
end

function ClientDB:AsynGet(root, key, value) -- 异步获取 获取主世界存储的值 只能在协程里使用
    local s = self:Asyn(mid, "Get", {
        root = root,
        key = key
    })
    local r, data = s:Wait()
    if r then
        return data[1]
    else
        return value
    end
end

function ClientDB:AsynSet(root, key, value) -- 异步设置 直接设置主世界的值 只能在协程里使用
    local s = self:Asyn(mid, "Set", {
        root = root,
        key = key,
        value = value
    })
    local r, data = s:Wait()
    if r then
        return data[1], data[2]
    else
        return false
    end
end

-- 事件相关 
function ClientDB:HandleEvent(id, event, data) -- 处理事件并分发给event
    if event and self.events[event] then
        for k, v in pairs(self.events[event]) do
            v.fn(id, data, event)
        end
    end
end

function ClientDB:PushEvent(event, data, toid) -- 推送事件  不会保存
    self:Send(toid, "event", event, nil, encode(data))
end

function ClientDB:ListenForEvent(event, fn) -- 监听事件   不会保存
    local listener = {
        lisid = "l" .. self.listenid,
        event = event,
        fn = fn,
        inst = self
    }
    if not self.events[event] then
        self.events[event] = {}
    end
    self.events[event][listener.lisid] = listener
    self.listenid = self.listenid + 1
    return listener
end

function ClientDB:RemoveEvent(listener) -- 监听事件   不会保存
    if listener and listener.lisid and self.events[listener.event] and self.events[listener.event][listener.lisid] then
        self.events[listener.event][listener.lisid] = nil
    end
end

-- 远程函数调用

function ClientDB:RPC(id, cmd, data) -- 远程函数调用
    id = type(id) == "string" and id or mid -- 为空发给主世界  禁止广播
    local s = self:Asyn(id, cmd, encode(data))
    local r, data = s:Wait()
    if r then
        return unpack(data)
    else
        return false, "Time Out"
    end
end

function ClientDB:RPCHandle(id, cmd, data) -- 远程函数处理
    if cmd and self.RPCHandles[cmd] then
        return true, self.RPCHandles[cmd](id, decode(data), cmd)
    end
    return false, "NO Handle"
end

function ClientDB:AddRPCHandle(cmd, fn) -- 远程函数处理
    if cmd then
        self.RPCHandles[cmd] = fn
    end
end

function ClientDB:RemoveRPCHandle(cmd) -- 远程函数处理
    if cmd then
        self.RPCHandles[cmd] = nil
    end
end

local ClientDBUpdataTask -- 自动同步用的周期任务
local MainConnect = false

local function ClientDBUpdataFn(inst, force)
    if force then
        for k, db in pairs(clientdbhandles) do
            for root, data in pairs(db.data) do
                if not db.noSyn[root] or db.noSyn[root] == 2 then
                    db:Sync(root)
                end
            end
        end
        return
    end

    for k, db in pairs(clientdbhandles) do
        if db.Syn.syning < 1 then
            db.Syn.syning = db.Syn.syntime + 1
        end
        db.Syn.syning = db.Syn.syning - 1
        db.Syn.rooting = db.Syn.rooting - 1
        if db.Syn.syning < 1 then
            db.Syn.this = next(db.data)
        end
        if db.Syn.this and db.Syn.rooting < 1 then
            while db.Syn.rooting < db.Syn.roottime do
                local this = db.Syn.this
                if not this then
                    db.Syn.rooting = db.Syn.roottime
                    break
                elseif not db.noSyn[this] or db.noSyn[this] == 2 then
                    db:Sync(this)
                    db.Syn.rooting = db.Syn.roottime
                end
                db.Syn.this = next(db.data, this)
            end
        end
    end

end

AddPrefabPostInit("world",function(inst)
    inst:ListenForEvent("ms_clientauthenticationcomplete",function (i,d)
        --rpcprint("我来了",d and d.userid)
        if not i.ismastersim then rpcprint("ClintDB ERROR event") return end
        local userid = d and d.userid or nil
        if not userid then return end
        for k, temp in pairs(alltemps) do
            if not GetClientDB(temp.namespace, userid, true) then -- 找不到就创建
                CreateClientDB(temp, userid, true)
                rpcprint("event 初始化",temp.namespace, userid)
            end  
        end
    end)
    inst:ListenForEvent("ms_clientdisconnected",function (i,d)
        --rpcprint("我走了",d and d.userid)
        if not i.ismastersim then rpcprint("ClintDB ERROR event") return end
        local userid = d and d.userid or nil
        if not userid then return end

        local touninit = {}
        for k,v in pairs(serverdbhandles) do
            if v and v.userid == userid then
                touninit[k]=1
            end
        end
        for k,v in pairs (touninit) do
            if serverdbhandles[k] then
                serverdbhandles[k]:UnInit()
            end
           rpcprint("卸载",k)
        end
    end)
end)



AddPlayerPostInit(function(inst) -- 绑定玩家
    inst:DoTaskInTime(0, function()
        if not inst.userid  then return end --可能是假人
        if not inst[key] then
            inst[key] = {}
        end
        for k, v in pairs(alltemps) do
            if TheWorld.ismastersim then
                local db = GetClientDB(v.namespace, inst.userid, true)
                if db then
                    inst[key][v.namespace] = db -- 不建议从这儿取  建议GetClientDB 后自己保存
                    db.player = inst
                end
            end
            if not ismaster then
                local db = GetClientDB(v.namespace, inst.userid, false)
                if db then
                    inst[key][v.namespace] = db
                    db.player = inst
                end
            end
        end
    end)
end)
function CreateClientDBTemple(namespace, syntime, roottime, roots, comomfn, serverfn, clientfn)
    local temp = {
        namespace = namespace,
        syntime = syntime,
        roottime = roottime,
        comomfn = comomfn,
        serverfn = serverfn,
        clientfn = clientfn,
        roots = roots or {}
    }
    temp.InitRoot = function(self, root, noSyn)
        table.insert(self.roots, {root, noSyn})
    end
    table.insert(alltemps, temp)
    return temp
end
function CreateClientDB(temp, userid, IsServer)
    local db = ClientDB()
    db:Init(temp.namespace, userid, temp.syntime, temp.roottime, IsServer)
    for k, v in pairs(temp.roots) do
        db:InitRoot(v[1], v[2])
    end
    if temp.comomfn then
        temp.comomfn(temp.namespace, db, userid)
    end
    if IsServer and temp.serverfn then
        temp.serverfn(temp.namespace, db, userid)
    end
    if not IsServer and temp.clientfn then
        temp.clientfn(temp.namespace, db, userid)
    end
    return db
end

AddSimPostInit(function()   --创建客户端的
    if not ismaster then    
        for k, temp in pairs(alltemps) do
            if not GetClientDB(temp.namespace, TheNet:GetUserID(), false) then -- 找不到就创建
                CreateClientDB(temp, TheNet:GetUserID(), false)
            end
        end
        SendModRPCToServer(srpc, nil,"link")
        ClientDBUpdataFn(nil, true)
        ClientDBUpdataTask = TheWorld:DoPeriodicTask(1, ClientDBUpdataFn)
    end
end)

function GetClientDB(tempornamespace, userid, IsServer)
    local namespace = (type(tempornamespace) == "table" and tempornamespace.namespace) or
                          (type(tempornamespace) == "string" and tempornamespace) or tempornamespace
    local dbid = namespace .. "|" .. userid
    local dbs = IsServer and serverdbhandles or clientdbhandles
    return dbs[dbid]
end
