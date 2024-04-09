--[[
授权级别:开放考级
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
]] local ismodmain = false
-- 自己设置一下 modkey 然后在 modmain里面 modimport一下就行
local modkey = TUNING.SORAMODNAME
local logtopath = true -- 如果需要输出本地日志 请设置成true
local path = nil -- 默认输出路径 可以自己设置
local DontTraceEntity = true -- 堆栈追踪的时候 不详细展开实体 (太占空间了)
local TableTraceLevel = 1 -- 堆栈追踪的时候 表展开的等级 (太占空间了) 默认4
-- 如果没自己设置路径的话 要在mod目录创建一个log文件夹 log自动保存在里面
-- 如果上传的话 里面记得只是留个文件 不然wg的会自动删除空目录 st的不清楚

if not rawget(getfenv(1), "getdebugstack") then
    -- 是在modmain环境里
    ismodmain = true
end
if ismodmain and not TheSim then -- 没有一键global 补一个
    GLOBAL.setmetatable(env, {
        __index = function(t, k)
            return GLOBAL.rawget(GLOBAL, k)
        end
    })
end
local function getextendinfo()
    -- 用于追加一些额外信息
    local str = ""
    if package.loaded["soraupdate/manager"] and SoraUpdate then
        str = str .. "SoraUpdateInfo:\n"
        local s, j = pcall(json.encode, SoraUpdate.data)
        str = str .. j or "Data Error" .. "\n"
    end
    return str
end
local matchname = {
    modprefabinitfns = 1,
    SerializeWorldSession = 1,
    SerializeUserSession =1 ,
}
local mt = getmetatable(_G)
local mtd = {}
if mt and mt.__declared then
    mtd = mt.__declared
end
local function formatvar(name, value, level, visit)
    -- 格式化变量用于显示
    level = level or 1
    visit = visit or {
        [mtd] = 1,
        [mt]=1
    }
    local max = 30 -- 最多30行
    local f = string.rep("\t", level + 2)
    local t = type(value)
    if t == "table" then
        if visit[value] then
            return "visited " .. tostring(name or "U") .. " : " .. tostring(value or "nil")
        end
        visit[value] = true
        if DontTraceEntity and EntityScript.is_a(value, EntityScript) then
            return tostring(name or "U") .. " : " .. tostring(value or "nil")
        end -- 不展开实体 太大了
        local str = {}
        if level > TableTraceLevel then
            return tostring(name or "U") .. " : " .. tostring(value or "nil")
        end
        if next(value) then
            table.insert(str, tostring(name or "U") .. " : " .. tostring(value) .. "{")
            local count = 0
            for k, v in pairs(value) do
                count = count + 1
                if count > max then
                    table.insert(str, "\tmore.....,")
                    break
                else
                    table.insert(str, "\t" .. formatvar(k, v, level + 1, visit) .. ",")
                end
            end
            table.insert(str, "}")
        else
            table.insert(str, tostring(name or "U") .. " : " .. tostring(value) .. "{} ")
        end
        return table.concat(str, "\n" .. f)
    elseif t == "function" then
        local info = debug.getinfo(value)
        local source = info.source
        if #source > 100 then
            source = "load"
        end
        return "fn:" .. tostring(name or "U") .. " src:" .. source .. "(" .. info.linedefined .. "-" ..
                   info.lastlinedefined .. ")"
    end
    local varstr = tostring(value or "nil")
    if #varstr > 200 then 
        varstr = varstr:sub(1,200) .. "...more"
    end
    return tostring(name or "U") .. " : " .. varstr
end
local function  donttracefn(info)
    if matchname[info.name ] then return true end
    if info.source:find("scripts/shardindex") and info.name =="Save" then 
        return true 
    end
    return false 
