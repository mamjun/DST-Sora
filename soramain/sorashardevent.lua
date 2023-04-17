--[[
授权级别:参考级
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
]]


local basepath = "../mods/"..TUNING.SORAMODNAME..'/log/'     
--缓存文件路径 需要提前创建 temp目录 
--在 modmain里定义SORAMODNAME 或者直接写死
local json  = require("json")

local workmode = {          --同一命名空间的工作模式要求相同 否则结果未知
    MasterSlave = 1,        --主从模式 主世界支持发送到指定世界 从世界只支持发送到主世界 
                            --性能消耗较低 少量任意世界发送可以从主世界中转
    FullMesh = 2            --全连接 支持任意世界发送到指定世界 性能消耗较高
}

--[[
    event类  其实正确名称应该是 Connect 连接
    用于建立个单个世界的连接、并进行接收发送数据
    主要方法：
    push    由soraworldevent组件调用 用于推送事件到具体的世界 不推荐主动调用
    GetJson 由soraworldevent组件调用 用于发送事件的组装json
    SysEvent    由soraworldevent组件调用 用于处理事件接收和发送
    Clean       内部调用 用于清理缓存数据
]]--

local event = Class(function(self,inst,shardid,linkid)       --内部方法  合成json
    self.inst = inst
    self.debug = inst.debug
    self.linkid = linkid or 1       --连接的世界的ID
    --写入路径
    self.readpath = basepath..inst.namespace.."_"..inst.masterid.."_"..self.linkid.."_"..inst.worldid
    --读取路径
    self.writepath = basepath..inst.namespace.."_"..inst.masterid.."_"..inst.worldid.."_"..self.linkid
    --print(self.readpath,self.writepath)
    self.t = {                      --缓存表，用来发送时直接解析成json
            fromshard = shardid,    --来源ID
            send = 0,               --已发送事件序号
            recive = 0,             --已接受事件序号
            events = {},            --缓存的事件
            }
    self:Clean()                    --清除历史数据
end)

function event:push(event,data)        --内部方法
    --event 事件名称  
    --data  事件数据
    self.t.send = self.t.send +1       --去TM的 溢出就溢出吧 谁爱整谁整
    local e = {}                       --新的事件 
    e.event = event                    --事件名称
    e.data = data                      --事件数据
    e.send = self.t.send               --事件ID
    self.t.events['_'..self.t.send]=e       --加入表
end

function event:GetJson()            --内部方法  组装json
    local r,ret = pcall(json.encode,self.t) --组装json
    return ret 
end
local function protect(x,y)
   --print("Error-Protect",x)
   return y
end
function event:SysEvent()        --接受和发送事件
    local rf,des  = io.open(self.readpath,"r")  --读取文件
    local topush = {}               --接收的事件
    if rf then 
        local r = rf:read('*a')
        rf:close()
        local _,rjs = pcall(json.decode,r)  --解析文件
        if rjs then 
        --清除对方已确认接收的
            if rjs.recive then 
                for k,v in pairs(self.t.events) do 
                    if v and v.send < rjs.recive then       --小于已接收的全部清除
                        self.t.events[k] = nil
                    end
                end
                self.recive = rjs.recive                    --刷新接收计数
            end
            --读取事件
            topush = rjs.events or {}
            for k,v in pairs(topush) do 
                if (v.send or protect("v.send",0)) <= (self.t.recive or protect("self.t.recive",0)) then     --已接收过的不再处理
                    topush[k]=nil
                end
            end
            self.t.recive = rjs.send or protect("rjs.send",0)       --接收成功 记录一下
            --PrintTable(rjs)
            
        end
    end
    --写入要发送的事件
    local sjs = self:GetJson()
    local sf = io.open(self.writepath,"w")
    if sf then
        sf:write(sjs)
        sf:close()
    end
    --推送事件
    for k,v in pairs(topush) do
        if v then
            self.inst:PushEventToWorld(v.event,v.data)
        end
    end
    
end

function event:Clean()        --清除缓存
    local f = io.open(self.readpath,"w")
    if f then
       f:close()
    end

    f = io.open(self.writepath,"w")
    if f then
       f:close()
    end
end

--[[
    soraworldevent类     一般挂在单例实体上 例如TheWorld 请保证同一namespace的组件只有一个在工作 否则结果未知
    用于Modder推送和接收事件
    主要方法:
    Init    初始化,初始化之后不允许再进行Set
    Nil     无效方法
    SetNameSpace    设置命名空间 提供一个字符串 用于多个组件之间区分数据
    SetWorkMode     设置工作模式 
                    1 主从模式 主世界和所有世界建立连接，从世界只和主世界建立连接 节省性能(建立2*N条连接)，但是从世界之间无法直接传递消息，可以通过主世界进行中转
                    2 全连接   所有世界之间两两建立连接，性能消耗较高(建立N*(N-1)条连接)，
                    但是可以从世界之间直接传递消息
    SetTimer        设置同步时间 每X秒同步一次事件，时间越短同步越快 消耗性能越高
    SysEvent        向events分发Sysevent任务 不需要手动调用
    PushEvent       向其他世界推送一个事件 所有的数据需要包含在data里面 不支持实例和循环表
                    worldid 参数 向指定世界发送消息，否则为全部世界，(需要已建立连接)
                    pushnow 参数 立即触发写入操作，等待目标世界下次读取即可,可以略微快一点
    PushEventToWorld    推送消息到当前世界   不需要手动调用
    ListenForEvent      监听指定事件  会自动附带namespace 也可以调用官方方法直接监听 namespace+事件名
    RemoveEventCallback     移除指定事件的监听
    
]]--

