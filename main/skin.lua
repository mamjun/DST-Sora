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
]] -- 乱动皮肤的后果自负！！！ 抓到一次没任何机会！
local skinowner = {} -- 服务器所有人拥有的皮肤
local selfowner = {} -- 自己拥有的皮肤
local skinowner_tmp = {} -- 自己拥有的皮肤_限时皮肤
local selfowner_tmp = {} -- 自己拥有的皮肤_限时皮肤

local islogin = {} -- 已经登录过的玩家
local autologin = {} -- 服务器自动获取一次皮肤
local selfid = TheNet:GetUserID()
local selfnetid = ''
function IsDefaultCharacterSkin(item_key)
    return string.sub(item_key, -5) == "_none"
end

function SoraSkinCheckFn(inventory, name)
    return IsDefaultCharacterSkin(name) or (selfowner[name] or selfowner_tmp[name]) and true or false
end

function SoraSkinCheckClientFn(inventory, userid, name)
    if userid and name and (not islogin[userid] or skinowner[userid] and skinowner_tmp[userid]) then
        if not islogin[userid] then -- 没取到玩家记录 就当是有吧 
            return true
        end
        return (skinowner[userid][name] or skinowner_tmp[userid][name]) and true or false
    end
    return IsDefaultCharacterSkin(name) or false
end

-- 破解很简单,逮到就完蛋

-- 先读取缓存  尽力而为 读不到就算了
local cache = "SoraSkinCache"
local servercache = cache .. "_server"
if TheNet:GetIsServer() then
    TheSim:GetPersistentString(servercache, function(load_success, str)
        if load_success then
            -- print(servercache, str)
            local r, j = pcall(json.decode, str)
            if r and j.tmp and j.owner then
                for k, v in pairs(j.owner) do
                    if type(v) == "table" then
                        skinowner[k] = v
                    end
                end
                for k, v in pairs(j.tmp) do
                    if type(v) == "table" then
                        skinowner_tmp[k] = v
                    end
                end
            end
        end
    end)

end
-- 客户端缓存 
if not TheNet:IsDedicated() then
    TheSim:GetPersistentString(cache, function(load_success, str)
        if load_success then
            -- print(cache, str)
            local r, j = pcall(json.decode, str)
            if r and j.tmp and j.owner then
                for k, v in pairs(j.owner) do
                    if type(k) == "string" and v == 1 then
                        selfowner[k] = v
                    end
                end
                for k, v in pairs(j.tmp) do
                    if type(k) == "string" and v == 1 then
                        selfowner_tmp[k] = v
                    end
                end
            end
        end
    end)

end

function SaveSkinCache()
    if TheNet:GetIsServer() then
        local r, j = pcall(json.encode, {
            owner = skinowner,
            tmp = skinowner_tmp
        })
        if r then
            TheSim:SetPersistentString(servercache, j, true)
        end
    end
    local r, j = pcall(json.encode, {
        owner = selfowner,
        tmp = selfowner_tmp
    })
    if r then
        TheSim:SetPersistentString(cache, j, true)
    end
end

-- 擅动着 杀无赦
local black = {
    sora_llan = 1,
    sora_mysora = 1,
    sora_mysora_r = 1
}
MakeCharacterSkin("sora", "sora_llan", {
    name = "llan",
    des = "世间美好，不过松花酿酒，春水煎茶",
    quotes = "敢动我就杀了你哦",
    rarity = "敢动我就杀了你哦",
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    rarityorder = 100,
    release_group = -1006,
    skins = {
        normal_skin = "sora_llan",
        ghost_skin = "ghost_sora_build"
    },
    skin_tags = {"BASE", "sora", "CHARACTER"},
    checkfn = SoraSkinCheckFn,
    checkclientfn = SoraSkinCheckClientFn,
    share_bigportrait_name = "sora",
    FrameSymbol = "Distinguished"
})

MakeCharacterSkin("sora", "sora_mysora", {
    name = "花嫁",
    des = "执子之手,与子偕老",
    quotes = "敢动我就杀了你哦",
    rarity = "敢动我就杀了你哦",
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    rarityorder = 100,
    release_group = -1007,
    skins = {
        normal_skin = "sora_mysora",
        ghost_skin = "ghost_sora_build"
    },
    skin_tags = {"BASE", "sora", "CHARACTER"},
    checkfn = SoraSkinCheckFn,
    checkclientfn = SoraSkinCheckClientFn,
    share_bigportrait_name = "sora",
    FrameSymbol = "Distinguished"
})

