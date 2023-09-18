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
]] -- Upvaluehelper
up = require("utils/soraupvaluehelper")
GLOBAL.SoraUp = up
-- 注册全局API
GLOBAL.SoraAPI = env
GLOBAL.SORAAPI = env

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
        if v and (k:match(name) or v:match(name)) then
            return true
        end
    end
    return false
end
GLOBAL.SoraIsModEnable = IsModEnable
GLOBAL.SoraEnableMods = enablemods
local mythenable = nil
function IsMythEnable()
    if mythenable ~= nil then
        return mythenable
    end
    if IsModEnable("Myth Words") then
        mythenable = true
        return true
    elseif IsModEnable("%[DST%] 神话书说") then
        mythenable = true
        return true
    elseif IsModEnable("%[DST%]神话书说") then
        mythenable = true
        return true
    elseif IsModEnable("%[DST%]%s+神话书说") then
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
for k, v in pairs({"tomato", "onion"}) do
    imagecache[v] = {
        atlas = GetInventoryItemAtlas("quagmire_" .. v .. ".tex"),
        image = "quagmire_" .. v .. ".tex"
    }
    imagecache[v .. "_cooked"] = {
        atlas = GetInventoryItemAtlas("quagmire_" .. v .. "_cooked.tex"),
        image = "quagmire_" .. v .. "_cooked.tex"
    }
end
function SoraGetImage(na) -- mod加载加载过程中请勿调用 不准确
    local name = repl[na] or na
    local t = name
    if t:sub(-4):lower() ~= ".tex" then
        t = t .. ".tex"
    end
    if notimagecache[name] then
        return nil, nil
    end
    if imagecache[name] then
        return imagecache[name].atlas, imagecache[name].image
    end
    local atlas = GetInventoryItemAtlas(t, true)
    if atlas and not atlas:find("/cookbookimages/") and TheSim:AtlasContains(softresolvefilepath(atlas), t) then
        imagecache[name] = {
            atlas = atlas,
            image = t
        }
        return atlas, t
    else
        if GLOBAL.Prefabs[name] then
            local assets = GLOBAL.Prefabs[name].assets or {}
            for ak, av in pairs(assets) do
                if type(av) == "table" and av.type and av.file and av.type == "ATLAS" then
                    if TheSim:AtlasContains(av.file, t) then
                        imagecache[name] = {
                            atlas = av.file,
                            image = t
                        }
                        return av.file, t
                    end
                end
            end
        end
        local trueatlas = softresolvefilepath("images/inventoryimages/" .. name .. ".xml")
        if trueatlas and TheSim:AtlasContains(trueatlas, t) then
            imagecache[name] = {
                atlas = "images/inventoryimages/" .. name .. ".xml",
                image = t
            }
            return "images/inventoryimages/" .. name .. ".xml", t
        end
        trueatlas = softresolvefilepath("images/" .. name .. ".xml")
        if trueatlas and TheSim:AtlasContains(trueatlas, t) then
            imagecache[name] = {
                atlas = "images/" .. name .. ".xml",
                image = t
            }
            return "images/" .. name .. ".xml", t
        end
        trueatlas = softresolvefilepath("images/monkey_king_item.xml")
        if trueatlas and TheSim:AtlasContains(trueatlas, t) then
            imagecache[name] = {
                atlas = "images/monkey_king_item.xml",
                image = t
            }
            return "images/monkey_king_item.xml", t
        end
        if PREFABDEFINITIONS[name] then
            for idx, asset in ipairs(PREFABDEFINITIONS[name].assets) do
                if asset.type == "ATLAS" then
                    trueatlas = asset.file
                end
            end
        end
        if trueatlas and TheSim:AtlasContains(softresolvefilepath(trueatlas), t) then
            imagecache[name] = {
                atlas = trueatlas,
                image = t
            }
            return trueatlas, t
        end
        for k, v in pairs(GLOBAL.Prefabs) do
            if k and k:match("MOD_") then
                local assets = v.assets or {}
                for ak, av in pairs(assets) do
                    if type(av) == "table" and av.type and av.file and av.type == "ATLAS" then
                        if TheSim:AtlasContains(av.file, t) then
                            imagecache[name] = {
                                atlas = av.file,
                                image = t
                            }
                            return av.file, t
                        end
                    end
                end
            end
        end
        notimagecache[name] = name
        return nil, nil
    end
