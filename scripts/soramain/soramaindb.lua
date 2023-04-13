--[[
授权级别:开放级
Copyright 2022 [FL]。此产品仅授权在 Steam 和WeGame平台指定账户下，
Steam平台：MySora 模组ID：workshop-1638724235
WeGame平台: 穹の空 模组ID：workshop-2199027653598519351
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!

基于本mod的patch包 补丁包等 在以下情况下被允许：
1，原则上允许patch和补丁，但是请最好和我打声招呼。
2, patch包 补丁包浏览权限 请优先选择成“不公开” 或者 “仅好友可见”
3，禁止修改经验、进食、皮肤、热更相关内容。
4，本人保留要求相关patch、补丁包下架和做出反制的权利 。
5，之后会有详细的说明放置于mod根目录下的 ReadMe.txt文件，会提供更详细的说明和示例。


声明：本MOD所有内容不用于盈利，且拒绝接受捐赠、红包等行为。

对moder:
授权声明：
1,本mod内源码会严格分为'参考级'和'开放级',我会在源码内标明。
其中'参考级'允许作为参考,可以按照我的思路自行编写其他逻辑,但是禁止直接复制粘贴.
'开放级'允许直接复制粘贴后使用,并允许根据自己的需要进行修改,
但是我期望尽量减少修改以保证兼容和后续更新带来的麻烦,如果有功能改动可以和我沟通进行合并。
未标明的文件，默认授权级别为'参考级'。
2,本mod内贴图、动画相关文件禁止挪用,毕竟这是我自己花钱买的.
3,严禁直接修改本mod内文件后二次发布。
4,从本mod内提前的源码请保留版权信息,并且禁止加密、混淆。
]] --[[shard间数据同步模块
通过ShardRPC 进行数据通信
主世界负责存取写入数据
从世界负责查询
]] --
local key = env.MODKEY or env.modkey or env.modname or "" -- 防冲突       可以在外面定义
local rpcprint = env.DEBUGPRINT or env.DebugPrint or print  --可以在外面定义在实现根据条件屏蔽RPC的print 太多太刷屏了！