end
local function getextendtrace(start)
    -- 追踪堆栈上的local 和 upvalue
    local get = {}
    for i = start + 3, 101, 1 do

        local info = debug.getinfo(i)
        if info then
            table.insert(get, string.format("Level: %d Function Info:", i-9))
            for k, v in pairs(info) do
                table.insert(get, string.format("\t%s : %s", tostring(k), tostring(v)))
            end
            if not donttracefn(info) then
                -- local 
                local index = 0
                while true do
                    index = index + 1
                    local k, name = debug.getlocal(i, index)
                    if k then
                        table.insert(get, "\t\tLocal " .. formatvar(k, name))
                    else
                        break
                    end
                end
                -- upvalue
                local index = 0
                while info.func do
                    index = index + 1
                    local k, name = debug.getupvalue(info.func, index)
                    if k then
                        if matchname[k] then
                            table.insert(get, "\t\tUpvalue " .. k .. " Don't Trace")
                        else
                            table.insert(get, "\t\tUpvalue " .. formatvar(k, name))
                        end
                    else
                        break
                    end
                end
            end

        else
            break
        end
    end
    return table.concat(get, "\n")
end
if logtopath and not path then
    if ismodmain then
        path = "../mods/" .. modname .. "/log/"
    else
        local info = debug.getinfo(getextendinfo).source
        local modname = info and info:match("%.%./mods/([^/]+)/")
        if modname then
            path = "../mods/" .. modname .. "/log/"
        end
    end
end