MakeCharacterSkin("sora", "sora_mysora_r", {
    name = "花嫁",
    des = "执子之手,与子偕老",
    quotes = "敢动我就杀了你哦",
    rarity = "敢动我就杀了你哦",
    raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1},
    rarityorder = 100,
    release_group = -1008,
    skins = {
        normal_skin = "sora_mysora_r",
        ghost_skin = "ghost_sora_build"
    },
    skin_tags = {"BASE", "sora", "CHARACTER"},
    checkfn = SoraSkinCheckFn,
    checkclientfn = SoraSkinCheckClientFn,
    share_bigportrait_name = "sora",
    FrameSymbol = "Distinguished"
})

AddSimPostInit(function()
    local old = ShouldDisplayItemInCollection
    GLOBAL.ShouldDisplayItemInCollection = function(str, ...)
        if (black[str] or str:match("^sora_.+_tmp$")) and not SoraSkinCheckFn(TheInventory, str) then
            return false
        end
        return old(str, ...)
    end
end)

-- 网络部分
local ThankYouPopup = require "screens/thankyoupopup"
local apiurl = "http://skin.fl.lovetly.top/api/Dst"
local token = ""
local tokentime = 0
-- local apiurl = "http://127.0.0.1/api/Dst"
local function nofn()
end
local function SkinApi(api, data, fn)
    if not api then
        return false
    end
    data = data or {}
    fn = fn or nofn
    local r, js = pcall(json.encode, data)
    if r then
        -- print("SkinApi",api, data, fn)
        TheSim:QueryServer(apiurl .. api .. '?token=' .. token, function(str, succ, code)
            -- print(api, js, str)
            if succ and code == 200 then
                local re, jso = pcall(json.decode, str)
                if re and type(jso) == "table" then
                    fn(jso.code, jso.msg, jso.data)
                else
                    fn(-3, 'err json', str)
                    -- print("APIFailed3",'err json',str)
                end
            else
                fn(-2, code, str)
                -- print("APIFailed2",code,str)
            end
        end, 'POST', js)
    else
        fn(-1, 'err json')
    end
end

local function GetSkins(userid)
    if not userid then
        return
    end
    if not skinowner[userid] then
        skinowner[userid] = {}
    end
    if not skinowner_tmp[userid] then
        skinowner_tmp[userid] = {}
    end
    SkinApi("s/GetSkins", {
        kid = userid
    }, function(code, msg, data)

        if code == 2001 and data.items then
            skinowner[userid] = {}
            for k, v in pairs(data.items) do
                skinowner[userid][v] = 1
            end
            if userid == selfid then
                selfowner = {}
                for k, v in pairs(data.items) do
                    selfowner[v] = 1
                end
            end
            if data.temps then
                skinowner_tmp[userid] = {}
                for k, v in pairs(data.temps) do
                    skinowner_tmp[userid][v] = 1
                end
                if userid == selfid then
                    selfowner_tmp = {}
                    for k, v in pairs(data.temps) do
                        selfowner_tmp[v] = 1
                    end
                end
            end

            islogin[userid] = true
            SaveSkinCache()
        end
    end)
end
local gametimes = 0
local function Login(userid, netid, nick)
    SkinApi('c/Login', {
        kid = userid,
        netid = netid,
        nick = nick
    }, function(code, msg, data)
        if code > 1000 and data and data.token then
            token = data.token
            tokentime = 3600
            if data.time then
                gametimes = data.time
            end
        else
            print("LoginFailed", msg, data)
            return false
        end
    end)
end
-- 游戏时长上报

local function OnLine()
    SkinApi('c/online/', {}, function(code, msg, data)
        if code > 3000 and data and data.time then
            gametimes = data.time
        else
            return false
        end
    end)
end

local function UseSkinCDK(cdk, cb) -- 客户端调用
    SkinApi('c/UseCDK', {
        cdk = cdk
    }, cb)
end
local function UseGiftCDK(cdk,player, cb) -- 服务器调用
    SkinApi('s/UseCDK', {
        kid = player.userid,
        cdk = cdk
    }, cb)
end
if not TheNet:IsDedicated() then
    GetSkins(selfid)
    local function trylogin()
        if token ~= "" then
            return
        end
        for k, v in pairs(TheNet:GetClientTable() or {}) do
            if v and v.userid == selfid then
                selfnetid = v.netid
            end
        end

        if selfnetid:find("R:") then
            selfnetid = 'RU_' .. selfnetid:sub(3, -1)
        else
            selfnetid = 'OU_' .. selfnetid
        end
        Login(selfid, selfnetid, TheNet:GetLocalUserName())
    end
    trylogin()
    AddSimPostInit(function(inst)
        TheWorld:DoTaskInTime(0, trylogin)
        TheWorld.TryReLoginTimes = 0
        TheWorld.TryReLogin = TheWorld:DoPeriodicTask(10, function()
            TheWorld.TryReLoginTimes = TheWorld.TryReLoginTimes + 1
            if TheWorld.TryReLoginTimes < 21 and token == "" then
                trylogin()
            else
                TheWorld.TryReLogin:Cancel()
            end

        end)
        TheWorld:DoPeriodicTask(300, function()
            GetSkins(selfid)
            tokentime = tokentime - 300
            if tokentime < 0 then
                Login(selfid, selfnetid, TheNet:GetLocalUserName())
            end
            if ThePlayer and ThePlayer:HasTag("sora") then
                OnLine()
            end
        end)
    end)