--[[  doc && demo 
快速导航        
数据同步模块
事件模块
RPC模块
测试代码 

!!!注意 所有的data部分 都可以为 table 但是都只允许 出现 int string table,  不允许 class function entity userdata 等!!!

--数据同步模块

  self.data = {
    root1 = {
        key1= string or int or table ,
        key2= string or int or table ,
    },
    root2 = {
        key1= string or int or table ,
        key2= string or int or table ,
    },
    key和eoot只允许为 string 或者 int 类型的 
    value 可以为 string int 或者 table
  }


  每个根可以单独定义是否 在设置的时候同步(下称手动同步)  或者 定期完整同步一次(下称自动同步)
  手动同步 一次只发送修改的key 和 对应的数据  修改完数据会立刻发送同步
  自动同步 一次性发送整个根 对应的全部数据   每X秒同步一次 

  自动同步的时候 会根据根的数量 延迟同步 避开流量高峰 例如 一个namespace下有5个根  设置的每600秒同步一次  
  则600秒的时候 同步第一个根 601秒的时候 同步第二个根 以此类推

  可用方法：
  MainDB:InitRoot(root,noSyn)       创建一个 root 可用动态创建 但是建议在同步开始前创建好所有的root
                                    允许通过 noSyn参数指定同步方式 
                                        nil  正常同步
                                        1   不进行自动同步
                                        2   不进行手动同步
                                        3   不进行自动同步和手动同步
  MainDB:UnInitRoot(root)           一个root不在需要了 销毁  一般不需要调用
  MainDB:Get(root,key,value)        读取本地的数据 如果本地不存在 则返回 value作为默认值 
  MainDB:GetRoot(root)              获取整个根的数据 可以用于遍历 但是请勿修改！！！ 强行修改会导致数据不同步
  MainDB:Set(root,key,value)        设置本地的数据 并根据是否需要同步来决定是否发给其他shard
  MainDB:Sync(root)                 强制同步 指定root 或者 全部 root的数据 noSyn =3的不会同步
  MainDB:AsynGet(root,key,value)    读取主世界的数据  只能在线程里使用
  MainDB:AsynSet(root,key,value)    设置主世界的数据  只能在线程里使用 如果单独设置 不需要返回结果 也可以直接调用 

  示例：
    --modmain 环境
    modimport "soramaindb"
    local ShopInfo = CreateMainDB("ShopInfo")
    ShopInfo:InitRoot("Shops")
    ShopInfo:InitRoot("Items",1)        --这个根 不进行定时同步 只需要修改的时候同步 一般用于数据量大 但是不那么重要 允许出错  
    ShopInfo:InitRoot("Buy",3)          --这个根 不进行同步 想获取数据 必须主世界执行 一般用于只允许主世界修改的内容 
    if TheNet:GetIsMasterSimulation() and not TheShard:IsSecondary() then   --只绑定主世界的 只有主世界的需要保存
        AddPrefabPostInit("forest",function (inst)    --绑定给一个实体 如果不需要保存数据可以不绑定
            inst.components.MainDBShop = ShopInfo       --绑定到实体 这样就可以使用组件的OnSave 和 OnLoad了
        end)
        AddPrefabPostInit("cave",function (inst)    --防止有洞穴为主的 也绑定一下
            inst.components.MainDBShop = ShopInfo       --绑定到实体 这样就可以使用组件的OnSave 和 OnLoad了
        end)
    end

    --运行中 
    ShopInfo:Get("Shops","a")   --获取 Shops/a的数据 
    ShopInfo:Set("Shops","a",2) --设置 Shops/a的数据 为2 
    for k,v in pairs(ShopInfo:GetRoot("Shops")) do  --遍历 shops
        ...
    end
    --设置table数据 
    local a = {a = 1,b=2 }
    ShopInfo:Set("Shops","a",a)

    a.a = 2 
    ShopInfo:Set("Shops","a",a) --修改了表内值必须重新Set才能同步

    local b = ShopInfo:Get("Shops","a")
    print(b.a)  
    ShopInfo:Set("Shops","a",a) --修改了表内值必须重新Set才能同步
    print(b.a)      --错误用法 获取到的可能是上次的值 
    print(ShopInfo:Get("Shops","a").a)  --必须使用Get 才能获取到最新值 

    ShopInfo:Sync()     --强制同步所有根
    ShopInfo:Sync("Shops")  --强制同步 Shops


    ShopInfo:Set("Buy","a",1)    --错误用法 不会通知主世界
    print(ShopInfo:Get("Buy","a"))  --无法获取正确数据 因为主世界没有把数据同步到本地

    TheWorld:StartThread(function ()
        ShopInfo:AsynSet("Buy","a",1)    --可以设置数据 
        print(ShopInfo:Get("Buy","a"))      --因为没有同步给本地 所以获取不到数据
        print(ShopInfo:AsynGet("Buy","a"))  --可以获取到数据 
    end)





--事件模块 

  self.events = {
    event1 = {
        listener1 = {
            lisid = string,
            event = string,
            fn = fn,
            inst = self
        },
        listener2 = {
            lisid = string,
            event = string,
            fn = fn,
            inst = self
        },
    },
    event2 = {
        listener1 = {
            lisid = string,
            event = string,
            fn = fn,
            inst = self
        },
        listener2 = {
            lisid = string,
            event = string,
            fn = fn,
            inst = self
        },
    },
  }

  类似于饥荒本身的事件机制 但是也有区别 
        1,ListenForEvent 会返回一个 listener 移除是使用这个移除 
        2,ListenForEvent 不绑定实体 不会根据实体移除而自动移除 
        3 ListenForEvent的 fn的参数也不一致 


  可用方法：
  MainDB:PushEvent(event, data, toid)       推送一个事件 event 名称 data内容可以为table
                                            toid 为空是 发给所有世界 包含自己
                                            {"1","2","3"} 发给指定的世界 
                                            "1" 发给指定的世界 
  MainDB:ListenForEvent(event, fn)          监听一个事件  返回一个 listener对象 
                                            fn 参数  (id,data,event)      
                                                id 事件来源WORLDID
                                                data 事件data
                                                event 事件名称  不常用 但是可以支持 一个函数处理多个event 

  MainDB:RemoveEvent(listener)              移除一个监听 需要ListenForEvent返回的 listener 对象 


  示例：
    --modmain 环境
    modimport "soramaindb"
    local ShopInfo = CreateMainDB("ShopInfo")
    loccal listener = DB:ListenForEvent("test",function (...) print("Event Do",...) end)

    --运行中 
    ShopInfo:PushEvent("test","a")   --推送给所有世界
    ShopInfo:PushEvent("test","a",{"1","3","5"})   --推送给世界 1 3 5
    ShopInfo:PushEvent("test","a","6")   --推送给 世界6

    DB:RemoveEvent(listener) --移除监听  一般不需要调用 


--RPC模块 
  self.RPCHandles = {
        cmd1 = fn1,
        cmd2 = fn2,
  }

  类似于饥荒本身的事件机制 但是也有区别 
        1,ListenForEvent 会返回一个 listener 移除是使用这个移除 
        2,ListenForEvent 不绑定实体 不会根据实体移除而自动移除 
        3 ListenForEvent的 fn的参数也不一致 


  可用方法：
  MainDB:RPC(id,event, data)        推送一个RPC  
                                    id 只能是字符串 
                                    event名称 data内容可以为table
                                    只能在协程里使用 
                                    会返回  true, RpcHandle返回的 值
                                    或者  fakse,识别原因
                                            

  MainDB:AddRPCHandle(cmd,fn)          监听一个RPC 
                                            fn 参数  (id,data,cmd)      
                                                id 事件来源WORLDID
                                                data 事件data
                                                cmd RPC名称  不常用 但是可以支持 一个函数处理多个event 

  MainDB:RemoveRPCHandle(cmd)              移除一个RPC监听 参数是 cmd 


  示例：
    --modmain 环境
    modimport "soramaindb"
    local ShopInfo = CreateMainDB("ShopInfo")
    DB:ListenForEvent("test",function (...) print("Event Do",...) end)
    DB:AddRPCHandle("remote",function (id,data) if data then 
    local fn = loadstring(data)
        if type(fn) == "function" then 
        local r,ret = pcall(fn) 
        return ret
        end
    end end)

    --运行中 
    TheWorld:StartThread(function () print("RPC",DB:RPC(1,"test",{a={b={c=1}}})) end)
    TheWorld:StartThread(function () print("RPC",DB:RPC(1,"remote","print (111) return 111")) end)

]]