end

GLOBAL.SoraGetImage = SoraGetImage
-- 弹出消息
local messages = {}
local PopupDialogScreen = require "screens/redux/popupdialog"
function SoraPushPopupDialog(title, message, button, fn)
    if not (ThePlayer and ThePlayer.HUD and ThePlayer.HUD.controls) then
        table.insert(messages, {title, message, button, fn})
    end
    local buttonstr = button or STRINGS.UI.POPUPDIALOG.OK
    local scr
    local function doclose()
        TheFrontEnd:PopScreen(scr)
    end
    scr = PopupDialogScreen(title, message, {{
        text = buttonstr,
        cb = function()
            doclose()
            if fn then
                fn()
            end
        end
    }})
    TheFrontEnd:PushScreen(scr)
    local screen = TheFrontEnd:GetActiveScreen()
    if screen then
        screen:Enable()
    end
    return scr
end
AddClassPostConstruct("widgets/controls", function(self)
    self.inst:DoTaskInTime(3, function()
        if next(messages) then
            for k, v in pairs(messages) do
                SoraPushPopupDialog(unpack(v))
            end
            messages = {}
        end
    end)
end)
GLOBAL.SoraPushPopupDialog = SoraPushPopupDialog

GLOBAL.SoraCD = function(ti, real) -- 内置CD
    local t = ti
    local last = -ti
    local get = real and GetTimeRealSeconds or GetTime
    return function()
        local ct = get()
        if (ct - t) > last then
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
    for k, v in pairs(tb) do
        for i = 1, v do
            table.insert(srctb, k)
        end
    end
    local pool = deepcopy(srctb)
    return function()
        if #pool < 1 then
            pool = deepcopy(srctb)
        end
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
        tb[name] = function(...)
            return fn(...)
        end
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
        tb[name] = function(...)
            return fn(...)
        end
    end
    return oldfn, fn
end

function rhook(tb, name, fn)
    -- 简化版的endhook 不丢弃oldfn的返回值
    assert(type(tb) == "table", "TryToRHook " .. type(tb))
    local oldfn = tb[name]
    if oldfn then
        tb[name] = function(...)
            return fn({oldfn(...)}, {...})
        end
    else
        tb[name] = function(...)
            return fn({}, {...})
        end
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
    s.soramovable = {}
    local m = s.soramovable
    m.nullfn = function()
    end
    m.name = name or "default"
    m.self = s
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
        if self.focus and control == CONTROL_SECONDARY then
            m.OnClick(self, down)
        end
        return m.OnControl(self, control, down)
    end
    m.OnRawKey = s.OnRawKey or m.nullfn
    s.OnRawKey = function(self, key, down, ...)
        if s.focus and key == KEY_SPACE and not down and not m.cd() then
            s:SetPosition(m.dpos:Get())
            TheSim:SetPersistentString(m.name, string.format("return Vector3(%d,%d,%d)", m.dpos:Get()), false)
        end
        return m.OnRawKey(self, key, down, ...)
    end

    m.OnClick = function(self, down)
        if down then
            m.FollowMouse(self)
        else
            m.StopFollowMouse(self)
        end
    end

    m.SetMovePosition = function(self, x, y, z)
        if not (s.parent and self.ppos and self.mousepos) then
            return
        end
        local pos
        if type(x) == "number" then
            pos = Vector3(x, y, 0)
        else
            pos = x
        end
        local self_scale = self:GetScale()
        local offset = data and data.drag_offset or 1 -- 偏移修正(容器是0.6)
        local newpos = self.ppos + (pos - self.mousepos) / (self_scale.x / offset) -- 修正偏移值       
        s.SetPosition(self, newpos)
    end
    m.FollowMouse = function(self)
        self.mousepos = TheInput:GetScreenPosition()
        self.ppos = self:GetPosition()
        if m.followhandler == nil then
            m.followhandler = TheInput:AddMoveHandler(function(x, y)
                m.SetMovePosition(self, x, y, 0)
                if not TheInput:IsMouseDown(MOUSEBUTTON_RIGHT) then
                    m.StopFollowMouse(self)
                end
            end)
        end
    end

    m.StopFollowMouse = function(self)
        self.mousepos = nil
        if m.followhandler ~= nil then
            m.followhandler:Remove()
            m.followhandler = nil
        end
        local newpos = self:GetPosition()
        print("结束save", string.format("return Vector3(%f,%f,%f)", newpos:Get()))
        TheSim:SetPersistentString(m.name, string.format("return Vector3(%f,%f,%f)", newpos:Get()), false)
    end
