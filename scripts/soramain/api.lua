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
-- Upvaluehelper
up = require("utils/soraupvaluehelper")
GLOBAL.SoraUp = up
userdata = require("utils/sorauserdatahook")
GLOBAL.SoraUserData = userdata

local moddir = KnownModIndex:GetModsToLoad(true)
local enablemods = {}

for k, dir in pairs(moddir) do
    local info = KnownModIndex:GetModInfo(dir)
    local name = info and info.name or "unknow"
    enablemods[dir] = name
end
-- MOD是否开启
function IsModEnable(name)
    for k, v in pairs(enablemods) do
        if v and (k:match(name) or v:match(name)) then return true end
    end
    return false
end
GLOBAL.SoraIsModEnable = IsModEnable
GLOBAL.SoraEnableMods = enablemods
local mythenable = nil
function IsMythEnable()
    if mythenable ~= nil then return mythenable end
    if IsModEnable("Myth Words") then
        mythenable = true
        return true
    elseif IsModEnable("%[DST%] 神话书说") then
        mythenable = true
        return true
    elseif IsModEnable("workshop%-1991746508") then
        mythenable = true
        return true
    elseif IsModEnable("workshop%-2199027653598524334") then
        mythenable = true
        return true
    end
    return false
end
-- GetInventoryItemAtlas is the new way of getting item atlas in porkland and DST

-- GetInventoryItemAtlas is the new way of getting item atlas in porkland and DST

local imagecache = {}
local repl = {}
local notimagecache = {}
function SoraGetImage(na)       --mod加载加载过程中请勿调用 不准确
    local name = repl[na] or na
    local t = name
    if t:sub(-4):lower() ~= ".tex" then
        t = t..".tex"
    end
    if notimagecache[name] then
        return nil,nil
    end
    if imagecache[name] then
        return imagecache[name].atlas,imagecache[name].image
    end
    if TheSim:AtlasContains("images/inventoryimages.xml", t) then
        imagecache[name] ={ atlas = "images/inventoryimages.xml",image=t}
        return "images/inventoryimages.xml",t
    elseif TheSim:AtlasContains("images/inventoryimages1.xml", t) then
        imagecache[name] = { atlas = "images/inventoryimages1.xml",image=t}
        return "images/inventoryimages1.xml",t
    elseif TheSim:AtlasContains("images/inventoryimages.xml", 'quagmire_'..t) then
        imagecache[name] ={ atlas = "images/inventoryimages.xml",image='quagmire_'..t}
        return "images/inventoryimages.xml",'quagmire_'..t
    elseif TheSim:AtlasContains("images/inventoryimages1.xml", 'quagmire_'..t) then
        imagecache[name] = { atlas = "images/inventoryimages1.xml",image='quagmire_'..t}
        return "images/inventoryimages1.xml",'quagmire_'..t
    elseif TheSim:AtlasContains("images/inventoryimages2.xml", t) then
        imagecache[name] ={ atlas =  "images/inventoryimages2.xml",image=t}
        return "images/inventoryimages2.xml",t
    else
        if GLOBAL.Prefabs[name] then
            local assets = GLOBAL.Prefabs[name].assets or {}
            for ak,av in pairs(assets) do
                if type(av) == "table" and av.type and av.file and av.type == "ATLAS"  then
                    if TheSim:AtlasContains(av.file, t) then
                        imagecache[name] = { atlas = av.file,image=t}
                        return av.file,t
                    end
                end
            end
        end
        
        local trueatlas = softresolvefilepath("images/inventoryimages/"..name..".xml")
        if trueatlas and TheSim:AtlasContains(trueatlas, t) then
            imagecache[name] = { atlas = "images/inventoryimages/"..name..".xml",image=t}
            return "images/inventoryimages/"..name..".xml",t
        end
        trueatlas = GetInventoryItemAtlas(t,true)
        if trueatlas and TheSim:AtlasContains(trueatlas, t) then
            imagecache[name] ={ atlas =  trueatlas,image=t}
            return trueatlas,t
        end
        trueatlas = softresolvefilepath("images/"..name..".xml")
        if trueatlas and TheSim:AtlasContains(trueatlas, t) then
            imagecache[name] ={ atlas =  "images/"..name..".xml",image=t}
            return "images/"..name..".xml",t
        end
        trueatlas = softresolvefilepath("images/monkey_king_item.xml")
        if trueatlas and TheSim:AtlasContains(trueatlas, t) then
            imagecache[name] = { atlas = "images/monkey_king_item.xml",image=t}
            return "images/monkey_king_item.xml",t
        end
        if PREFABDEFINITIONS[name] then
            for idx,asset in ipairs(PREFABDEFINITIONS[name].assets) do
              if asset.type == "ATLAS" then
                trueatlas = asset.file
              end
            end
        end 
        if trueatlas and TheSim:AtlasContains(softresolvefilepath(trueatlas), t) then
            imagecache[name] = { atlas = trueatlas,image=t}
            return trueatlas,t
        end 
        
        if trueatlas and TheSim:AtlasContains(softresolvefilepath(trueatlas), 'quagmire_'..t) then
            imagecache[name] = { atlas = trueatlas,image='quagmire_'..t}
            return trueatlas,'quagmire_'..t
        end 
        
        for k,v in pairs(GLOBAL.Prefabs) do
            if k and k:match("MOD_") then
                local assets = v.assets or {}
                for ak,av in pairs(assets) do
                    if type(av) == "table" and av.type and av.file and av.type == "ATLAS"  then
                        if TheSim:AtlasContains(av.file, t) then
                            imagecache[name] = { atlas = av.file,image=t}
                            return av.file,t
                        end
                    end
                end
            end
        end
        notimagecache[name] = name
    return nil,nil
    end
