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
]]
--[[作者:风铃
版本:3
需要的自提
用于hook animstate之类的userdata    

v3更新 
   增加了 args 用于存放传入参数 可以用于修改然后传递后后面的函数
]]
--调用示例1 临时hook和取消
--[[
    --需要有一键GLOBAL
    require "UserDataHook"
    
	local hook1 = UserDataHook.MakeHook("AnimState","SetBank",function(x,y,z) print("hook成功1",x,y,z) end)
    local hook2 = UserDataHook.MakeHook("AnimState","SetBank",function(x,y,z) print("hook成功2",x,y,z) return true,1,2,3 end)       -返回true提前返回 1,2,3
    local hook3 = UserDataHook.MakeHook("AnimState","SetBank",function(x,y,z) print("hook成功3",x,y,z) end)
    UserDataHook.Hook(ThePlayer，hook1)
    UserDataHook.Hook(ThePlayer，hook2)
    UserDataHook.Hook(ThePlayer，hook3)
    ThePlayer.AnimState:SetBank("wilson")
    UserDataHook.UnHook(ThePlayer，hook2)
    ThePlayer.AnimState:SetBank("wilson")
    UserDataHook.UnHook(ThePlayer，hook1)
    UserDataHook.UnHook(ThePlayer，hook3)
]]--

--调用示例2 hookprefab  复用hook 节约内存
--[[
    --需要有一键GLOBAL
    require "UserDataHook"
    
	local hook1 = UserDataHook.MakeHook("AnimState","SetBank",function(x,y,z) print("hook成功1",x,y,z) end)
    AddPlayerPostInit(function(inst)
        UserDataHook.Hook(inst,hook1)
    end)
]]--


--调用示例2 修改AnimState.SetBuild 的参数
--[[
    --需要有一键GLOBAL
    require "UserDataHook"
    local hook1
	hook1 = UserDataHook.MakeHook("AnimState","SetBuild",function(x,y,z)
        local args = hook1.args
        if args and args[1] == "wilsonhook" then
            args[1] = "wilson"
        end
        return false
    end)
    AddPlayerPostInit(function(inst)
        UserDataHook.Hook(inst,hook1)
    end)
]]--

global("UserDataHook")
local currentversion = 3
if not UserDataHook then
    UserDataHook = {}
end
local path = debug.getinfo(function() end).source
--检测到更高或者同版本的自动返回高版本的
if UserDataHook.version and UserDataHook.version >= currentversion then
    print("UserDataHookFind,return v",UserDataHook.version,path)
    return UserDataHook
end
if UserDataHook.version and UserDataHook.version < currentversion then
    print("UserDataHookUpdate",UserDataHook.version,"to",currentversion,path)
elseif UserDataHook.version and UserDataHook.version >= currentversion then
    print("UserDataHookNewVesion",UserDataHook.version,currentversion,path)
else
    print("UserDataHookLoad",currentversion,path)
end
--如果不存在则开始覆盖
UserDataHook.version = currentversion
UserDataHook.hooks = UserDataHook.hooks or {} --用于缓存已生成的镜像函数
local U = UserDataHook --本地化 提高调用时的寻址速度
function UserDataHook.OnRemove(inst)   --卸载时清理所有hook
    if inst.userdatas then
        for k,v in pairs(inst.userdatas) do
            inst[k] = v
            inst.userdatas[k]= nil
        end
        inst.userdatas = nil
    end 
    if  inst.userdatahooks then
        for k,v in pairs(inst.userdatahooks) do
            inst.userdatahooks[k]= nil
        end
        inst.userdatahooks = nil
    end
end
function UserDataHook.Init(inst)
    if not inst.userdatas then  --谁初始化 谁移除
        inst.userdatas = {}
        inst.userdatahooks = {}
        inst:ListenForEvent("onremove",U.OnRemove)
    end
end

