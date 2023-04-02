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
版本:v0.2
需要的自提
]]
print("upvaluehelper loaded")
--调用示例 获取upvalue
--[[
	local upvaluehelper = require "utils/upvaluehelp"
	local containers = require "containers"
	local params = upvaluehelper.Get(containers.widgetsetup,"params")  --获取containers.widgetsetup的名为 params的upvalue 必须在containers.widgetsetup 或者他调用的程序里使用到了 params 
	if params then
		params.cookpot.itemtestfn = function() ... end					--因为返回值是表 可以直接操作 否则需要使用Set
	end
]]--
local visit = {}    --保存已经访问的 防止有嵌套
local visitnum = 0
local function TryToClose(name,value,level)
    if name  or value then      --一旦有返回值了 代表找到了 
        visit = {}
        visitnum = 0
        return value
    end
    if level == 1 then          --只有没找到才会执行到这儿
        visit = {}
        visitnum = 0
    end
end
local function Get(fn,name,file)	
    local level = visitnum + 1
	if type(fn) ~= "function" then TryToClose(nil,nil,level) return end
    if visit[fn] then TryToClose(nil,nil,level) return end      --已访问过就返回
    visit[fn] = 1
    visitnum = visitnum + 1
    local i = 1
	while true do
		local upname,upvalue = debug.getupvalue(fn,i)
        if not upname then break end    --已经没了 跳出
		if upname and upname == name then
			if file and type(file) == "string" then			--限定文件 防止被别人提前hook导致取错
				local fninfo = debug.getinfo(fn)
				if fninfo.source and fninfo.source:match(file) then
					return TryToClose(upname,upvalue,level)
				end
			else
				return TryToClose(upname,upvalue,level)
			end
		end
		if upvalue and type(upvalue) == "function" and not visit[upvalue] then  --没有访问过的
			local upupvalue  = Get(upvalue,name,file) --找不到就递归查找
			if upupvalue then return TryToClose(name,upupvalue,level) end
		end
        i = i + 1
	end
    TryToClose(nil,nil,level)   --都没找到也要清除缓存
end

--调用示例 设置upvalue
--[[
local upvaluehelper = require "utils/upvaluehelp"
	local containers = require "containers"
	local newtable = {}
	local params = upvaluehelper.Set(containers.widgetsetup,"params",newtable)  --获取containers.widgetsetup的名为 params的upvalue 

]]--

local function Set(fn,name,set,file)
    local level = visitnum + 1
    if type(fn) ~= "function" then TryToClose(nil,nil,level) return end
    if visit[fn] then TryToClose(nil,nil,level) return end      --已访问过就返回
    visit[fn] = 1
    visitnum = visitnum + 1
    local i = 1
	while true do
		local upname,upvalue = debug.getupvalue(fn,i)
        if not upname then break end    --已经没了 退出
		if upname and upname == name then
			if file and type(file) == "string" then			--限定文件 防止被别人提前hook导致取错
				local fninfo = debug.getinfo(fn)
				if fninfo.source and fninfo.source:match(file) then
					return TryToClose(debug.setupvalue(fn,i,set),nil,level)
				end
			else
				return TryToClose(debug.setupvalue(fn,i,set),nil,level)
			end
		end
		if upvalue and type(upvalue) == "function" and not visit[upvalue] then
			local upupvalue  = Set(upvalue,name,set,file) --找不到就递归查找
			if upupvalue then return TryToClose(upupvalue,nil,level) end
		end
        i = i + 1
	end
    TryToClose(nil,nil,level)   --都没找到也要清除缓存
end

local function FunctionTest(fn,file,test,source,listener)
	if fn and type(fn) ~= "function" then return false end
	local data = debug.getinfo(fn)
	if file and type(file) == "string" then		--文件名判定
		local matchstr = "/"..file..".lua" 
		if not data.source or not data.source:match(matchstr) then
			return false
		end
	end
	if test and type(test) == "function" and  not test(data,source,listener) then return false end	--测试通过
	return true
end

--调用示例 获取指定事件的函数 并移除
--[[
	local upvaluehelper = require "utils/upvaluehelp"
	local fn = upvaluehelper.GetEventHandle(TheWorld,"ms_lightwildfireforplayer","components/wildfires")
	
	
	if fn then
		TheWorld:RemoveEventCallback("ms_lightwildfireforplayer",fn)
	end
	
]]--

local function GetEventHandle(inst,event,file,test)
	if type(inst) == "table" then
		if inst.event_listening and inst.event_listening[event] then		--遍历他在监听的事件 我在监听谁
			local listenings = inst.event_listening[event]
			for listening,fns in pairs(listenings) do		--遍历被监听者
				if fns and type(fns)=="table" then
					for _,fn in pairs(fns) do
						if FunctionTest(fn,file,test,listening,inst) then	--寻找成功就返回
							return fn
						end
					end
				end
			end
		end
	
	
		if inst.event_listeners and inst.event_listeners[event] then	--遍历监听他的事件的	谁在监听我
			local listeners = inst.event_listeners[event]
			for listener,fns in pairs(listeners) do		--遍历监听者
				if fns and type(fns)=="table" then
					for _,fn in pairs(fns) do
						if FunctionTest(fn,file,test,inst,listener) then	--寻找成功就返回
							return fn
						end
					end
				end
			end
		end
	end
end


return {
	Get = Get,
	Set = Set,
	GetEventHandle = GetEventHandle,
}