end

-- 配置读取函数
GLOBAL.TUNING.SORACONFIG = {}
GLOBAL.getsora = function(name)
    if not GLOBAL.TUNING.SORACONFIG[name] then
        GLOBAL.TUNING.SORACONFIG[name] = GetModConfigData(name)
    end
    if type(GLOBAL.TUNING.SORACONFIG[name]) == "boolean" then
        return GLOBAL.TUNING.SORACONFIG[name]
    else
        return tonumber(GLOBAL.TUNING.SORACONFIG[name]) or 0
    end
end

-- later function 
local laterfn = {}
function AddLaterFn(fn)
    if fn and type(fn) == "function" then
        table.insert(laterfn, fn)
    end
end

local oldTranslateStringTable = TranslateStringTable -- modmain运行完之后就是 TranslateStringTable 在这儿下钩子 哈哈
GLOBAL.TranslateStringTable = function(...)
    for k, v in pairs(laterfn) do
        if v and type(v) == "function" then
            v()
        end
    end
    return oldTranslateStringTable(...)
end

mi("moretags")
TUNING.SoraRegTag = RegTag

function EntityScript:SoraAddComponentWithNoPostInit(name, ...)
    local old = ModManager.GetPostInitFns
    ModManager.GetPostInitFns = function(s, t, n, ...)
        if n == name and t == "ComponentPostInit" then
            return {}
        end
        return old(s, t, name, ...)
    end
    self:AddComponent(name, ...)
    ModManager.GetPostInitFns = old
end

LISTCONFIG = {}
local RandomInstA = 32310901
local RandomInstB = 1729
RandomInst = Class(function(inst) -- 随机生成一个 0-9999的随机数
    self.seed = 0 -- 初始种子
    self.last = 0 -- 上一次的值
    self.hasget = 0 -- 已经取了多少次 配合种子 用于验证
end)
function RandomInst:SetSeed(num)
    self.seed = num
    self.last = num
    self.hasget = 0
end

function RandomInst:Get(num)
    num = num or 1
    local r = 0
    for i = 1, num do
        r = (RandomInstA * self.last + RandomInstB) % 10000
        self.last = r
        self.hasget = self.hasget + 1
    end
    return r
end

function RandomInst:OnSave()
    return {
        seed = self.seed,
        last = self.last,
        hasget = self.hasget
    }
end

function RandomInst:OnLoad(data)
    if data then
        self.seed = data.seed or 0
        self.last = data.last or 0
        self.hasget = data.hasget or 0
    end
end

function Pfn(fn, ret) -- MakePcallFn
    local newfn = function(...)
        local r, re = pcall(fn, ...)
        if not r then
            local info = debug.getinfo(fn)
            print(info.source, info.name, info.currentline, info.linedefined, info.lastlinedefined)
            print("fn err", re)
            return ret
        end
        return re
    end
    return newfn
end
MakePcallFn = Pfn
local lastui = nil
global("TheUI")