local function InitLogUpload()
    local logcache = nil
    local function clientlogcache(str)
        table.insert(logcache, str)
    end
    if not TheNet:IsDedicated() then
        logcache = {}
        AddPrintLogger(clientlogcache)
    end
    local oldgetdebugstack = getdebugstack
    -- 组包log
    local function getenvinfo()
        local info = ""
        return info
    end
    -- 获取在线玩家信息
    local function getplayerinfo()
        local info = ""
        for k, v in pairs(AllPlayers or {}) do
            if k and v then
                info = info ..
                           string.format("%s %s %s \n", v.name or "NoName", v.userid or "NoUserid", v.prefab or "UnKnow")
            end
        end
        return info
    end

    local function getserverinfo()
        local info = ""
        -- 平台和服务器信息
        info = info .. string.format("PLATFORM : %s  IsServer: %s IsDedicated: %s World: %s  \n", PLATFORM or "UnKnow",
            tostring(TheNet:GetIsServer()), tostring(TheNet:IsDedicated()), TheWorld and TheWorld.prefab or "UnKnow")
        -- 开启的mod
        if ModManager then
            for k, v in pairs(ModManager.mods) do
                if k and v and v.modinfo then
                    info = info ..
                               string.format("MOD : %s\t%s\t%s\t%s\n", v.modname or "UnKnow",
                            v.modinfo.name or "UnKnowMod", v.modinfo.author or "UnKnowAuthor",
                            v.modinfo.version or "UnKnow")
                    if v.modname then
                        local config, temp_options = KnownModIndex:GetModConfigurationOptions_Internal(v.modname, false)
                        if config and type(config) == "table" then
                            if type(temp_options) == "table" then
                                for kc, kv in pairs(temp_options) do
                                    info = info .. string.format("\tTempOption  %s  : %s \n", kc or "nil", kv or "nil")
                                end
                            end
                            for kc, kv in pairs(config) do
                                if type(kv) == "table" then

                                    info = info ..
                                               string.format("\tConfig  %s  : %s \n", tostring(kv.name or "nil"),
                                            tostring(kv.saved or kv.default or "nil"))
                                elseif type(kv) == "boolean" then
                                    info = info ..
                                               string.format("\tConfig  %s  : %s \n", tostring(kc or "nil"),
                                            tostring(kv and "True" or "false"))
                                else
                                    info = info ..
                                               string.format("\tConfig  %s  : %s \n", tostring(kc or "nil"),
                                            tostring(kv or "nil"))
                                end
                            end
                        end
                    end
                end
            end
        end
        -- WorldState
        if TheWorld and TheWorld.state then
            info = info .. "WorldState：\n"
            for k, v in pairs(TheWorld.state) do
                info = info .. string.format("\t  %s  : %s  \n", tostring(k or "nil"), tostring(v or "nil"))
            end
        end
        return info
    end

    local function getserverlog()
        local info = "Can't Read Server Log"
        local function onload(load_success, str)
            if load_success then
                info = str
            end
        end
        TheSim:GetPersistentString("../server_log.txt", onload)
        if logcache then
            info = table.concat(logcache, "\n")
        end
        -- 筛除一些没意义的
        info = info:gsub('^.+GetModsToLoad inserting moddir.+$', '')
        info = info:gsub('^.+Overriding mod.+option.+$', '')
        info = info:gsub('^.+Could not find anim.+$', '')
        info = info:gsub('^.+MiniMapComponent::AddAtlas.+$', '')
        info = info:gsub('^.+Could not preload undefined prefab.+$', '')
        info = info:gsub('^.+Registering prefab file.+$', '')
        info = info:gsub('^.+Mod: .+ %(.+%)%s+.+$', '')
        if #info > 100000 then -- 最大抓取100k
            info = info:sub(-100000, -1)
        end
        return info
    end
    local function packlog(ret, start)
        local retlog = table.concat(ret, "\n")
        local _, envinfo = pcall(getenvinfo)
        local _, playerinfo = pcall(getplayerinfo)
        local _, ExtendTrace = pcall(getextendtrace, start)
        local _, extendinfo = pcall(getextendinfo)
        local _, serverinfo = pcall(getserverinfo)
        local _, serverlog = pcall(getserverlog)
        local alllog = string.format([[---------------------Envinfo---------------------------
%s
---------------------Playinfo---------------------------
%s
---------------------Traceback--------------------------
%s
---------------------ExtendTrace--------------------------
%s
---------------------Extendinfo--------------------------
%s
---------------------ServerInfo-------------------------
%s    
---------------------Server_Log-------------------------
%s
]], envinfo or "ERROR", playerinfo or "ERROR", retlog or "ERROR", ExtendTrace or "ERROR", extendinfo or "",
            serverinfo or "ERROR", serverlog or "ERROR")
        -- 给饥荒加一份 方便其他modder排查
        local last = 1
        local num = 0
        TheSim:LuaPrint("----ErrorTraceStart By LogUpLoad---")
        TheSim:LuaPrint(ExtendTrace:sub(last, last + num - 2))
        for i = 1, #ExtendTrace, 1 do
            num = num + 1
            if num > 3000 and ExtendTrace:byte(num + last - 1) == 10 then
                TheSim:LuaPrint(ExtendTrace:sub(last, last + num - 2))
                num = 0
                last = i
            end

        end
        TheSim:LuaPrint(ExtendTrace:sub(last, -1))
        TheSim:LuaPrint("----ErrorTraceEnd By LogUpLoad---")
        return alllog
    end

    function getdebugstack(res, start, top, bottom, ...)
        start = (start or 1) + 2

        local logid = os.date("%Y-%m-%d_%H-%M-%S_") .. (TheWorld and TheWorld.meta.session_identifier or "Load") ..
                          (TheNet:GetIsServer() and ("_server_" .. TheShard:GetShardId()) or "_client")
        local ret = oldgetdebugstack(res, start, top, bottom, ...)
        local success, topost = pcall(packlog, ret, start)
        if err then
            topost = err .. "\n" .. table.concat(ret, "\n")
        end
        TheSim:QueryServer("http://jh.fl.lovetly.top/logupload.php?mod=" .. modkey .. "&id=" .. logid, function()
        end, "POST", topost or "Error") -- packlog(ret))
        -- io.open()
        if logtopath and path then -- 输出本地日志
            local file = io.open(path .. logid .. ".log", "w")
            if file then
                file:write(topost)
                file:close()
            end
        end
        if err then
            table.insert(ret, 1, err)
        end
        -- table.insert(ret,1,"已自动上报LOG,LogId = "..logid)
        local t = os.clock() + #ret / 102400 -- 认为每秒可以上传100K数据 则预计上传结束时间为t
        while os.clock() < t do
        end -- 死循环卡住 等上传完成
        return ret
    end

    if ismodmain then
        -- modmain 环境要补一下GLOBAL
        GLOBAL.getdebugstack = getdebugstack
    end
end

if ismodmain then
    AddSimPostInit(InitLogUpload)
elseif TheWorld then -- 引用的时候 TheWorld 已经生成了
    InitLogUpload()
else -- 这个时候不在modmain里面 而且还没生成TheWorld 那么估计是在modmain里面require的 
    for k, v in pairs(ModManager.mods) do
        if k and v and v.postinitfns and v.postinitfns.SimPostInit then
            table.insert(v.postinitfns.SimPostInit, InitLogUpload) -- 调皮 我自己来吧
            break
        end
    end
end