end

if TheNet:GetIsServer() then
    AddPlayerPostInit(function(inst)
        inst:DoTaskInTime(0, function()
            GetSkins(inst.userid)
        end)
    end)
    AddSimPostInit(function(inst)
        TheWorld:DoPeriodicTask(600, function()
            local t = TheNet:GetClientTable()
            for k, v in pairs(t) do
                GetSkins(v.userid)
            end
        end)
    end)
end

-- skinRPC处理
local skinhandle = {
    GetSkins = function(inst, Force)
        if not inst.soragetskincd then
            inst.soragetskincd = SoraCD(2,true)
        end
        if inst.soragetskincd() or Force then
            GetSkins(inst.userid)
        end
    end,
    UseCDK = function(inst, cdk, Force)
        if not inst.soragetskincd then
            inst.soragetskincd = SoraCD(2,true)
        end
        if not inst and inst:HasTag("sora") then
            mes(inst,"只有穹妹可以激活这个CDK")
            return 
        end
        if inst.soragetskincd() or Force then
            if not (cdk and cdk:utf8len() == 23) then
                mes(inst,"CDK不正确")
                return
            end
            UseGiftCDK(cdk,inst,function (code,msg,data)
                if (code == -6001 or code == -6002 ) then
                    mes(inst,"卡密不正确 请重新输入")
                elseif (code == -6003 or code == -6004) then
                    mes(inst, "玩家ID不正确")
                elseif (code == -6005) then
                    mes(inst, "你输入的绑定码")
                elseif (code == -6006) then
                    mes(inst,"卡密不正确")
                elseif (code == -6007) then
                    mes(inst, "你已经激活过这个CDK了")
                elseif (code == -6008) then
                    mes(inst, "这个CDK已经被别人激活了")
                elseif (code == -6011) then
                    mes(inst, "CDK类型不正确")
                elseif (code == -6201) then
                    mes(inst, "礼包不存在")
                elseif (code == -6202) then
                    mes(inst, "礼包类型不正确")
                elseif (code == -6203) then
                    mes(inst, "礼包已过期")
                elseif (code == -6204) then
                    mes(inst, "你已经领取过这个礼包了")
                elseif (code == -6299) then
                    mes(inst, "数据库故障")
                elseif (code == -6298) then
                    mes(inst, "服务器故障")
                elseif (code == -2) then
                    info = "code=" .. msg .. "\n{" .. data .. "}"
                    mes(inst, "服务器链接失败,请稍后再试" .. info)
                elseif (code == -3) then
                    mes(inst, "服务器内部出错,请稍后再试")
                elseif (code < 0) then
                    mes(inst,"卡密使用失败,请联系作者 code:" .. code)
                elseif (code == 6231) then
                    if data.type and data.type:find("baseworld") then
                        if inst.components.soraglobalsave:Get(data.name) then 
                            mes(inst, "你这个档已经领取过这个礼包了!")
                            return 
                        end
                        local giftid = inst.userid .. "|" .. data.name
                        if GLOBALDB:Get("giftsave",giftid) then 
                            mes(inst, "你这个档已经领取过这个礼包了!!!")
                            return 
                        end
                        inst.components.soraglobalsave:Set(data.name,1)
                        GLOBALDB:Set("giftsave",giftid,1)
                    end
                    if data.prefab then
                        local r,gifts = pcall(json.decode,data.prefab)
                        if r then
                            local items = {}
                            for i,g in pairs(gifts) do 
                                local item = type(g) == "table" and g or SpawnPrefab(i)
                                if item ~= nil then
                                   
                                    local maxsize = (item.components.stackable~= nil) and item.components.stackable.maxsize or 1 
                                    if g > 1 then
                                        if item.components.stackable ~= nil then
                                            if g <= maxsize then
                                                item.components.stackable.stacksize = math.max(1,g or 1)
                                            else
                                                while(g > maxsize)  do
                                                    g = g - maxsize
                                                    local item2 = SpawnPrefab(i)
                                                    item2.components.stackable.stacksize = maxsize
                                                    table.insert(items,item2)
                                                end
                                                item.components.stackable.stacksize = math.max(1,g or 1)
                                            end
                                        else 
                                            while(g > 1) do 
                                                g = g - 1
                                                table.insert(items,SpawnPrefab(i))
                                            end
                                        end
                                        
                                    end
                                    table.insert(items,item)
                                end
                            end
                            local i = 1
                            for k,v in pairs(items) do
                                i = i +1
                                if v.prefab == "sora_wq" then

                                    v.components.sorawq.str = inst.userid .."|"..cdk .. "|"..i
                                end
                                if v.components.soraitem and v.components.soraitem.bind then
                                    v.components.soraitem.user = inst.userid
                                end
                            end
                    
                            if #items > 0 then
                                local packer = SpawnPrefab("sora3packer")
                                packer.components.unwrappable:WrapItems(items)
                                if gifts.super and packer.super then
                                    packer:super({})
                                end
                                packer.components.named:SetName("礼包:"..(data.name or "未知"))
                                packer.components.inspectable:SetDescription("礼包:"..(data.name or "未知").."\r\n内含:"..(data.item or "未知"))
                                for i,v in ipairs(items) do 
                                    v:Remove()
                                end
                                inst.components.inventory:GiveItem(packer, nil, inst:GetPosition())
                            end
                        else
                            mes(inst, "礼物解析失败:" .. tostring(gifts) .."\r\n"..tostring(data.prefab))
                            return 
                        end
                    end
                    mes(inst,"礼包["..(data.name or "未知").."]领取成功,包含:\n\n"..(data.item or "未知").."\n\n已发送到你的背包" )
                    --SoraPushPopupDialog('小穹的温馨提示',
                        --"已尝试领取礼包[" .. data.name .. "],请稍后查看结果")
                else
                    mes(inst, "CDK激活失败,错误代码:" .. code)
                end
            end)
        else
            mes(inst,"请稍后再试!")
            return
        end


    end,
    Message = function(inst, mes)
        if ThePlayer then
            SoraPushPopupDialog("小穹的温馨提示:", mes)
        end
    end
}