end



GLOBAL.SoraGetImage = SoraGetImage
-- 弹出消息
local messages = {}
local PopupDialogScreen = require "screens/redux/popupdialog"
function SoraPushPopupDialog(title, message, button, fn)
    if not (ThePlayer and ThePlayer.HUD and ThePlayer.HUD.controls) then
        table.insert(messages,{title, message, button, fn})
    end
    local buttonstr = button or STRINGS.UI.POPUPDIALOG.OK
    local scr
    local function doclose() TheFrontEnd:PopScreen(scr) end
    scr = PopupDialogScreen(title, message, {
        {
            text = buttonstr,
            cb = function()
                doclose()
                if fn then fn() end
            end
        }
    })
    TheFrontEnd:PushScreen(scr)
    local screen = TheFrontEnd:GetActiveScreen()
    if screen then screen:Enable() end
    return scr
end
AddClassPostConstruct("widgets/controls",function(self)
    self.inst:DoTaskInTime(3,function()
    if next(messages) then
        for k,v in pairs(messages) do
            SoraPushPopupDialog(unpack(v))
        end
        messages = {}
    end
    end)
end)
GLOBAL.SoraPushPopupDialog = SoraPushPopupDialog

GLOBAL.SoraCD = function(ti) -- 内置CD
    local t = ti
    local last = -ti
    return function()
        local ct = GetTime()
        if (ct - ti) > last then
            last = ct
            return true
        end
        return false
    end
end

