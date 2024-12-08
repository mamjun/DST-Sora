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
local json = SoraAPI.json
local islogin = {} -- 已经登录过的玩家
local autologin = {} -- 服务器自动获取一次皮肤
local selfid = TheNet:GetUserID()
local selfnetid = ''
local trylogin
local function IsDefaultCharacterSkin(item_key)
    return string.sub(item_key, -5) == "_none"
end

function SoraSkinCheckFn(inventory, name)
    if inventory and not name then
        name = inventory
    end
    name = GetSkinMap(name)
    return IsDefaultCharacterSkin(name) or (selfowner[name] or selfowner_tmp[name]) and true or false
end

function SoraSkinCheckClientFn(inventory, userid, name)
    name = GetSkinMap(name)
    if userid and name and (not islogin[userid] or skinowner[userid] and skinowner_tmp[userid]) then
        if not islogin[userid] then -- 没取到玩家记录 就当是有吧 
            return true
        end
        return (skinowner[userid][name] or skinowner_tmp[userid][name]) and true or false
    end
    return IsDefaultCharacterSkin(name) or false
end
UseSkin = {}
-- {    ClientFN  ServerFN}
-- 破解很简单,逮到就完蛋
function RegUseSkinFN(item, serverfn, clientfn)
    UseSkin[item] = {
        serverfn = serverfn,
        clientfn = clientfn
    }
end

-- 先读取缓存  尽力而为 读不到就算了
local cache = "SoraSkinCache"
local servercache = cache .. "_server"
if TheNet:GetIsServer() then
    TheSim:GetPersistentString(servercache, function(load_success, str)
        if load_success then
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
    -- sora_llan = 1,
    sora_mysora = 1,
    sora_mysora_r = 1,
    sora_yhjd = 1,
    sora_sby = 1
}
RegUseSkinFN("sora_yingyu", function(doer, skin)
    if doer and doer.components.soraitemcontrol then
        doer.components.soraitemcontrol:CreateItem("sora_yingyu")
    end
end)
RegUseSkinFN("sora_dieyu", function(doer, skin)
    if doer and doer.components.soraitemcontrol then
        doer.components.soraitemcontrol:CreateItem("sora_dieyu")
    end
end)
RegUseSkinFN("sora_qiyu", function(doer, skin)
    if doer and doer.components.soraitemcontrol then
        doer.components.soraitemcontrol:CreateItem("sora_qiyu")
    end
end)
RegUseSkinFN("sora_lantern", function(doer, skin)
    if doer and doer.components.soraitemcontrol then
        doer.components.soraitemcontrol:CreateItem("sora_lantern")
    end
end)
RegUseSkinFN("sora_lantern_yh", function(doer, skin)
    if doer and doer.components.soraitemcontrol then
        doer.components.soraitemcontrol:CreateItem("sora_lantern","sora_lantern_yh")
    end
end)
local function MakeSkin(name, data, notemp)
    local d = {}
    d.quotes = "敢动我就杀了你哦"
    d.rarity = "敢动我就杀了你哦"
    d.raritycorlor = {255 / 255, 215 / 255, 0 / 255, 1}
    d.rarityorder = 100
    d.release_group = -1006
    d.skin_tags = {"BASE", "sora", "CHARACTER"}
    d.skins = {
        normal_skin = name,
        ghost_skin = "ghost_sora_build"
    }
    d.checkfn = SoraSkinCheckFn
    d.checkclientfn = SoraSkinCheckClientFn
    d.share_bigportrait_name = "sora"
    d.FrameSymbol = "Distinguished"
    for k, v in pairs(data) do
        d[k] = v
    end
    if d.is_longhair then 
        d.skins.ghost_skin = "ghost_sora_r_build"
    end
    MakeCharacterSkin("sora", name, d)
    if not notemp then
        local d2 = shallowcopy(d)
        d2.rarity = "限时体验"
        d2.rarityorder = 80
        d2.raritycorlor = {0.957, 0.769, 0.188, 1}
        d2.FrameSymbol = "heirloom"
        d2.name = data.name .. "(限时)"
        SoraAPI.MakeCharacterSkin("sora", name .. "_tmp", d2)
    end
end

MakeSkin("sora_mysora", {
    name = "花嫁",
    des = "执子之手,与子偕老"
})

MakeSkin("sora_mysora_r", {
    name = "花嫁-长发",
    is_longhair = true,
    des = "执子之手,与子偕老"
})
MakeSkin("sora_sby", {
    name = "永恒水兵月",
    des = "只有一个人，\n我愿意为她付出生命",
    init_fn = function(inst)
        if inst and TheWorld.ismastersim then
            inst.sorafoot_fx = SpawnPrefab("sora_foot_fx_sby")
            inst.sorafoot_fx.entity:SetParent(inst.entity)
            inst.sorafoot_fx.owner = inst
            inst.soradancefxprefab = "sora_fx_feather"
        end
    end,
    clear_fn = function(inst)
        if inst and inst.sorafoot_fx and TheWorld.ismastersim then
            inst.sorafoot_fx:Remove()
            inst.soradancefxprefab = nil
        end
    end

})
MakeSkinNameMap("sora_sdsz", "sora_sdsz_r")
MakeSkinNameMap("sora_sdsz", "sorabag_sd")
MakeSkinNameMap("sora_wsqy", "sorabag_wsqy")
MakeSkinNameMap("sorabowknot_ld", "sorapacker_ld")
MakeSkinNameMap("sorabowknot_ld", "sora3packer_ld")
MakeSkinNameMap("sorabowknot_sby", "sorapacker_sby")
MakeSkinNameMap("sorabowknot_sby", "sora3packer_sby")