AddModRPCHandler("sora", 'skin', function(player, cmd, ...)
    if type(cmd) == "string" and skinhandle[cmd] then
        skinhandle[cmd](player, ...)
    end
end)

AddClientModRPCHandler("sora", 'skin', function(cmd, ...)
    if type(cmd) == "string" and skinhandle[cmd] then
        skinhandle[cmd](nil, ...)
    end
end)

function SkinRPC(cmd, ...)
    if type(cmd) == "string" and skinhandle[cmd] then
        if TheNet:GetIsServer() then
            if ThePlayer then
                skinhandle[cmd](ThePlayer, ...)
            end
        else
            SendModRPCToServer(MOD_RPC.sora.skin, cmd, ...)
        end
    end
end
function SkinReply(cmd,player, ...)
    if type(cmd) == "string" and skinhandle[cmd] then
      SendModRPCToClient(MOD_RPC.sora.skin, type(player) == "table" and player.userid or player,cmd, ...)
    end
end
function mes(player, mes)
    SkinReply("Message",player,mes)
end
-- ban掉乱换皮肤的
-- 除此之外检测到换皮肤的封号
local skinhook = {}

local function CheckBuild(inst, build)
    if not build then
        return false
    end
    if not table.contains(PREFAB_SKINS.sora, build) then
        return false
    end
    if not inst:HasTag("sora") then
        return true
    end

    if TheWorld.ismastersim then
        if not inst.userid or not islogin[inst.userid] then
            return false
        end
        if not (skinowner[inst.userid][build] or skinowner[inst.userid][build .. "_tmp"]) then
            return true
        end
    else
        if not (selfowner[build] or selfowner_tmp[build]) then
            return true
        end
    end
    return false
end
local function CheckSymbolBuild(inst, symbol, build)
    return CheckBuild(inst, build)
end

skinhook.SetBuild = userdata.MakeHook("AnimState", 'SetBuild', CheckBuild)
skinhook.SetSkin = userdata.MakeHook("AnimState", 'SetSkin', CheckBuild)
skinhook.AddOverrideBuild = userdata.MakeHook("AnimState", 'AddOverrideBuild', CheckBuild)
skinhook.OverrideSkinSymbol = userdata.MakeHook("AnimState", 'OverrideSkinSymbol', CheckSymbolBuild)
skinhook.OverrideSymbol = userdata.MakeHook("AnimState", 'OverrideSymbol', CheckSymbolBuild)

AddPlayerPostInit(function(inst)
    inst:DoTaskInTime(0.5, function()
        for k, v in pairs(skinhook) do
            userdata.Hook(inst, v)
        end
    end)
end)

-- 上线激活连衣长裙