function GLOBAL.SoraGetRandom(tb) -- 抽奖池
    -- 需要的结构
    --[[    {
        a=5,        --前面的结果 后面的是权重 注意只支持整数
        v=3
    }]]
    local srctb = {}
    for k, v in pairs(tb) do for i = 1, v do table.insert(srctb, k) end end
    local pool = deepcopy(srctb)
    return function()
        if #pool < 1 then pool = deepcopy(srctb) end
        return table.remove(pool, math.random(#pool))
    end
end

function bhook(tb, name, fn)
    -- 简化版的beforehook   会丢弃fn的返回值
    assert(type(tb) == "table", "TryToBHook " .. type(tb))
    local oldfn = tb[name]
    if oldfn then
        tb[name] = function(...)
            fn(...)
            return oldfn(...)
        end
    else
        tb[name] = function(...) return fn(...) end
    end
    return oldfn, fn
end

function ehook(tb, name, fn)
    -- 简化版的endhook 会丢弃oldfn的返回值
    assert(type(tb) == "table", "TryToEHook " .. type(tb))
    local oldfn = tb[name]
    if oldfn then
        tb[name] = function(...)
            oldfn(...)
            return fn(...)
        end
    else
        tb[name] = function(...) return fn(...) end
    end
    return oldfn, fn
end

function rhook(tb, name, fn)
    -- 简化版的endhook 不丢弃oldfn的返回值
    assert(type(tb) == "table", "TryToRHook " .. type(tb))
    local oldfn = tb[name]
    if oldfn then
        tb[name] = function(...) return fn({oldfn(...)}, {...}) end
    else
        tb[name] = function(...) return fn({}, {...}) end
    end
    return oldfn, fn
end

function hook(tb, name, fn, endhook)
    -- 需要hook的表 函数名 新函数 先执行原函数 还是先执行新函数
    -- 注意hook的新函数需要额外返回一个 true or false 
    -- 在endhook下 会用新函数覆盖原函数的返回值  在beforehook模式下 会决定是否调用源函数
    assert(type(tb) == "table", "TryToHook " .. type(tb))
    local oldfn = tb[name]
    if oldfn then
        if endhook then
            tb[name] = function(...)
                local ret = {oldfn(...)}
                local fnret = fn(...)
                if fnret[1] and fnret[1] == true then
                    table.remove(fnret, 1)
                    return unpack(fnret)
                else
                    return unpack(ret)
                end
            end
        else
            tb[name] = function(...)
                local ret = {fn(...)}
                if ret[1] and ret[1] == true then
                    table.remove(ret, 1)
                    return unpack(ret)
                else
                    return oldfn(...)
                end
            end
        end
    end
    return oldfn, fn
end

function copytotable(dst, src) -- 拷贝到目标表里
    if type(dst) == "table" and type(src) == "table" then
        for k, v in pairs(src) do
            if type(v) == "table" and not dst[k] then -- 模板表里没有就直接复制过去
                dst[k] = v
            elseif type(v) == "table" and type(dst[k]) == "table" then -- 目标和自己都是表 就继续吧 
                copytotable(dst[k], v)
            elseif type(v) == "string" and type(dst[k]) ~= "table" then -- 模板不是
                dst[k] = v
            end
        end
    end
end

function comparetable(src, dst, name) -- 比较目标表
    if type(dst) == "table" and type(src) == "table" then
        for k, v in pairs(src) do
            if type(v) == "table" and not dst[k] then -- 模板表里没有就直接复制过去
                print("can't find table", name, k)
            elseif type(v) == "table" and type(dst[k]) == "table" then -- 目标和自己都是表 就继续吧 
                comparetable(v, dst[k], name .. "." .. k)
            elseif type(v) == "string" and not dst[k] then -- 模板不是
                print("can't find string", name, k)
            elseif type(v) == "string" and type(dst[k]) ~= "string" then -- 模板不是
                print("type error", name, k)
            end
        end
    end
end

function GLOBAL.SoraMakeWidgetMovable(s, name, pos, data) -- 使UI可移动 
    -- 第一个参数为UI实体 第二个参数为 位置存档的名称 注意如果是一个UI的多个实体 记得不同名称
    -- 第三个参数为默认位置 要求为Vector3 或者为空
    -- 第四个参数为扩展属性 是一个table 或者 nil 描述了实体的对齐的问题
    s.onikirimovable = {}
    local m = s.onikirimovable
    m.nullfn = function() end
    m.name = name or "default"
    m.self = s
    m.downtime = 0
    m.whiletime = 0.4
    m.cd = SoraCD(0.5)
    m.dpos = pos or Vector3(0, 0, 0)
    m.pos = pos or Vector3(0, 0, 0)
    m.ha = data and data.ha or 1
    m.va = data and data.va or 2

    m.x, m.y = TheSim:GetScreenSize()
    TheSim:GetPersistentString(m.name, function(load_success, str)
        if load_success then
            local fn = loadstring(str)
            if type(fn) == "function" then 
                m.pos = fn() 
                if not (type(m.pos) == "table" and m.pos.Get) then
                    m.pos = pos
                end
            end
        end
    end)
    s:SetPosition(m.pos:Get())
    m.OnControl = s.OnControl or m.nullfn
    s.OnControl = function(self, control, down)
        if self.focus and control == CONTROL_ACCEPT then
            if down then
                if not m.down then
                    m.down = true
                    m.downtime = 0
                end
            else
                if m.down then
                    m.down = false
                    m.OnClick(self)
                end
            end
        end
        return m.OnControl(self, control, down)
    end
    m.OnRawKey = s.OnRawKey or m.nullfn
    s.OnRawKey = function(self, key, down, ...)
        if s.focus and key == KEY_SPACE and not down and not m.cd() then
            s:SetPosition(m.dpos:Get())
            TheSim:SetPersistentString(m.name, string.format(
                                           "return Vector3(%d,%d,%d)",
                                           m.dpos:Get()), false)
        end
        return m.OnRawKey(self, key, down, ...)
    end

    m.OnClick = function(self)
        m:StopFollowMouse()
        if m.downtime > m.whiletime then
            local newpos = self:GetPosition()
            if TUNING.FLDEBUGCOMMAND then
                print(s, name, newpos:Get())
            end
            TheSim:SetPersistentString(m.name, string.format(
                                           "return Vector3(%f,%f,%f)",
                                           newpos:Get()), false)
        end
        if m.lastx and m.lasty and s.o_pos then
            s.o_pos = Vector3(m.lastx, m.lasty, 0)
        end
    end

    m.OnUpdate = s.OnUpdate or m.nullfn
    s.OnUpdate = function(self, dt)
        if m.down then if m.whiledown then m.whiledown(self) end end
        return m.OnUpdate(self, dt)
    end
    m.whiledown = function(self)
        m.downtime = m.downtime + 0.033
        if m.downtime > m.whiletime then m.FollowMouse(self) end
    end
    m.UpdatePosition = function(self, x, y)
        local sx, sy = s.parent.GetScale(s.parent):Get()
        local ox, oy = s.parent.GetWorldPosition(s.parent):Get()
        local nx = (x - ox) / sx
        if m.ha == 0 then
            x = x - m.x / 2
            nx = (x - ox) / sx
        elseif m.ha == 2 then
            x = x - m.x
            nx = (x - ox) / sx
        end
        local ny = (y - oy) / sy
        if m.va == 0 then
            y = y - m.y / 2
            ny = (y - oy) / sy
        elseif m.va == 1 then
            y = y - m.y
            ny = (y - oy) / sy
        end
        m.lastx = nx
        m.lasty = ny
        s.SetPosition(self, nx, ny, 0)
    end
    m.FollowMouse = function(self)
        if m.followhandler == nil then
            m.followhandler = TheInput:AddMoveHandler(
                                  function(x, y)
                    m.UpdatePosition(self, x, y)
                end)
            local spos = TheInput:GetScreenPosition()
            m.UpdatePosition(self, spos.x, spos.y)
            -- self:SetPosition()
        end
    end

    m.StopFollowMouse = function(self)
        if m.followhandler ~= nil then
            m.followhandler:Remove()
            m.followhandler = nil
        end
    end
    s:StartUpdating()
end

-- 配置读取函数
GLOBAL.TUNING.SORACONFIG = {}
GLOBAL.getsora = function(name)
    if not GLOBAL.TUNING.SORACONFIG[name] then
        GLOBAL.TUNING.SORACONFIG[name] = GetModConfigData(name)
    end
    if type(GLOBAL.TUNING.SORACONFIG[name]) == "boolean"then
        return GLOBAL.TUNING.SORACONFIG[name]
    else
    return tonumber(GLOBAL.TUNING.SORACONFIG[name]) or 0
    end
end

-- later function 
local laterfn = {}
function AddLaterFn(fn)
    if fn and type(fn) == "function" then table.insert(laterfn, fn) end
end

local oldTranslateStringTable = TranslateStringTable -- modmain运行完之后就是 TranslateStringTable 在这儿下钩子 哈哈
GLOBAL.TranslateStringTable = function(...)
    for k, v in pairs(laterfn) do if v and type(v) == "function" then v() end end
    return oldTranslateStringTable(...)
end

mi("moretags")
TUNING.SoraRegTag = RegTag

function EntityScript:SoraAddComponentWithNoPostInit(name,...)
    local old = ModManager.GetPostInitFns
    ModManager.GetPostInitFns = function(s,t,n,...)
        if n == name and t == "ComponentPostInit" then
            return {}
        end
        return old(s,t,name,...)
    end
    self:AddComponent(name,...)
    ModManager.GetPostInitFns = old
end

LISTCONFIG = {}