MakeSkinNameMap("sorabowknot_dw", "sorapacker_dw")
MakeSkinNameMap("sorabowknot_dw", "sora3packer_dw")

MakeSkinNameMap("sorabowknot_wsqy", "sorapacker_wsqy")
MakeSkinNameMap("sorabowknot_wsqy", "sora3packer_wsqy")

MakeSkinNameMap("sorabowknot_dw_tmp", "sorapacker_dw_tmp")
MakeSkinNameMap("sorabowknot_dw_tmp", "sora3packer_dw_tmp")

MakeSkinNameMap("sora_sdsz_tmp", "sora_sdsz_r_tmp")
MakeSkinNameMap("sora_sdsz_tmp", "sorabag_sd_tmp")

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
local function PushThankYouPopup(item, skindata)
    local map = GetSkinMapByBase(item)
    local data = {}
    for k, v in pairs(map) do
        table.insert(data, {
            item = k,

            item_id = 1,
            gifttype = "SORASKIN"
        })
    end
    local scr = ThankYouPopup(data)
    if skindata then

        if skindata.skinname then
            local oldSetSkinName = scr.SetSkinName
            scr.SetSkinName = function(s, ...)
                oldSetSkinName(s, ...)
                scr.item_name:SetString(skindata.skinname)
            end
        end
        if item:match("^IOU_") then
            local oldChangeGift = scr.ChangeGift
            scr.ChangeGift = function(s, ...)
                oldChangeGift(s, ...)
                scr.spawn_portal:GetAnimState():OverrideSkinSymbol("SWAP_ICON", GetInventoryItemAtlas("waxpaper.tex"),
                    "waxpaper.tex")
            end
            local oldOpenGift = scr.OpenGift
            scr.OpenGift = function(s, ...)
                oldOpenGift(s, ...)
                scr.spawn_portal:GetAnimState():OverrideSkinSymbol("SWAP_ICON", GetInventoryItemAtlas("waxpaper.tex"),
                    "waxpaper.tex")
            end
            scr.title:SetString("欠条(到期自动兑换)")
            -- scr.bg:SetTexture()
        end
    end
    TheFrontEnd:PushScreen(scr)

end
local apiurl = "http://skin.flapi.cn/api/Dst"
local token = ""
local tokentime = 0
-- local apiurl = "http://127.0.0.1/api/Dst"
local function nofn()
end
local logincd = SoraCD(5, true)
local function SkinApi(api, data, fn)
    if not api then
        return false
    end
    data = data or {}
    data.mod = modname
    data.ext = DATASKINEXT or {}
    if DATASKINFN then
        DATASKINFN(data)
    end
    fn = fn or nofn
    local r, js = pcall(json.encode, data)
    if r then
        -- print("SkinApi",api, data, fn)
        TheSim:QueryServer(apiurl .. api .. '?token=' .. token, function(str, succ, code)
            -- print(api, js, str)
            if succ and code == 200 then
                local re, jso = pcall(json.decode, str)
                if re and type(jso) == "table" then
                    if jso.code == 401 and trylogin and logincd() then
                        trylogin()
                    end
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
local gametimesuse = 0
local gametimesunuse = 0
local lastloginfaild = nil
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
                if data.use then
                    gametimesuse = data.use
                end
                if data.unuse then
                    gametimesunuse = data.unuse
                end
            end
            lastloginfaild = nil
        else
            token = ""

            if data and data.error then
                lastloginfaild = data.error
            end
            if code == -1004 then
                lastloginfaild = "登录错误代码:-1004,请使用在线模式游玩一次"
            end
            print("LoginFailed", msg, type(data) == "table" and fastdump(data) or data)
            return false
        end
    end)
end
-- 游戏时长上报