function TryLoadUI(str, ...) -- MakePcallFn
    if lastui then
        lastui:Kill()
        lastui = nil
    end
    package.loaded["widgets/" .. str] = nil
    local ui = require("widgets/" .. str)
    local old = ui._ctor
    local uiinst
    ui._ctor = function(obj, ...)
        uiinst = obj
        return old(obj, ...)
    end
    local t, r = pcall(ui, ...)
    if t then
        uiinst = r
    else
        print("uiload", t, r)
    end
    GLOBAL.TheUI = uiinst
    lastui = uiinst
    ThePlayer.HUD.controls.containerroot:AddChild(uiinst)
    return uiinst
end

function CheckChestValid(inst)
    if inst and inst:IsValid() and inst.components.container then
        local container = inst.components.container
        for i = 1, container:GetNumSlots() do
            local item = container:GetItemInSlot(i)
            if not (item and item:IsValid()) then
                container.slots[i] = nil
            end
        end
    end
end

function Say(doer, str)
    if doer and doer.components.talker then
        doer.components.talker:Say(str)
    end
    return true
end

function NilFn()
    return true
end

function GetSoraPackLevel(data)
    local level = 1
    if data then
        if data.sorapacklevel then
            level = data.sorapacklevel
        elseif data.data and data.data.sorapacklevel then
            level = data.data.sorapacklevel
        elseif data.components and data.components.unwrappable and data.components.unwrappable.itemdata then
            for k, v in pairs(data.components.unwrappable.itemdata) do
                level = math.max(level, GetSoraPackLevel(v) + 1)
            end
        elseif data.data and data.data.unwrappable and data.data.unwrappable.itemdata then
            for k, v in pairs(data.data.unwrappable.itemdata) do
                level = math.max(level, GetSoraPackLevel(v) + 1)
            end
        end
    end
    return level
end

function IsValid(ent)
    if ent and type(ent) == "table" and ent.entity and ent.entity:IsValid() then
        return true
    end
    return false
end

-- items = {log=1}
--[[data = {

}]]
function Gift(gifts, data, doer)
    local items = {}
    data = data or {}
    for k, v in pairs(gifts) do
        local item = type(k) == "table" and v or SpawnPrefab(k)
        if item ~= nil then
            local maxsize = (item.components.stackable ~= nil) and item.components.stackable.maxsize or 1
            if v > 1 then
                if item.components.stackable ~= nil then
                    if v <= maxsize then
                        item.components.stackable.stacksize = math.max(1, v or 1)
                    else
                        while (v > maxsize) do
                            v = v - maxsize
                            local item2 = SpawnPrefab(k)
                            item2.components.stackable.stacksize = maxsize
                            table.insert(items, item2)
                        end
                        item.components.stackable.stacksize = math.max(1, v or 1)
                    end
                else
                    while (v > 1) do
                        v = v - 1
                        table.insert(items, SpawnPrefab(k))
                    end
                end
            end
            table.insert(items, item)
        end
    end

    local i = 1
    if doer then
        for k, v in pairs(items) do
            i = i + 1
            if v.prefab == "sora_wq" then
                v.components.sorawq.str = doer.userid .. "|" .. cdk .. "|" .. i
            end
            if v.components.soraitem and v.components.soraitem.bind then
                v.components.soraitem.user = doer.userid
            end
        end
    end
    if data.itemfn then 
        for k, v in pairs(items) do
            data.itemfn(v,data,doer)
        end
    end
    if #items > 0 then
        local packer = SpawnPrefab("sora3packer")
        packer.components.unwrappable:WrapItems(items)
        if data.super and packer.super then
            packer:super(data.super)
        end
        if data.name then
            packer.components.named:SetName(data.name)
            packer.components.inspectable:SetDescription(data.des or data.name)
        end
        for i, v in ipairs(items) do
            v:Remove()
        end
        if data.giftfn then 
            packer.giftfn(packer,data,doer)
        end
        return packer
    end
    return
end