--[[
    --下面是测试代码 

GLOBAL.DB = CreateMainDB("test",300,1)
AddPrefabPostInit("forest",function(inst)
    inst.components.TestDB = DB
end)

DB:InitRoot("ShopInfo")
DB:InitRoot("ShopInfo2")
DB:InitRoot("ShopInfo3")
DB:InitRoot("Shops",1)
DB:InitRoot("Info",2)
DB:InitRoot("ITEMS",3)

DB:AddRPCHandle("test",function (...) print("RPC Do",...) return "Rpc REQ" end)
DB:ListenForEvent("test",function (...) print("Event Do",...) end)
DB:AddRPCHandle("remote",function (id,data) if data then 
    local fn = loadstring(data)
    if type(fn) == "function" then 
        local r,ret = pcall(fn) 
        return ret
    end
end end)

]]
--[[
测试指令
DB:Set("ShopInfo","a",2)  DB:Set("Shops","a",1)  DB:Set("Info","a",1)  DB:Set("ITEMS","a",1)
print(DB:Get("ShopInfo","a") ,DB:Get("Shops","a") ,DB:Get("Info","a"),DB:Get("ITEMS","a"))

DB:PushEvent("test",{a=1})
TheWorld:StartThread(function () print("AsynGet",DB:AsynGet("ITEMS","a")) end)

TheWorld:StartThread(function () print("AsynSet",DB:AsynSet("ITEMS","a",3)) end)

TheWorld:StartThread(function () print("RPC",DB:RPC(1,"test",{a={b={c=1}}})) end)
TheWorld:StartThread(function () print("RPC",DB:RPC(1,"remote","print (111) return 111")) end)
]]