UserDataHook.meta = {__index = function(tb,k) --找不到的默认用这个表寻找
    if tb and tb.inst and tb.name then
        if U.hooks[tb.name] and U.hooks[tb.name][k] then        --有生成好的镜像函数就拿来直接用
            rawset(tb,k,U.hooks[tb.name][k])
            return U.hooks[tb.name][k]
        end
        if _G[tb.name][k] then   --找到原来的函数了
            local tbname = tb.name
            local fn = function(t,...) 
                return _G[tbname][k](t.inst.userdatas[tbname],...)
            end
            U.hooks[tb.name][k] = fn        --缓存生成的镜像函数
            rawset(tb,k,fn)                 --缓存到实体的伪userdata里
            return fn
        end
    end
end}
function UserDataHook.MakeHook(dataname,fnname,fn)
    --hook哪个userdata的哪个函数 
    --例如 MakeHook("AnimState","SetBank",fn)
    --fn 定义 参数 inst,原参数  返回 true or false,返回值     返回true停止调用 并返回返回值 否则继续自动调用下一个
    return {
        dataname = dataname,
        fnname   = fnname,
        fn = fn,
        args = {},      --调用参数              --hook调用的时候自动填充
        data = {},      --用于保存一些数据      由hook自己保存
        env = {},       --用于保存环境信息      --hook调用的时候自动填充  暂时还不知道放什么 先预留
    }
end

function UserDataHook.Hook(inst,hook)
    --参数  实体  hook
    if not (hook and hook.dataname and hook.fnname and hook.fn) then return end --别乱传参数
    local dataname,fnname = hook.dataname,hook.fnname
    if not (inst[dataname] and inst[dataname][fnname] )then return end --都没有 hook啥
    U.Init(inst)
    --原有的userdata放在userdatahooks里面
    if not inst.userdatahooks[dataname] or type(inst[dataname]) ~= "table" then
        inst.userdatas[dataname] = inst[dataname]       --保存原有userdata
        inst.userdatahooks[dataname] = {}               --hook表
        inst[dataname] = {inst=inst,name = dataname}    --伪userdata
        setmetatable(inst[dataname],U.meta) --设置元表 用于自动寻找原函数
    end
    if not inst.userdatahooks[dataname][fnname] then inst.userdatahooks[dataname][fnname] = {} end  --如果没有就创建函数表
    table.insert(inst.userdatahooks[dataname][fnname],hook)     --插入新的hook
    --切换成hook调用函数
    local fn 
    if U.hooks[dataname] and U.hooks[dataname][fnname.."_hook"] then        --有hook调用则直接拿来用
        fn = U.hooks[dataname][fnname.."_hook"]
    else
        fn = function(t,...)        --hook链函数           --没有就重新生成
            if t and t.name and t.inst then
                local hooks = t.inst.userdatahooks[dataname][fnname] 
                local args = {...}
                local env = {}
                if hooks then
                    for k,v in pairs(hooks) do              --遍历hook链
                        v.args = args
                        v.env = env
                        local rettable = {v.fn(t.inst,unpack(v.args))}
                        if rettable and rettable[1] then table.remove(rettable,1) return unpack(rettable) end        --有返回返回true 就全部返回
                    end
                    return t.inst.userdatas[dataname][fnname](t.inst.userdatas[dataname],unpack(args))       --调用官方原版函数
                end
            end
        end 
        if not U.hooks[dataname] then U.hooks[dataname] = {} end
        U.hooks[dataname][fnname.."_hook"]  = fn        --保存函数 用来复用
    end
    rawset(inst[dataname],fnname,fn)
    return inst.userdatas[dataname][fnname]
end


function UserDataHook.UnHook(inst,hook) --取消hook
    --参数  实体  hook
    if not (hook and hook.dataname and hook.fnname and hook.fn) then return end --别乱传参数
    local dataname,fnname = hook.dataname,hook.fnname
    if not (inst[dataname] and inst[dataname][fnname] )then return end --都没有 hook啥
    if not (inst.userdatahooks[dataname] and inst.userdatahooks[dataname][fnname]) then return end  --没人hook过 不需要取消
    for k,v in pairs(inst.userdatahooks[dataname][fnname]) do
        if v == hook then
            table.remove(inst.userdatahooks[dataname][fnname],k)        --移除
            if not next(inst.userdatahooks[dataname][fnname]) then      --如果表为空 则移除hook调用函数 下次调用的时候 自动触发元表 获取源函数
                rawset(inst[dataname],fnname,nil)
            end
            return
        end
    end
end

function UserDataHook.Call(inst,hook,...)
    --传入 hook 或者 {"AnimState","SetBank"} 这样的
    --快速取未hook的函数
    
    if not inst.userdatas  then return end
    local data = hook.dataname or hook[1]
    local fn  = hook.fnname or hook[2]
    if data and fn and inst.userdatas[data] and inst.userdatas[data][fn] then
        return inst.userdatas[data][fn](inst.userdatas[data],...)
    end
end
return U