local soraworldevent = Class(function(self, inst)
    self.inst = inst
    self.masterid = "master"
    -- 2599547308
    self.workmode = 1       --工作模式 默认只接受从世界发送给主世界的 节省性能
    self.namespace = TUNING.SORAMODNAME:sub(-5,-2)  --默认命名空间
    self.worldid = TheShard:GetShardId()
    self.events = {}
    inst:DoTaskInTime(1,function() self:Init() end)      --1秒后初始化 初始化后不允许再次设置
    --self.readtask = self.inst:D
end)

function soraworldevent:Init()
    local shard = TheWorld.net 
    --获取主世界SESSIONID
    self.masterid = (shard and shard.components.shardstate and shard.components.shardstate:GetMasterSessionId()) or "master"
    print("masterid",self.masterid)
    print("namespace",self.namespace)
    print("workmode",self.workmode)
    print("systime",self.systime)
    --开始刷新任务
    self.systask = self.inst:DoPeriodicTask(self.systime or 10,function() self:SysEvent() end)
    --将设置方法变成无效
    self.SetWorkMode = self.Nil
    self.SetNameSpace = self.Nil
    self.SetTimer = self.Nil
end
function soraworldevent:Nil()  end --使方法无效化


function soraworldevent:SetNameSpace(namespace)  --设置命名空间 每个命名空间之间独立工作
    self.namespace = namespace or "worldevent"
    
end
function soraworldevent:SetWorkMode(mode)  --设置工作模式 
    assert((type(mode) == "string" and workmode[mode]) or (type(mode) == "number" and mode >0 and mode <2) ,"请设置正确的工作模式")
    self.workmode = type(mode) == "string" and workmode[mode] or mode
end
function soraworldevent:SetTimer(systime)  --设置同步时间 越短越耗性能 越长同步越慢
    self.systime  = systime or 10         --默认十秒同步一次 
end
function soraworldevent:SysEvent()       --同步事件
    self.shardlist = Shard_GetConnectedShards()
    if not TheWorld.ismastershard and self.masterid == TheWorld.meta.session_identifier then
        
        local shard = TheWorld.net
        self.masterid = (shard and shard.components.shardstate and shard.components.shardstate:GetMasterSessionId()) or "master"
        print("TryToFixMasterid",self.masterid)
    end
    if self.debug and GetTime() > 30 and not TUNING.FLDEBUGCOMMAND then  --如果开启了debug  
        --输出一下debug信息
        local logfile = io.open(basepath.."debuglog.log",'r')
        local a = logfile:seek()                --获取一下当前的长度
        local readlog =  logfile:read(a)
        logfile:close()
        logfile = io.open(basepath.."debuglog.log",'w') --重新打开一下写出的
        logfile:write(readlog)
        logfile:write("\n--------------------------------\n")--开始新一行
        logfile:write(self.inst:GetDebugString())       --打印一下调试信息
        logfile:close()
    end
    --删除已经断开连接的世界
    for k,v in pairs(self.events) do
        if not self.shardlist[v.linkid] then
            print("停止世界同步->",self.namespace,k)
            v:Clean()
            self.events[k] = nil
        end
    end
    --连接未连接的世界
    
    for k,v in pairs(self.shardlist) do       
        if k == "1" or TheWorld.ismastershard or self.workmode==2  then
            if not self.events[k] then
                print("开始世界同步->",self.namespace,k)
                self.events[k] = event(self,self.worldid,k)
            end
        end
    end
    
    --同步
    for k,v in pairs(self.events) do
        v:SysEvent()
    end
end

function soraworldevent:PushEvent(event,data,worldid,pushnow)       --推送事件到其他世界
    --event 事件名 --data 数据 不支持实例和循环表 --worldid 目标世界ID 0 或者 nil 为全部 pushnow 立刻写入,比自动同步快一点点
    for k,v in pairs( self.events ) do
        if (not worldid ) or( worldid == 0) or ( worldid == v.linkid )then
            v:push( event , data )
            if pushnow then
                v:SysEvent()
            end
        end
    end
end

function soraworldevent:PushEventToWorld(event,data)       --读取事件并推送到自身事件 请勿调用
    self.inst:PushEvent(self.namespace..event,data)        --收到的事件会带上namespace  也可以自己直接外面监听
end
function soraworldevent:ListenForEvent(event,fn)       --封装好的监听事件
    self.inst:ListenForEvent(self.namespace..event,fn)        --收到的时间会带上namespace  也可以自己直接外面监听
end
function soraworldevent:RemoveEventCallback(event,fn)       --封装好的移除监听事件
    self.inst:RemoveEventCallback(self.namespace..event,fn)        --收到的时间会带上namespace  也可以自己直接外面移除
end
function soraworldevent:OnSave()        --并没有什么卵用
	return  {
            -- giftexp = self.giftexp,
            -- giftplayer = self.giftplayer
        }
       
end

function soraworldevent:OnLoad(data)        --并没有什么卵用
	-- if data then
        -- if data.giftexp then
        -- self.giftexp = data.giftexp or nil 
        -- self.giftplayer = data.giftplayer or {}
        -- self:CalcLevel()
        -- end
	-- end
end

return soraworldevent