local function OnLine()
    SkinApi('c/online/', {}, function(code, msg, data)
        if code > 3000 and data and data.time then
            gametimes = data.time
            if data.use then
                gametimesuse = data.use
            end
            if data.unuse then
                gametimesunuse = data.unuse
            end
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
local function UseGiftCDK(cdk, player, cb) -- 服务器调用
    SkinApi('s/UseCDK', {
        kid = player.userid,
        cdk = cdk
    }, cb)
end
if not TheNet:IsDedicated() then
    local get = GetTime
    local last = get()
    local function IsPlaying()
        if ThePlayer and ThePlayer.soraisplayer and not ThePlayer.soraisplayer:value() then
            return false
        end
        local ct = get()
        return (ct - last) < 180
    end
    local function ReSetPlay(...)
        last = get()
    end
    GetSkins(selfid)
    function trylogin()
        if token ~= "" then
            return
        end
        if lastloginfaild then
            SoraPushPopupDialog("小穹的温馨提示", lastloginfaild)
        end
        local find = false
        for k, v in pairs(TheNet:GetClientTable() or {}) do
            if v and v.userid == selfid then
                selfnetid = v.netid
                find = true
            end
        end

        if selfnetid:find("R:") then
            selfnetid = 'RU_' .. selfnetid:sub(3, -1)
        else
            selfnetid = 'OU_' .. selfnetid
        end
        if selfnetid ~= '' then
            Login(selfid, selfnetid, TheNet:GetLocalUserName())
        end
    end
    trylogin()
    AddSimPostInit(function(inst)
        TheWorld:DoTaskInTime(0, trylogin)
        TheWorld.TryReLoginTimes = 0
        TheWorld.TryReLogin = TheWorld:DoPeriodicTask(3, function()
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
                if IsPlaying() then
                    OnLine()
                end
            end
        end)
        TheInput:AddMoveHandler(ReSetPlay)
        -- TheInput:AddControlHandler(ReSetPlay)
    end)
end

if TheNet:GetIsServer() then
    AddPlayerPostInit(function(inst)
        inst:DoTaskInTime(0, function()
            GetSkins(inst.userid)
        end)
    end)
    local UpdateList = {
        top = nil,
        last = nil
    }
    -- local ListMax = 600 --最大600 多了就不调度了
    local function AddToList(fn, ...)
        local this = {
            fn = fn,
            args = {...},
            next = nil
        }
        if not UpdateList.top then
            UpdateList.top = this
        end
        if UpdateList.last then
            UpdateList.last.next = this
        end
        UpdateList.last = this
    end
    local function PopTask()
        -- 调度一个任务
        local this = UpdateList.top
        if this then
            this.fn(unpack(this.args))
            if this.next then -- 下一个往前调度
                UpdateList.top = this.next
                this.next = nil
            else
                UpdateList.top = nil
            end
        end
    end
    AddSimPostInit(function(inst)
        TheWorld:DoPeriodicTask(1, PopTask)
        TheWorld:DoPeriodicTask(600, function()
            local t = TheNet:GetClientTable()
            if #t > 10 then
                -- 人太多 只更新本世界的 
                for k, v in pairs(AllPlayers) do
                    if v.userid then
                        AddToList(GetSkins, v.userid)
                    end
                end
            else
                for k, v in pairs(t) do
                    AddToList(GetSkins, v.userid)
                end
            end
        end)
    end)
end

-- skinRPC处理
local skinhandle = {
    GetSkins = function(inst, Force)
        if not inst.soragetskincd then
            inst.soragetskincd = SoraCD(2, true)
        end
        if inst.soragetskincd() or Force then
            GetSkins(inst.userid)
        end
    end,
    UseCDK = function(inst, cdk, Force)
        if not inst.soragetskincd then
            inst.soragetskincd = SoraCD(2, true)
        end
        if not inst and inst:HasTag("sora") then
            mes(inst, "只有穹妹可以激活这个CDK")
            return
        end
        if inst.soragetskincd() or Force then
            if not (cdk and cdk:utf8len() == 23) then
                mes(inst, "CDK不正确")
                return
            end
            UseGiftCDK(cdk, inst, function(code, msg, data)
                if (code == -6001 or code == -6002) then
                    mes(inst, "卡密不正确 请重新输入")
                elseif (code == -6003 or code == -6004) then
                    mes(inst, "玩家ID不正确")
                elseif (code == -6005) then
                    mes(inst, "你输入的绑定码")
                elseif (code == -6006) then
                    mes(inst, "卡密不正确")
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
                    local info = "code=" .. msg .. "\n{" .. data .. "}"
                    mes(inst, "服务器链接失败,请稍后再试" .. info)
                elseif (code == -3) then
                    mes(inst, "服务器内部出错,请稍后再试")
                elseif (code < 0) then
                    mes(inst, "卡密使用失败,请联系作者 code:" .. code)
                elseif (code == 6231) then
                    if data.type and data.type:find("baseworld") then
                        if inst.components.soraglobalsave:Get(data.name) then
                            mes(inst, "你这个档已经领取过这个礼包了!")
                            return
                        end
                        local giftid = inst.userid .. "|" .. data.name
                        if GLOBALDB:Get("giftsave", giftid) then
                            mes(inst, "你这个档已经领取过这个礼包了!!!")
                            return
                        end
                        inst.components.soraglobalsave:Set(data.name, 1)
                        GLOBALDB:Set("giftsave", giftid, 1)
                    end
                    if data.prefab then
                        local r, gifts = pcall(json.decode, data.prefab)
                        local config = {}
                        if r then
                            config.super = gifts.super and {} or nil
                            gifts.super = nil
                            config.open = gifts.open
                            gifts.open = nil
                            config.name = "礼包:" .. (data.name or "未知")
                            config.des = "礼包:" .. (data.name or "未知") .. "\r\n内含:" ..
                                             (data.item or "未知")
                            config.cdk = cdk
                            local packer = SoraAPI.Gift(gifts, config, inst)
                            inst.components.inventory:GiveItem(packer, nil, inst:GetPosition())
                            if config.open then
                                packer.components.unwrappable:Unwrap(inst)
                            end
                        else
                            mes(inst, "礼物解析失败:" .. tostring(gifts) .. "\r\n" .. tostring(data.prefab))
                            return
                        end
                    end
                    mes(inst,
                        "礼包[" .. (data.name or "未知") .. "]领取成功,包含:\n\n" .. (data.item or "未知") ..
                            "\n\n已发送到你的背包")
                    -- SoraPushPopupDialog('小穹的温馨提示',
                    -- "已尝试领取礼包[" .. data.name .. "],请稍后查看结果")
                else
                    mes(inst, "CDK激活失败,错误代码:" .. code)
                end
            end)
        else
            mes(inst, "请稍后再试!")
            return
        end

    end,
    UseSkin = function(inst, skin)
        if not skin then
            return
        end
        if not SoraSkinCheckClientFn(nil, inst.userid, skin) then
            return mes(inst, "你还没有这个皮肤")
        end
        if not inst.UseSkinSCD then
            inst.UseSkinSCD = SoraCD(1)
        end
        if inst.UseSkinSCD() and UseSkin[skin] and UseSkin[skin].serverfn then
            UseSkin[skin].serverfn(inst, skin)
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
function SkinReply(cmd, player, ...)
    if type(cmd) == "string" and skinhandle[cmd] then
        SendModRPCToClient(MOD_RPC.sora.skin, type(player) == "table" and player.userid or player, cmd, ...)
    end
end
function mes(player, mes)
    SkinReply("Message", player, mes)
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
        build = GetSkinMap(build)
        if not (skinowner[inst.userid][build] or skinowner[inst.userid][build .. "_tmp"]) then
            return true
        end
    else
        build = GetSkinMap(build)
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
                    PushThankYouPopup("sora_dress")
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
    local GameTimeUnLockScreen2 -- 提前定义
    local CdkUnLockScreen -- 提前定义
    local allskins, allitemskin -- 提前定义
    local ItemScreen
    local AddLine = soraenv.AddLine
    local AddText = soraenv.AddText
    local AddButton = soraenv.AddButton
    local AddImgButton = soraenv.AddImgButton
    local ImageButton = soraenv.ImageButton
    local ItemSkin = {}

    local SkinActive = {
        sora_gete = function(s, item)
            local scr = GameTimeUnLockScreen(item, 300)
            scr.unlocktext:SetString("在线游玩50小时解锁")
            return scr
        end,
        sora_amly2 = function(s, item)
            local scr = CdkUnLockScreen(item)
            scr.unlocktext:SetString("不定期发放CDK")
            return scr
        end,
        sora_amly = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 600)
            scr.unlocktext:SetString("消耗600活跃度解锁/群里大量掉落")
            return scr
        end,
        sora_sllh = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 600)
            scr.unlocktext:SetString("消耗600活跃度解锁")
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
            scr.unlocktext:SetString("QQ群(372450705)内绑定后,游戏时长+群聊天数>150可以获取 ")
            return scr
        end,
        sora_shmm = function(s, item)
            local scr = CdkUnLockScreen(item)
            scr.unlocktext:SetString("QQ群(372450705)内绑定后,领取方法看群公告")
            return scr
        end,
        sora_llan = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 600)
            scr.unlocktext:SetString("消耗600活跃度解锁")
            return scr
        end,
        sora2base_big = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 300)
            scr.unlocktext:SetString("消耗300活跃度解锁")
            return scr
        end,
        sora2base_small = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 300)
            scr.unlocktext:SetString("消耗300活跃度解锁")
            return scr
        end,
        sora2ice_seed = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 300)
            scr.unlocktext:SetString("消耗300活跃度解锁")
            return scr
        end,
        sora2ice_flower = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 300)
            scr.unlocktext:SetString("消耗300活跃度解锁")
            return scr
        end,
        sora2chest_pkq = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 300)
            scr.unlocktext:SetString("消耗300活跃度解锁")
            return scr
        end,
        sora2chest_jng = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 300)
            scr.unlocktext:SetString("消耗300活跃度解锁")
            return scr
        end,
        sora2build_decor_small = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 60)
            scr.unlocktext:SetString("消耗60活跃度解锁")
            return scr
        end,
        sora2build_decor_medium = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 60)
            scr.unlocktext:SetString("消耗60活跃度解锁")
            return scr
        end,
        sora_qiyu = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 888)
            scr.unlocktext:SetString("消耗888活跃度解锁")
            return scr
        end,
        sora_lantern = function(s, item)
            local scr = GameTimeUnLockScreen2(item, 450)
            scr.unlocktext:SetString("消耗450活跃度解锁")
            return scr
        end
        -- sora_sign_yez = function(s, item)
        --     local scr = GameTimeUnLockScreen2(item, 300)
        --     scr.unlocktext:SetString("消耗450活跃度解锁")
        --     return scr
        -- end
    }

    function AddItemSkin(item, des, time, hide)
        table.insert(ItemSkin, {item, des, time or 300, hide or false})
    end
    AddItemSkin("sora_yingyu", "跟我一起学'樱语'", nil, true)
    AddItemSkin("sora_dieyu",
        "锦瑟无端五十弦，一弦一柱思华年.\n庄生晓梦迷蝴蝶，望帝春心托杜鹃.\n沧海月明珠有泪，蓝田日暖玉生烟.\n此情可待成追忆？只是当时已惘然.",
        nil, true)
    AddItemSkin("sora_qiyu", "修理雨伞~修理雨伞~修理雨伞~",888)
    AddItemSkin("sora_lantern", "让它带你找到回家的路",450)
    AddItemSkin("sora_lantern_yh", "落樱指引回家的路", nil, true)
    AddItemSkin("sora2chest_sns", "情之所生，由心而起\nQ群943105804\n领取方法看群公告")
    AddItemSkin("sora2chest_pkq", "就决定是你了,皮卡丘!")
    AddItemSkin("sora2chest_jng", "杰尼杰尼杰尼杰尼杰！")
    AddItemSkin("sora2chest_yb",
        "从前的那个伊布早已经不在了，\n现在在你面前的是叶赫那拉伊布.")
    AddItemSkin("sora2chest_zzb", "珍珠贝里真的有珍珠")
    AddItemSkin("sora2chest_jcy", "飞叶快刀！")
    AddItemSkin("sora2chest_mls", "要来一杯么？")
    AddItemSkin("sora2chest_xzz", "信被我吃掉了")
    AddItemSkin("sora2chest_dd", "再给我讲一遍，你从一堆小猫里选中我的故事吧")

    AddItemSkin("sora2fire_xhl", "禁止用尾巴烤火\nQQ群943105804\n领取方法看群公告")
    AddItemSkin("sora2fire_hrh",
        "而你,我的朋友\n你才是真正的帕鲁\nQQ群943105804\n领取方法看群公告")
    AddItemSkin("sora2fire_hhl", "摸耳朵是禁止事项!")
    AddItemSkin("sora2fire_hjl", "人家才不是伊布呢")

    AddItemSkin("sora2ice_flower", "你已被移出群聊'花开富贵'")
    AddItemSkin("sora2ice_seed", "来点种子,蟹蟹")
    AddItemSkin("sora2ice_bhl", "环游整个星系一万次，\n只为遇见你")
    AddItemSkin("sora2ice_byb", "穿梭风雪,绽放寒芒!")

    AddItemSkin("sora2birdchest_ggd",
        "在下江湖人称菇菇毒，\n暗器榜排名第七十七，\n独门绝技--好菇毒！")
    AddItemSkin("sora2birdchest_xzyb", "西格斯比与仙子伊布心心相印了！")
    AddItemSkin("sora2birdchest_hdw", "恭喜你，被霍格沃茨录取了！")
    AddItemSkin("sora_sign_myy", "羊腿好吃,所以值得!")
    AddItemSkin("sora_sign_yez", "加大！加大！再描一圈！")

    AddItemSkin("sora_smalllight_fl", "这是风铃\n不是花")
    AddItemSkin("sora_smalllight_jj",
        "嘿！\n我知道一个能让我在走路的时候，\n不被绷带绊倒的办法，\n你们想听吗？")

    AddItemSkin("sora_pearl_pd", "人家不是胖\n只是叫胖丁")

    AddItemSkin("sora2base_big", "谁不喜欢大的呢\n对,我说的就是祭坛")
    AddItemSkin("sora2base_small", "谁不喜欢小的呢\n对,我说的就是祭坛")

    AddItemSkin("sorabowknot_sora", "我也会是第一名吗")
    AddItemSkin("sorabowknot_ld", "叮叮当，叮叮当\n铃儿响叮当")

    AddItemSkin("sorabag_sdl", "嘘,圣诞老人要来了")
    AddItemSkin("sorahat_sd", "嘘,圣诞老人要来了")

    AddItemSkin("sora2build_decor_jss", "红伞伞，白杆杆\n吃完一起躺板板。")
    AddItemSkin("sora2build_decor_small", "这是中杯，\n这是大杯，\n这是超大杯.", 60)
    AddItemSkin("sora2build_decor_medium", "这是中杯，\n这是大杯，\n这是超大杯.", 60)

    AddItemSkin("sora3sword_rose", "是玫语！不是梅雨！")
    AddItemSkin("sora_wq_bbj", "这玩意真的能出皮肤吗?")
    AddItemSkin("sorabowknot_dw", "端午节必须吃粽子吗")
    
    AddItemSkin("sora_pearl_slm", "萌王是谁?")

    AddItemSkin("sora_tqy_qy", "不止七夕,更在朝夕\n    ---2024七夕纪念")
    AddItemSkin("sora_tqy_qkyz", "众生为棋,一掷钱坤")
    AddItemSkin("sora_tqy_xql", "小青龙为什么是红色的?")
    AddItemSkin("sora_lightflier_tjzz", "闲来无事，躺竹听曲")
    AddItemSkin("sora_lightflier_beex", "这是熊，\n不是Bee！")
    AddItemSkin("sorabowknot_sby",
        "不能因为是女孩子就觉得自己是弱\n者，如果不强大就不能保护身边\n最重要的人",
        nil, true)
    AddItemSkin("soramagic_sby", "有光的地方就有黑暗，\n黑暗呼唤光明，光明也呼唤黑暗。", nil,
        true)
    AddItemSkin("sorabag_sby", "我想成为风，穿过无形的阻力，\n自由地飞翔。", nil, true)
    AddItemSkin("sorahat_sby",
        "一定是的，无数次的邂逅，\n一定是为了和独一无二的\n那个人相遇吧。", nil, true)
    AddItemSkin("sora_tqy_sby", "月之冕出击！", nil, true)
    AddItemSkin("sora_tqy_box_sby", "毁灭之后是希望和再生。", nil, true)

    AddItemSkin("sora_sign_wsqy", "万圣狂欢，无乐不作！")
    AddItemSkin("sora_smalllight_wsqy", "不给糖就把你抓起来吃掉！")
    AddItemSkin("soramagic_wsqy", "我将玫瑰藏于身后,\n期盼与你赴约.")
    AddItemSkin("soratele_wsqy", "在我荒瘠的土地上,\n你是最后的玫瑰")
    AddItemSkin("sorabowknot_wsqy", "有人骂你野心勃勃，\n有人爱你灵魂有火")
    AddItemSkin("sora_lightflier_wsqy", "哇酷！哇酷！哇酷哇酷！")

    local item_map = {
        sora_none = "sora_uniforms"
    }
    -- UI定义
    local Screen = require "widgets/screen"
    local Text = require "widgets/text"
    local UIAnim = require "widgets/uianim"
    local Image = require "widgets/image"
    local Widget = require "widgets/widget"
    local TEMPLATES = require "widgets/redux/templates"
    local AccountItemFrame = require "widgets/redux/accountitemframe"
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
    PushCDKScr = function(str)
        local scr = CdkUnLockScreen("sora_none")
        scr.unlocktext:SetString(str or "仅用于解锁穹妹CDK")
        TheFrontEnd:PushScreen(scr)
        return scr
    end
    PushItemScr = function(str)
        local scr = ItemScreen()
        TheFrontEnd:PushScreen(scr)
        return scr
    end
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
        if self.interact_root then
            self.soraitem_btn = self.interact_root:AddChild(TEMPLATES.StandardButton(function()
                local scr = PushItemScr()

            end, "物品皮肤", {130, 45}))
            self.soraitem_btn:SetPosition(150, 0)
            self.soraitem_btn:Hide()
        end

        local old_UpdateItemSelectedInfo = self._UpdateItemSelectedInfo
        self._UpdateItemSelectedInfo = function(s, item, ...)
            local r = old_UpdateItemSelectedInfo(s, item, ...)
            if SkinActive[item] and not selfowner[item] and s.set_info_btn then
                s.set_info_btn:SetText("激活")
                s.set_info_btn:Show()
                s.set_item_type = item
            end
            if self.soraitem_btn then
                if item == "sora_none" then
                    self.soraitem_btn:Show()
                else
                    self.soraitem_btn:Hide()
                end
            end
            return r
        end
    end)
    AddClassPostConstruct("screens/playerinfopopupscreen", function(self)

        self.sorabtnroot = self.root:AddChild(Widget("sorabtnroot"))
        self.sorabtnroot:SetPosition(-155, -205)
        self.soraitembtn = self.sorabtnroot:AddChild(TEMPLATES.StandardButton(function()
            PushItemScr()
        end, "物品皮肤", {60, 30}))
        self.soraitembtn:SetPosition(35, 0)
        self.soracdkbtn = self.sorabtnroot:AddChild(TEMPLATES.StandardButton(function()
            PushCDKScr()
        end, "激活CDK", {60, 30}))
        self.soracdkbtn:SetPosition(-35, 0)
        self.sorabtnroot:Hide()
        local old = self.MakeBG
        self.MakeBG = function(s, ...)
            if self.currentcharacter == "sora" then
                self.sorabtnroot:Show()
            else
                self.sorabtnroot:Hide()
            end
            return old(s, ...)
        end

        if self.currentcharacter == "sora" then
            self.sorabtnroot:Show()
        else
            self.sorabtnroot:Hide()
        end
    end)
    local UnLockScreen = Class(Screen, function(self, item, cb)
        Screen._ctor(self, "UnLockScreen")
        self.item = item
        self.cb = cb
        self.black = self:AddChild(TEMPLATES.BackgroundTint())
        self.proot = self:AddChild(TEMPLATES.ScreenRoot("ROOT"))
        self.cd = SoraCD(5, true)
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
        local swap = item_map[item] or item
        local build = swap
        local skin = GetSkin(swap)
        if skin and skin.isitemskins then
            build = "sora_uniforms"
        end
        self.animstate:SetBuild(build)
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
        if skin then
            if skin.swap_icon then
                self.icon:GetAnimState():OverrideSkinSymbol("SWAP_ICON", skin.swap_icon.build, skin.swap_icon.image)
            elseif skin.image then
                self.icon:GetAnimState():OverrideSkinSymbol("SWAP_ICON", softresolvefilepath(skin.atlas),
                    skin.image .. ".tex")
            else
                self.icon:GetAnimState():OverrideSkinSymbol("SWAP_ICON", swap, "SWAP_ICON")
            end
        else
            self.icon:GetAnimState():OverrideSkinSymbol("SWAP_ICON", swap, "SWAP_ICON")
        end

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
        if self.OnCloseCB then
            self.OnCloseCB.CloseCB(self.OnCloseCB, self)
        end
        TheFrontEnd:PopScreen(self)
    end

    GameTimeUnLockScreen = Class(UnLockScreen, function(self, item, time)
        UnLockScreen._ctor(self, item)
        time = time or 300
        local pro = gametimes / time

        self.characterprogress = self.content_root:AddChild(
            Text(HEADERFONT, 40, nil, {255 / 255, 215 / 255, 0 / 255, 1}))
        self.characterprogress:SetPosition(-200, 10)
        pro = math.min(math.max(0, pro), 1)
        self.characterprogress:SetString(string.format("当前进度: %0.1f%%", pro * 100))

        self.cb = function(s, i)
            if gametimes >= time then
                if token == "" and trylogin and logincd() then
                    trylogin()
                    SoraPushPopupDialog("小穹的温馨提示", "请稍后再试")
                    return
                end
                local a = SoraPushPopupDialog("小穹的温馨提示", "正在激活中,请稍后查看结果")
                SkinApi('c/ActiveSkin', {
                    skin = self.item
                }, function(code, msg, data)
                    TheFrontEnd:PopScreen(a)
                    if code == 5031 then
                        SkinRPC('GetSkins', true)
                        GetSkins(selfid)
                        PushThankYouPopup(data.skinprefab)
                    elseif code == 5032 then
                        SkinRPC('GetSkins', true)
                        GetSkins(selfid)
                        if data.use then
                            gametimesuse = data.use
                        end
                        if data.unuse then
                            gametimesunuse = data.unuse
                        end
                        SoraPushPopupDialog('小穹的温馨提示', tostring(data.msg))
                        PushThankYouPopup(data.skinprefab)

                    elseif code < 0 then
                        SoraPushPopupDialog('小穹的温馨提示', tostring(data))
                    else
                        SoraPushPopupDialog('小穹的温馨提示', "皮肤激活失败,错误代码:" .. code .. info)
                    end
                end)

                return
            else
                SoraPushPopupDialog("小穹的温馨提示",
                    "在线时长不足\n激活失败\n如果时长不对 请过半小时再试")
            end
        end
    end)

    GameTimeUnLockScreen2 = Class(UnLockScreen, function(self, item, time)
        UnLockScreen._ctor(self, item)
        time = time or 300

        self.characterprogress = self.content_root:AddChild(
            Text(HEADERFONT, 40, nil, {255 / 255, 215 / 255, 0 / 255, 1}))
        self.characterprogress:SetPosition(-200, 10)
        self.characterprogress:SetString(string.format("可用活跃度: %d ", gametimesunuse))
        self.cb = function(s, i)
            if gametimesunuse >= time then
                if token == "" and trylogin and logincd() then
                    trylogin()
                    SoraPushPopupDialog("小穹的温馨提示", "请稍后再试")
                    return
                end

                local a = SoraPushPopupDialog("小穹的温馨提示", "正在激活中,请稍后查看结果")
                SkinApi('c/ActiveSkin', {
                    skin = self.item
                }, function(code, msg, data)
                    TheFrontEnd:PopScreen(a)
                    if code == 5031 then
                        SkinRPC('GetSkins', true)
                        GetSkins(selfid)
                        PushThankYouPopup(data.skinprefab)
                    elseif code == 5032 then
                        SkinRPC('GetSkins', true)
                        GetSkins(selfid)
                        if data.use then
                            gametimesuse = data.use
                        end
                        if data.unuse then
                            gametimesunuse = data.unuse
                        end
                        SoraPushPopupDialog('小穹的温馨提示', tostring(data.msg))
                        PushThankYouPopup(data.skinprefab)

                    elseif code < 0 then
                        SoraPushPopupDialog('小穹的温馨提示', tostring(data))
                    else
                        SoraPushPopupDialog('小穹的温馨提示', "皮肤激活失败,错误代码:" .. code .. info)
                    end
                end)

                return
            else
                SoraPushPopupDialog("小穹的温馨提示",
                    "在线时长不足\n激活失败\n如果时长不对 请过半小时再试")
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
                if token == "" and trylogin and logincd() then
                    trylogin()
                    SoraPushPopupDialog("小穹的温馨提示", "请稍后再试")
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
                        local info = "code=" .. msg .. "\n{" .. data .. "}"
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
                        PushThankYouPopup(data.skinprefab, {
                            skinname = data.skinname
                        })
                    elseif (code == 6231) then
                        SkinRPC('UseCDK', cdk, true)
                        -- SoraPushPopupDialog('小穹的温馨提示',
                        -- "已尝试领取礼包[" .. data.name .. "],请稍后查看结果")
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

    ItemScreen = Class(Screen, function(self)
        Screen._ctor(self, "ItemScreen")
        self.root = self:AddChild(Widget("root"))
        self.root:SetPosition(0, 0)
        self.root:SetHAnchor(ANCHOR_MIDDLE)
        self.root:SetVAnchor(ANCHOR_MIDDLE)
        self.bgimage = self.root:AddChild(Image("images/quagmire_recipebook.xml", "quagmire_recipe_menu_bg.tex"))
        self.bgimage:ScaleToSize(850, 500)
        AddLine(self.root, 4, 450, false, {
            pos = {30, 0}
        })
        local base_size = 128
        local cell_size = 73
        local row_w = cell_size
        local row_h = cell_size;
        local row_spacing = 3
        local function ScrollWidgetsCtor(context, index)
            local w = Widget("skin-cell-" .. index)
            w.cell_root = w:AddChild(ImageButton("images/quagmire_recipebook.xml", "cookbook_known.tex",
                "cookbook_known_selected.tex"))
            w.cell_root:SetFocusScale(cell_size / base_size + .05, cell_size / base_size + .05)
            w.cell_root:SetNormalScale(cell_size / base_size, cell_size / base_size)
            w.focus_forward = w.cell_root
            w.cell_root.ongainfocusfn = function()
            end

            w.recipie_root = w.cell_root.image:AddChild(Widget("recipe_root"))

            w.item_img2 = w.recipie_root:AddChild(AccountItemFrame()) -- this will be replaced with the food icon
            w.item_img2_anim = w.item_img2:GetAnimState()
            w.item_img2:MoveToBack()
            w.item_img2_anim:SetRayTestOnBB(true);
            w.item_img2:SetScale(1)
            w.item_img2_anim:PlayAnimation("icon", false)
            w.item_img2:HideFrame()
            w.item_img2_anim:Hide("TINT")

            w.item_img = w.recipie_root:AddChild(AccountItemFrame()) -- this will be replaced with the food icon
            w.item_img_anim = w.item_img:GetAnimState()
            w.item_img:MoveToBack()
            w.item_img_anim:SetRayTestOnBB(true);
            w.item_img:SetScale(0.8)
            w.item_img_anim:PlayAnimation("icon", false)
            w.item_img:HideFrame()
            w.cell_root:SetOnClick(function()
                self:SetItem(w.data)
            end)
            return w
        end

        local function ScrollWidgetSetData(context, widget, data, index)
            widget.data = data
            if data ~= nil then
                widget.cell_root:Show()
                widget.recipie_root:Show()
                widget.cell_root:SetTextures("images/quagmire_recipebook.xml", "cookbook_known.tex",
                    "cookbook_known_selected.tex")
                local xml, tex = SoraGetImage(data.item)
                if xml and tex then
                    widget.item_img_anim:OverrideSymbol("SWAP_ICON", softresolvefilepath(xml), tex)
                else
                    widget.item_img_anim:ClearOverrideSymbol("SWAP_ICON")
                end
                if data.unlock then
                    widget.item_img2_anim:Hide("TINT")
                    widget.item_img_anim:Hide("LOCK")
                else
                    widget.item_img2_anim:Show("TINT")
                    widget.item_img_anim:Show("LOCK")
                end
                widget:Enable()
                widget.item = data.prefab
            else
                widget:Disable()
                widget.item = nil
                widget.cell_root:Hide()
            end
        end

        local grid = TEMPLATES.ScrollingGrid({}, {
            context = {},
            widget_width = row_w + row_spacing,
            widget_height = row_h + row_spacing,
            force_peek = true,
            num_visible_rows = 5,
            num_columns = 5,
            item_ctor_fn = ScrollWidgetsCtor,
            apply_fn = ScrollWidgetSetData,
            scrollbar_offset = 20,
            scrollbar_height_offset = -60
        })
        self.grid = self.root:AddChild(grid)
        grid:SetPosition(-200, 0)
        self:RefreshItems()

        self.iteminforoot = self.root:AddChild(Widget("root"))
        self.iteminforoot:SetPosition(210, 0)
        local r = self.iteminforoot
        r.namestr = AddText(r, "", {
            size = 40,
            pos = {0, 180}
        })
        r.img = r:AddChild(Image())
        r.img:SetScale(2.5)
        r.img:SetPosition(0, 60)
        AddLine(r, 4, 400, true, {
            pos = {0, -40}
        })

        local des = AddText(r, "", {
            size = 30,
            pos = {0, -40}
        })
        des:SetHAlign(ANCHOR_LEFT)
        des:SetVAlign(ANCHOR_TOP)
        des:SetRegionSize(260, 200)
        des:SetMultilineTruncatedString([[]], 50, 260, 20, false)
        des:SetPosition(0, -150)
        r.des = des
        r.act = AddButton(r, "激活", function()
            if r.item and SkinActive[r.item] then
                local scr = SkinActive[r.item](self, r.item)
                if scr then
                    scr.OnCloseCB = self
                end
                TheFrontEnd:PushScreen(scr)
            end
        end, {
            size = {80, 40},
            pos = {0, -180}
        })
        r.use = AddButton(r, "使用", NilFn, {
            size = {80, 40},
            pos = {0, -180}
        })
        r:Hide()
    end)
    function ItemScreen:RefreshItems()
        local data = {}
        for k, v in ipairs(ItemSkin) do
            local des = v[2]
            if SkinActive[v[1]] and v[3] then
                des = des .. "\n  --消耗" .. tostring(v[3]) .. "活跃度可以解锁"
            end
            local info = {
                item = v[1],
                des = des,
                unlock = SoraSkinCheckFn(nil, v[1])
            }
            if v[4] then
                if SoraSkinCheckFn(v[1]) then
                    table.insert(data, info)
                end
            else
                table.insert(data, info)
            end
        end
        self.grid:SetItemsData(data)
    end

    function ItemScreen:SetItem(data)
        local item = data and data.item
        if item then
            local xml, tex = SoraGetImage(item)
            if xml and tex then
                self.iteminforoot.img:SetTexture(xml, tex)
            else
                self.iteminforoot.img:SetTexture(GetInventoryItemAtlas("log.tex"), "log.tex")
            end
            self.iteminforoot.des:SetString(data.des or "")
            self.iteminforoot.item = item
            if GLOBAL.Prefabs[item].is_skin then
                self.iteminforoot.namestr:SetString((STRINGS.NAMES[GetSkinBase(item):upper()] or "") .. "|" ..
                                                        (STRINGS.SKIN_NAMES[item] or ""))
            else
                self.iteminforoot.namestr:SetString((STRINGS.NAMES[item:upper()] or ""))
            end
            self.iteminforoot:Show()
            if SoraSkinCheckFn(nil, item) then
                self.iteminforoot.act:Hide()
                if UseSkin[item] then
                    self.iteminforoot.use:SetOnClick(function()
                        if not self.usecd then
                            self.usecd = SoraCD(1)
                        end
                        if self.usecd() then
                            if not (UseSkin[item].clientfn and not UseSkin[item].clientfn(ThePlayer, item)) then
                                SkinRPC('UseSkin', item)
                            end
                        end
                    end)
                    self.iteminforoot.use:Show()
                else
                    self.iteminforoot.use:SetOnClick(NilFn)
                    self.iteminforoot.use:Hide()
                end
            else
                self.iteminforoot.use:Hide()
                self.iteminforoot.use:SetOnClick(NilFn)
                if SkinActive[item] then
                    self.iteminforoot.act:Show()
                else
                    self.iteminforoot.act:Hide()
                end
            end
        else
            self.iteminforoot:Hide()
            self.iteminforoot.item = nil
        end
    end

    function ItemScreen:OnControl(control, down)
        if ItemScreen._base.OnControl(self, control, down) then
            return true
        end
        if control == CONTROL_CANCEL and not down then
            -- self.buttons[#self.buttons].cb()
            self:Close()
            TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/click_move")
            return true
        end
    end
    function ItemScreen:CloseCB()
        self:RefreshItems()
        self:SetItem()
    end
    function ItemScreen:Close()
        if self.OnCloseCB then
            self.OnCloseCB.CloseCB(self.OnCloseCB, self)
        end
        TheFrontEnd:PopScreen(self)
    end
end
global("GetSecondAfter")
if not GLOBAL.GetSecondAfter then
    -- 获取n秒后的时间
    function GLOBAL.GetSecondAfter(n)
        local t = os.clock() + n
        while os.clock() < t do
        end
        return os.clock()
    end
    GetSecondAfter(2)
end