STRINGS.THANKS_POPUP.SORASKIN = '感谢游玩小穹'

if not TheNet:IsDedicated() then
    AddPrefabPostInit("sora", function(inst)
        inst:DoTaskInTime(5, function()
            if inst ~= ThePlayer then
                return
            end
            if not ThePlayer.HUD then
                return
            end
            if selfowner['sora_dress'] then
                return
            end
            if token == '' then
                return
            end
            SkinApi('c/ActiveSkin', {
                skin = 'sora_dress'
            }, function(code, msg, data)
                if code == 5011 then
                    SkinRPC('GetSkins', true)
                    GetSkins(selfid)
                    TheFrontEnd:PushScreen(ThankYouPopup({{
                        item = "sora_dress",
                        item_id = 0,
                        gifttype = "SORASKIN"
                    }}))
                end
            end)
        end)
    end)

end

if TheNet:GetIsServer() then
    AddPrefabPostInit("sora", function(inst)
        local skin = inst.components.skinner.skin_name
        if skin:find("none") and skin ~= "sora_none" then
            inst.components.skinner:SetSkin("sora_none")
        end
    end)
end

-- 客户端UI
if not TheNet:IsDedicated() then
    local GameTimeUnLockScreen -- 提前定义
    local CdkUnLockScreen -- 提前定义
    local SkinActive = {
        sora_gete = function(s, item)
            local scr = GameTimeUnLockScreen(item)
            scr.unlocktext:SetString("在线游玩50小时解锁")
            return scr
        end,
        sora_amly = function(s, item)
            local scr = CdkUnLockScreen(item)
            scr.unlocktext:SetString("不定期发放CDK")
            return scr
        end,
        sora_none = function(s, item)
            local scr = CdkUnLockScreen(item)
            scr.unlocktext:SetString("仅用于解锁其他皮肤")
            return scr
        end,
        sora_zhizheng = function(s, item)
            local scr = CdkUnLockScreen(item)
            scr.unlocktext:SetString("wiki作者专属皮肤")
            return scr
        end,
        sora_hf = function(s, item)
            local scr = CdkUnLockScreen(item)
            scr.unlocktext:SetString("QQ群(908132556)内绑定后,游戏时长+群聊天数>150可以获取 ")
            return scr
        end
    }
    local item_map = {
        sora_none = "sora_uniforms"
    }
    AddClassPostConstruct("widgets/redux/itemexplorer", function(self)
        local old_ShowItemSetInfo = self._ShowItemSetInfo
        self._ShowItemSetInfo = function(s, ...)
            if SkinActive[s.set_item_type] then
                s.set_info_screen = SkinActive[s.set_item_type](s, s.set_item_type)
                s.set_info_screen.owned_by_wardrobe = true
                TheFrontEnd:PushScreen(self.set_info_screen)
                return
            end
            return old_ShowItemSetInfo(s, ...)
        end

        local old_UpdateItemSelectedInfo = self._UpdateItemSelectedInfo
        self._UpdateItemSelectedInfo = function(s, item, ...)
            -- print(item,...)
            local r = old_UpdateItemSelectedInfo(s, item, ...)
            if SkinActive[item] and not selfowner[item] then
                s.set_info_btn:SetText("激活")
                s.set_info_btn:Show()
                s.set_item_type = item
            end
            return r
        end
    end)
    -- UI定义
    local Screen = require "widgets/screen"
    local Text = require "widgets/text"
    local UIAnim = require "widgets/uianim"
    local Image = require "widgets/image"
    local Widget = require "widgets/widget"
    local TEMPLATES = require "widgets/redux/templates"

    local MAX_ITEMS = 5
    local LINE_HEIGHT = 44
    local TEXT_WIDTH = 300
    local TEXT_OFFSET = 40
    local FONT = BUTTONFONT
    local FONT_SIZE = 32
    local ITEM_SCALE = 0.6
    local IMAGE_X = -55
    local OWNED_COLOUR = UICOLOURS.WHITE
    local NEED_COLOUR = UICOLOURS.GREY

    local UnLockScreen = Class(Screen, function(self, item, cb)
        Screen._ctor(self, "UnLockScreen")
        self.item = item
        self.cb = cb
        self.black = self:AddChild(TEMPLATES.BackgroundTint())
        self.proot = self:AddChild(TEMPLATES.ScreenRoot("ROOT"))
        self.cd = SoraCD(5,true)
        self.buttons = {{
            text = '激活',
            cb = function()
                if self.cd() then
                    if self.cb then
                        self.cb(self, item)
                    end
                else
                    SoraPushPopupDialog("小穹的温馨提示", "请稍候再试。")
                end
            end
        }, {
            text = '关闭',
            cb = function()
                self:Close()
            end
        }}
        local width = 400
        self.dialog = self.proot:AddChild(TEMPLATES.CurlyWindow(width, 450, STRINGS.NAMES[item], self.buttons))
        self.content_root = self.proot:AddChild(Widget("content_root"))
        self.content_root:SetPosition(200, -150)

        self.anim_root = self.content_root:AddChild(Widget("anim_root"))
        self.anim_root:SetVAnchor(ANCHOR_MIDDLE)
        self.anim_root:SetHAnchor(ANCHOR_MIDDLE)
        self.anim_root:SetScaleMode(SCALEMODE_PROPORTIONAL)
        self.anim_root:SetPosition(-150, -50)
        self.anim = self.anim_root:AddChild(UIAnim())
        self.animstate = self.anim:GetAnimState()
        self.animstate:SetBuild(item_map[item] or item)
        self.animstate:SetBank("wilson")
        self.animstate:PlayAnimation("emoteXL_loop_dance0", true)
        self.animstate:AddOverrideBuild("player_emote_extra")
        self.anim:SetFacing(FACING_DOWN)
        self.anim:SetScale(0.8, 0.8, 0.8)
        self.animstate:Hide("ARM_carry")
        self.animstate:Hide("head_hat")
        self.animstate:Hide("HAIR_HAT")

        self.icon = self.content_root:AddChild(UIAnim())
        self.icon:GetAnimState():SetBank("accountitem_frame")
        self.icon:GetAnimState():SetBuild("accountitem_frame")
        self.icon:GetAnimState():PlayAnimation("icon", true)
        self.icon:GetAnimState():OverrideSkinSymbol("SWAP_ICON", item_map[item] or item, "SWAP_ICON")

        self.icon:GetAnimState():Hide("TINT")
        self.icon:GetAnimState():Hide("LOCK")
        self.icon:GetAnimState():Hide("NEW")
        self.icon:GetAnimState():Hide("SELECT")
        -- self.icon:GetAnimState():Hide("FOCUS")
        self.icon:GetAnimState():Hide("IC_WEAVE")
        for k, _ in pairs(EVENT_ICONS) do
            self.icon:GetAnimState():Hide(k)
        end
        self.icon:GetAnimState():Hide("DLC")

        self.icon:SetPosition(-100, 310)

        self.info_txt = self.content_root:AddChild(Text(CHATFONT, 26, nil, UICOLOURS.WHITE))
        self.info_txt:SetPosition(-35, 130)
        self.info_txt:SetRegionSize(width * 0.8, 85)
        self.info_txt:SetHAlign(ANCHOR_LEFT)
        self.info_txt:SetVAlign(ANCHOR_MIDDLE)
        self.info_txt:EnableWordWrap(true)
        self.info_txt:SetString(STRINGS.SKIN_DESCRIPTIONS[item] or "UnKnow")

        self.name_txt = self.content_root:AddChild(Text(CHATFONT, 30, nil, UICOLOURS.WHITE))
        self.name_txt:SetPosition(-35, 220)
        self.name_txt:SetRegionSize(width * 0.8, 85)
        self.name_txt:SetHAlign(ANCHOR_LEFT)
        self.name_txt:SetVAlign(ANCHOR_MIDDLE)
        self.name_txt:EnableWordWrap(true)
        self.name_txt:SetString(STRINGS.SKIN_NAMES[item] or "UnKnow")

        self.rarity_txt = self.content_root:AddChild(Text(CHATFONT, 26, nil, {255 / 255, 215 / 255, 0 / 255, 1}))
        self.rarity_txt:SetPosition(-35, 190)
        self.rarity_txt:SetRegionSize(width * 0.8, 85)
        self.rarity_txt:SetHAlign(ANCHOR_LEFT)
        self.rarity_txt:SetVAlign(ANCHOR_MIDDLE)
        self.rarity_txt:EnableWordWrap(true)
        self.rarity_txt:SetString("总之就是非常可爱")
        -- self.anim:GetAnimState():SetMultColour(unpack(FRONTEND_PORTAL_COLOUR))

        -- self.horizontal_line = self.content_root:AddChild(
        -- Image("images/ui.xml",
        -- "line_horizontal_6.tex"))
        -- self.horizontal_line:SetScale(1, 0.55)
        -- self.horizontal_line:SetPosition(5, 96, 0)

        self.horizontal_line = self.content_root:AddChild(Image("images/global_redux.xml", "item_divider.tex"))
        self.horizontal_line:SetScale(0.5, 1)
        self.horizontal_line:SetPosition(-200, 75, 0)

        self.horizontal_line2 = self.content_root:AddChild(Image("images/global_redux.xml", "item_divider.tex"))
        self.horizontal_line2:SetScale(0.25, 1)
        self.horizontal_line2:SetPosition(-95, 170, 0)
        self.unlockdes = self.content_root:AddChild(Text(CHATFONT, 26, nil, {255 / 255, 215 / 255, 0 / 255, 1}))
        self.unlockdes:SetPosition(-235, 50)
        self.unlockdes:SetRegionSize(width * 0.8, 85)
        self.unlockdes:SetHAlign(ANCHOR_LEFT)
        self.unlockdes:SetVAlign(ANCHOR_MIDDLE)
        self.unlockdes:EnableWordWrap(true)
        self.unlockdes:SetString("解锁方式:")

        self.unlocktext = self.content_root:AddChild(Text(CHATFONT, 26, nil, {255 / 255, 215 / 255, 0 / 255, 1}))
        self.unlocktext:SetPosition(-165, 50)
        self.unlocktext:SetRegionSize(width * 0.8, 85)
        self.unlocktext:SetHAlign(ANCHOR_LEFT)
        self.unlocktext:SetVAlign(ANCHOR_MIDDLE)
        self.unlocktext:EnableWordWrap(true)
        self.unlocktext:SetString("")

        self.default_focus = self.dialog
    end)

    function UnLockScreen:OnControl(control, down)
        if UnLockScreen._base.OnControl(self, control, down) then
            return true
        end
        if control == CONTROL_CANCEL and not down then
            self.buttons[#self.buttons].cb()
            TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/click_move")
            return true
        end
    end

    function UnLockScreen:Close()
        TheFrontEnd:PopScreen(self)
    end
    GameTimeUnLockScreen = Class(UnLockScreen, function(self, item, cb)
        UnLockScreen._ctor(self, item, cb)
        local pro = gametimes / 300
        -- self.progressbar = self.content_root:AddChild(UIAnim())
        -- self.progressbar:GetAnimState():SetBank("skin_progressbar")
        -- self.progressbar:GetAnimState():SetBuild("skin_progressbar")
        -- self.progressbar:GetAnimState():PlayAnimation("fill_progress", false)
        -- self.progressbar:GetAnimState():SetPercent("fill_progress", pro)
        -- self.progressbar:GetAnimState():Show("platinum")
        -- self.progressbar:GetAnimState():Show("gold")
        -- self.progressbar:SetPosition(0, 0) 
        -- self.progressbar:SetScale(2,2,1)

        self.characterprogress = self.content_root:AddChild(
            Text(HEADERFONT, 40, nil, {255 / 255, 215 / 255, 0 / 255, 1}))
        self.characterprogress:SetPosition(-200, 10)
        pro = math.min(math.max(0, pro), 1)
        self.characterprogress:SetString(string.format("当前进度: %0.1f%%", pro * 100))

        self.cb = function(s, i)
            if gametimes > 300 then
                local a = SoraPushPopupDialog("小穹的温馨提示", "正在激活中,请稍后查看结果")
                SkinApi('c/ActiveSkin', {
                    skin = 'sora_gete'
                }, function(code, msg, data)
                    TheFrontEnd:PopScreen(a)
                    if code == 5021 then
                        SkinRPC('GetSkins', true)
                        GetSkins(selfid)
                        TheFrontEnd:PushScreen(ThankYouPopup({{
                            item = "sora_gete",
                            item_id = 0,
                            gifttype = "SORASKIN"
                        }}))
                    elseif code == 5020 then
                        SoraPushPopupDialog('小穹的温馨提示',
                            "你已经拥有了[穹妹-哥特萝莉],不需要重复激活")
                        SkinRPC('GetSkins')
                        GetSkins(selfid)
                    elseif code == -5022 then
                        SoraPushPopupDialog('小穹的温馨提示', "时间计算出错,请半小时后再试")
                    else
                        SoraPushPopupDialog('小穹的温馨提示', "皮肤激活失败,错误代码:" .. code .. info)
                    end
                end)

                return
            else
                SoraPushPopupDialog("小穹的温馨提示",
                    "在线时长不足50小时\n激活失败\n如果时长不对 请过半小时再试")
            end
        end
    end)
    CdkUnLockScreen = Class(UnLockScreen, function(self, item, cb)
        UnLockScreen._ctor(self, item, cb)
        self.cdkbox = self.content_root:AddChild(TEMPLATES.StandardSingleLineTextEntry(nil, 360, 40))

        self.cdkbox:SetPosition(-200, 0)
        self.cdkbox.textbox:SetTextLengthLimit(23)
        self.cdkbox.textbox:SetForceEdit(true)
        self.cdkbox.textbox:EnableWordWrap(false)
        self.cdkbox.textbox:EnableScrollEditWindow(true)
        self.cdkbox.textbox:SetHelpTextEdit("")
        self.cdkbox.textbox:SetHelpTextApply('请输入CDK')
        self.cdkbox.textbox:SetTextPrompt('请输入CDK', UICOLOURS.GREY)
        self.cdkbox.textbox.prompt:SetHAlign(ANCHOR_MIDDLE)
        self.cdkbox.textbox:SetCharacterFilter("-0123456789QWERTYUPASDFGHJKLZXCVBNMqwertyupasdfghjklzxcvbnm")
        self.cdkbox:SetOnGainFocus(function()
            self.cdkbox.textbox:OnGainFocus()
        end)
        self.cdkbox:SetOnLoseFocus(function()
            self.cdkbox.textbox:OnLoseFocus()
        end)

        self.cdkbox.focus_forward = self.cdkbox.textbox
        self.cb = function(s, i)
            local cdk = self.cdkbox.textbox:GetString()
            if cdk then
                cdk = cdk:upper()
                if not (cdk:utf8len() == 23 and cdk:match('^[0-9A-Z%-]+$')) then
                    SoraPushPopupDialog("小穹的温馨提示", "请输入正确的卡密")
                    return
                end
                local a = SoraPushPopupDialog("小穹的温馨提示", "正在激活中,请稍后查看结果")
                UseSkinCDK(cdk, function(code, msg, data)
                    TheFrontEnd:PopScreen(a)
                    if (code == -6001 or code == -6002 or code == -6003) then
                        SoraPushPopupDialog('小穹的温馨提示', "卡密不正确 请重新输入")
                    elseif (code == -6004) then
                        SoraPushPopupDialog('小穹的温馨提示', "这张卡密已经被你使用过了")
                    elseif (code == -6005) then
                        SoraPushPopupDialog('小穹的温馨提示', "这张卡密已经被别人使用过了")
                    elseif (code == -6103) then
                        SoraPushPopupDialog('小穹的温馨提示', "绑定码不正确")
                    elseif (code == -6104) then
                        SoraPushPopupDialog('小穹的温馨提示', "绑定码已经被绑定了")
                    elseif (code == -6105) then
                        SoraPushPopupDialog('小穹的温馨提示', "你已经绑定成功")
                    elseif (code == -6106) then
                        SoraPushPopupDialog('小穹的温馨提示', "你已经绑定过其他的绑定码了")
                    elseif (code == -6201) then
                        SoraPushPopupDialog('小穹的温馨提示', "礼包不存在")
                    elseif (code == -6202) then
                        SoraPushPopupDialog('小穹的温馨提示', "礼包类型不正确")
                    elseif (code == -6203) then
                        SoraPushPopupDialog('小穹的温馨提示', "礼包已过期")
                    elseif (code == -2) then
                        info = "code=" .. msg .. "\n{" .. data .. "}"

                        SoraPushPopupDialog('小穹的温馨提示', "服务器链接失败,请稍后再试" .. info)
                    elseif (code == -3) then
                        SoraPushPopupDialog('小穹的温馨提示', "服务器内部出错,请稍后再试")
                    elseif (code < 0) then
                        SoraPushPopupDialog('小穹的温馨提示', "卡密使用失败,请联系作者 code:" .. code)
                    elseif (code == 6021) then
                        SoraPushPopupDialog('小穹的温馨提示',
                            "你已经拥有了[" .. data.skinname .. "],不需要重复激活")
                        SkinRPC('GetSkins')
                        GetSkins(selfid)
                    elseif (code == 6103) then
                        SoraPushPopupDialog('小穹的温馨提示', "绑定成功,QQ:" .. data.qq)
                    elseif (code == 6001) then
                        SkinRPC('GetSkins', true)
                        GetSkins(selfid)
                        TheFrontEnd:PopScreen(self)
                        TheFrontEnd:PushScreen(ThankYouPopup({{
                            item = data.skinprefab,
                            item_id = 0,
                            gifttype = "SORASKIN"
                        }}))
                    elseif (code == 6231) then
                        SkinRPC('UseCDK', cdk, true)
                        --SoraPushPopupDialog('小穹的温馨提示',
                            --"已尝试领取礼包[" .. data.name .. "],请稍后查看结果")
                    else
                        SoraPushPopupDialog('小穹的温馨提示', "CDK激活失败,错误代码:" .. code)
                    end
                end)
                return
            else
                SoraPushPopupDialog("小穹的温馨提示", "请输入卡密")
            end
        end
    end)
end

-- 获取n秒后的时间
local function GetSecondAfter(n)
    local t = os.clock() + n
    while os.clock() < t do
    end
    return os.clock()
end
GetSecondAfter(2)