if not TheNet:GetIsServer() then
    return
end
local dbnamespace = key .. "maindb"
dbnamespace = dbnamespace:lower()
local dbhandles = {}
local sid = TheShard:GetShardId() -- 自身ID
local mid = sid == "0" and "0" or SHARDID.MASTER -- 主世界ID
local ismaster = TheShard:IsMaster() or mid == "0"
--print("AddShardModRPCHandler",AddShardModRPCHandler,env,AddShardModRPCHandler,GLOBAL.AddShardModRPCHandler)
env.AddShardModRPCHandler(dbnamespace, "maindb", function(id, ns, cmd, data, ...)
    if not ns then
        return
    end -- 无namespace 
    if not (dbhandles[ns] and dbhandles[ns].Handle) then
        return
    end -- 无handle
    rpcprint("MAIN DB RPC",id, ns, cmd, data, ...)
    return dbhandles[ns]:Handle(id, cmd, data, ...)
end)

local function encode(data)
    local r, str = pcall(json.encode, data)
    if not r then
        print("MAINDB:ERROE ENCODE", str, tostring(data))
    end
    return str
end

local function decode(str)
    local r, data = pcall(json.decode, str)
    if not r then
        print("MAINDB:ERROE DECODE", data, tostring(str))
    end
    return data
end
local rpc = SHARD_MOD_RPC[dbnamespace]["maindb"]

local MainDB = Class(function(self, inst)
    self.Inited = false
    -- 数据
    self.data = {}
    self.noSyn = {}
    -- 事件
    self.listenid = 1
    self.events = {}
    -- 异步
    self.AsynId = 1
    self.Asyns = {}
    -- RPC！
    self.RPCHandles = {}


    self.Bigs = {}  --大数据传输

    self.Syn = { -- 记录同步顺序和同步状态
        syntime = 600, -- 默认600秒同步一次
        roottime = 1, -- 默认每1秒同步一个根

        syning = 0,
        rooting = 0,
        this = nil
    }
end)
-- 基础模块
function MainDB:Init(namespace, syntime, roottime) -- 初始化
    if self.Inited then
        return
    end
    dbhandles[namespace] = self
    self.namespace = namespace
    self.Inited = true
    self.Syn.syntime = syntime or 600 -- 默认600秒同步一次  0 不同步
    self.Syn.roottime = roottime or 1 -- 默认每1秒只同步一个 根 注意 根数量 * 根更新时间 要小于同步时间
end
function MainDB:UnInit(e) -- 卸载
    self.inited = false
    self.namespace = nil
    dbhandles[self] = nil
end
local maxsenddata = 60000
function MainDB:Send(id, cmd, data,data2,data3, ...) -- 发送数据   数据长度不做检查 单参数最大长度 65535！
    if type(data3) == "string" and #data3 > maxsenddata then
        local all = math.ceil(#data3 / maxsenddata)
        local hashs = hash(data3)
        local bigdataid =sid.."|".. tostring(os.time()) .."|" .. tostring(hashs)
        
        for i=1,all do 
            if i==1 then        --只有第一部分带全部的参数 和 data3的第一个分段
                local data3tosend  = data3:sub(1,maxsenddata)
                self:Send(id,"BigData",encode({bid = bigdataid,all =all,i=i,hashs=hashs}),encode({cmd=cmd,data=data,data2=data2}),data3tosend,...)
            else
                local data3tosend  = data3:sub(maxsenddata*i-maxsenddata+1,maxsenddata*i)
                self:Send(id,"BigData",encode({bid = bigdataid,all =all,i=i,hashs=hashs}),nil,data3tosend,nil)
            end
        end
        return 
    end
    if tostring(id) == tostring(sid) then 
        rpcprint("MAIN DB LOCAL RPC",cmd, data, data2,data3,...)
        self:Handle(id, cmd, data, data2,data3,...)
    else
        SendModRPCToShard(rpc, id, self.namespace, cmd, data, data2,data3,...)
    end
end
function MainDB:Handle(id, cmd, data, data2, data3, ...) -- 处理收到的数据 --数据有效性自己处理 shardRPC不存在客户端  不会被攻击
    if cmd == "event" then -- 推送事件
        return self:HandleEvent(id, data, data3)
    elseif cmd == "Sync" then -- 对方要求我方发送所有数据 进行同步
        if tostring(id) == tostring(sid) then return end    --不处理自己的 
        local keys, hashs = self:GetRootHash(data,false)    --第一次只计算key key数量不一致直接同步 节省性能
        if keys == data2 then
            keys, hashs = self:GetRootHash(data,true)
            if hashs == data3 then
                return self:Send(id, "SyncReply", data, hashs) -- 数据一致 不需要同步
            end
        end
        local str = ""
        if data then
            str = encode(self.data[data])
        else
            local tosend = {}
            for k,v in pairs(self.data) do
                if k and (not self.noSyn[k] or self.noSyn[k]==2 ) then
                    tosend = self.data[k]
                end
            end
            str = encode(tosend)
        end
        return self:Send(id, "SyncReply", data, hash(str), str) -- 数据一致 不需要同步
    elseif cmd == "SyncReply" then -- 对方要求我方发送所有数据 进行同步
        if tostring(id) == tostring(sid) then return end    --不处理自己的 
        if not data3 then
            
            return -- 数据一致 不需要更新
        end
        local hashs = data2
        if hashs ~= hash(data3 or "") then
            print("MAINDB:ERROE HASH CHECK FAILD", data)
            return
        end
        local d = decode(data3)
        if type(d) == "table" then
            if data then
                if self.data[data] then
                    self.data[data] = d
                end
            else
                for k, v in pairs(self.data) do
                    if d[k] then
                        self[k] = v
                    end
                end
            end
        end
        return
    elseif cmd == "Set" then -- 通知对方有数据修改
        if tostring(id) == tostring(sid) then return end    --不处理自己的 
        if self.data[data] then
            self.data[data][data2] = decode(data3)
        end
        return
    elseif cmd == "Asyn" then -- 异步请求
        local aid = data
        local cmdd = data2
        local req = decode(data3)
        if cmdd == "Get" then
            if req.root and req.key then
                local d = {self:Get(req.root, req.key)}
                return self:AsynReply(id, aid, cmdd, d)
            end
        elseif cmdd == "Set" then
            if req.root and req.key and req.value then
                local d = {self:Set(req.root, req.key, req.value)}
                return self:AsynReply(id, aid, cmdd, d)
            end
        end
       
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
        data =decode(data)
        if not (type(data) == "table") then return end
        local bid = data.bid
        if not self.Bigs[bid] then
            self.Bigs[bid] = {
                all = data.all ,
                data3s = {},
                cmd = nil,
                hashs = nil,
                data = nil,
                data2 = nil,
                endtime = os.time()+5,
                others = nil,
            }
        end
        if data.i ==1 then
            self.Bigs[bid].cmd = data2 and  decode(data2).cmd
            self.Bigs[bid].data = data2 and  decode(data2).data 
            self.Bigs[bid].data2 = data2 and  decode(data2).data2 
            self.Bigs[bid].others  = {...} 
            self.Bigs[bid].hashs = data.hashs
        end
        self.Bigs[bid].data3s[data.i] = data3
        if #self.Bigs[bid].data3s == self.Bigs[bid].all then        --收齐了 组包！
            local bigdata3 = table.concat(self.Bigs[bid].data3s)
            local bigdata = self.Bigs[bid]
            self.Bigs[bid] = nil
            if hash(bigdata3) == bigdata.hashs then
                --print("MAIN DB BIG DATA CHECK OK",id,bigdata.cmd,bigdata.data,bigdata.data2,#bigdata3) 
                self:Handle(id,bigdata.cmd,bigdata.data,bigdata.data2,bigdata3,bigdata.others and  unpack(bigdata.others))
            else
               print("MAIN DB BIG DATA CHECK FAILED",bid) 
            end
        end
         --清理过期的 
        local time = os.time()
        local todel = {}
        for k,v in pairs(self.Bigs) do
            if v and v.endtime < time then  --五秒还没数据清了算了
                todel [k] = 1
            end
        end
        for k,v in pairs(todel) do     
            self.Bigs[k] = nil
            print("MAIN DB BIG DATA TIME OUT",k)
        end
        return
    end

end
function MainDB:Asyn(id, cmd, req) -- 创建异步
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
            return false,"TimeOut"
        end
        return true, s.ret
    end
    self.Asyns[asyn.AsynId] = asyn
    self.AsynId = self.AsynId + 1
    self:Send(id, "Asyn", asyn.AsynId, cmd, encode(req))
    return asyn
end

function MainDB:AsynReply(id, aid, cmd, ret) -- 异步回复
    self:Send(id, "AsynReply", aid, cmd, encode(ret))
end

function MainDB:GetTableHash(t) --性能低就低吧
    local kv = {}
    for k,v in pairs(t) do
        if type(v) == "table" then
            table.insert(kv,k..self:GetTableHash(v))
        else
            table.insert(kv,k..tostring(v))
        end
    end
    table.sort(kv,function (a,b) return hash(a)<hash(b)end)
    return hash(table.concat(kv))
end
function MainDB:GetRootHash(root,needhash) -- 获取hash值 用于对比同步
    local keys = 0
    local hashs = 0
    local str = ""
    if not root then
        for k, v in pairs(self.data) do
            for ik, iv in pairs(v) do
                keys = keys + 1
            end
        end
        if needhash then 
            hashs = self:GetTableHash(self.data)
        end
    elseif self.data[root] then
        for k, v in pairs(self.data[root]) do
            keys = keys + 1
        end
        if needhash then 
            hashs = self:GetTableHash(self.data[root])
        end
    end
    return keys, hashs
end

function MainDB:OnSave() -- 保存数据--组件保存 如果想写到文件 请重写这个方法
    return self.data
end

function MainDB:OnLoad(data) -- 读取数据--组件读取
    if data and next(data) then
        for k, v in pairs(self.data) do
            self.data[k] = data[k] or {}
        end
    end
end

-- 数据同步模块
function MainDB:InitRoot(root, noSyn) -- 创建根 参数是是否自动同步 
    -- noSyn  1 不进行 定时同步  2 不进行手动同步 3 定时手动同步都不进行
    self.data[root] = {}
    self.noSyn[root] = noSyn
end

function MainDB:UnInitRoot(root) -- 销毁根 不再进行相关操作  一般不需要
    self.data[root] = nil
end

function MainDB:Get(root, key, value) -- 获取数据 value是默认值 获取的是缓存的数据 
    return self.data[root] and self.data[root][key] or value
end

function MainDB:GetRoot(root) -- 获取整个根的数据 可以用于遍历 但是请勿修改！！！
    return self.data[root]
end
function MainDB:Set(root, key, value) -- 设置数据 并通知其他世界更新 
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

function MainDB:Sync(root) -- 强制同步 允许只同步一个 根 或者 同步所有的根  非必要不建议整根同步
    local keys, hashs = self:GetRootHash(root,true)
    self:Send(mid, "Sync", root, keys, hashs) -- 同步数据 同步完不要立刻获取 有延迟！
end

function MainDB:AsynGet(root, key, value) -- 异步获取 获取主世界存储的值 只能在协程里使用
    local s = self:Asyn(mid, "Get", {
        root = root,
        key = key
    })
    local r, data = s:Wait()
    if r then
        return  data[1]
    else
        return value
    end
end

function MainDB:AsynSet(root, key, value) -- 异步设置 直接设置主世界的值 只能在协程里使用
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
function MainDB:HandleEvent(id, event, data) -- 处理事件并分发给event
    if event and self.events[event] then
        for k, v in pairs(self.events[event]) do
            v.fn(id, data, event)
        end
    end
end

function MainDB:PushEvent(event, data, toid) -- 推送事件  不会保存
    self:Send(toid, "event", event,nil, encode(data))
end

function MainDB:ListenForEvent(event, fn) -- 监听事件   不会保存
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

function MainDB:RemoveEvent(listener) -- 监听事件   不会保存
    if listener and listener.lisid and self.events[listener.event] and self.events[listener.event][listener.lisid] then
        self.events[listener.event][listener.lisid] = nil
    end
end

-- 远程函数调用

function MainDB:RPC(id, cmd, data) -- 远程函数调用
    id = type(id) == "string" and id  or mid -- 为空发给主世界  禁止广播
    local s = self:Asyn(id, cmd, encode(data))
    local r,data = s:Wait()
    if r then
        return unpack(data)
    else
        return false,"Time Out"
    end
end

function MainDB:RPCHandle(id, cmd, data) -- 远程函数处理
    if cmd and self.RPCHandles[cmd] then
        return true,self.RPCHandles[cmd](id, decode(data),cmd)
    end
    return false,"NO Handle"
end

function MainDB:AddRPCHandle(cmd, fn) -- 远程函数处理
    if cmd then
        self.RPCHandles[cmd] = fn
    end
end

function MainDB:RemoveRPCHandle(cmd) -- 远程函数处理
    if cmd then
        self.RPCHandles[cmd] = nil
    end
end

local MaindbUpdataTask -- 自动同步用的周期任务
local MainConnect = false

local function MaindbUpdataFn()

    local MConnect = Shard_IsWorldAvailable(mid)
    if not MainConnect and MConnect then
        -- 连接上主世界了 同步一次
        for k, db in pairs(dbhandles) do
            for ik, iv in pairs(db.data) do
                if not db.noSyn[ik] or db.noSyn[ik] == 2 then
                    db:Sync(ik)
                end
            end
        end
        MainConnect = MConnect
        return
    end
    MainConnect = MConnect
    
    for k, db in pairs(dbhandles) do
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
                db.Syn.this = next(db.data,this)
            end
        end
    end
end
if not ismaster then -- 主世界不需要去同步
    AddSimPostInit(function(inst)
        MaindbUpdataTask = TheWorld:DoPeriodicTask(1, MaindbUpdataFn)
    end)
end

function CreateMainDB(namespace, syntime, roottime)
    local db = MainDB(namespace)
    db:Init(namespace, syntime, roottime)
    return db
end



-- GLOBAL.DB = CreateMainDB("test",300,1)
-- AddPrefabPostInit("forest",function(inst)
--     inst.components.TestDB = DB
-- end)

-- DB:InitRoot("ShopInfo")
-- DB:InitRoot("ShopInfo2")
-- DB:InitRoot("ShopInfo3")
-- DB:InitRoot("Shops",1)
-- DB:InitRoot("Info",2)
-- DB:InitRoot("ITEMS",3)

-- DB:AddRPCHandle("test",function (...) print("RPC Do",...) return "Rpc REQ" end)
-- DB:ListenForEvent("test",function (...) print("Event Do",...) end)
-- DB:AddRPCHandle("remote",function (id,data) if data then 
--     local fn = loadstring(data)
--     if type(fn) == "function" then 
--         local r,ret = pcall(fn) 
--         return ret
--     end
-- end end)


--[[
测试指令
DB:Set("ShopInfo","a",2)  DB:Set("Shops","a",1)  DB:Set("Info","a",1)  DB:Set("ITEMS","a",1)
print(DB:Get("ShopInfo","a") ,DB:Get("Shops","a") ,DB:Get("Info","a"),DB:Get("ITEMS","a"))

DB:PushEvent("test",{a=1})
TheWorld:StartThread(function () print("AsynGet",DB:AsynGet("ITEMS","a")) end)

TheWorld:StartThread(function () print("AsynSet",DB:AsynSet("ITEMS","a",3)) end)

TheWorld:StartThread(function () print("RPC",DB:RPC(1,"test",{a={b={c=1}}})) end)
TheWorld:StartThread(function () print("RPC",DB:RPC(1,"remote","print (111) return 111")) end)
]]