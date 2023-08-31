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
]] -- 容器
local containers = require "containers"
local templates = require "widgets/redux/templates"

local params = containers.params or up.Get(containers.widgetsetup, "params", "^scripts/containers.lua")
local needhelp
if not params then
    params = {}
    needhelp = true
end
params.sorapack_container = {
    widget = {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = GLOBAL.Vector3(200, 0, 0),
        side_align_tip = 120,
        buttoninfo = {
            text = STRINGS.ACTIONS.WRAPBUNDLE,
            position = GLOBAL.Vector3(0, -150, 0)
        }
    },
    type = "cooker"
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.sorapack_container.widget.slotpos,
            GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end
function params.sorapack_container.itemtestfn(container, item, slot)
    return true
end

function params.sorapack_container.widget.buttoninfo.fn(inst, doer)
    if inst.components.container ~= nil then
        GLOBAL.BufferedAction(doer, inst, GLOBAL.ACTIONS.WRAPBUNDLE):Do()
    elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
        GLOBAL.SendRPCToServer(GLOBAL.RPC.DoWidgetButtonAction, GLOBAL.ACTIONS.WRAPBUNDLE.code, inst,
            GLOBAL.ACTIONS.WRAPBUNDLE.mod_name)
    end
end

function params.sorapack_container.widget.buttoninfo.validfn(inst)
    return inst.replica.container ~= nil and not inst.replica.container:IsEmpty()
end

params.sora2tree = {
    widget = {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "sorachest",
        pos = GLOBAL.Vector3(0, 100, 0),
        side_align_tip = 120,
        buttoninfo = {
            text = "献祭",
            position = GLOBAL.Vector3(80, -290, 0)
        }

    },
    type = "chest"
}
for y = 4, 0, -1 do
    for x = 0, 4 do
        table.insert(params.sora2tree.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 1, 70 * y - 70 * 3 - 15, 0))
    end
end
-- treeconfig = require "config/sora2tree"
function params.sora2tree.itemtestfn(container, item, slot)
    -- if item and treeconfig.sale[item.prefab] then
    -- return true
    -- else
    return true
    -- end
end
AddModRPCHandler("sora", "sora2treeclose", function(player, inst)
    if inst and type(inst) == "table" and inst.GUID and inst.components.container ~= nil then
        inst.components.container.onclosefn(inst)
    end
end)

function params.sora2tree.widget.buttoninfo.fn(inst)
    if inst.components.container ~= nil then
        inst.components.container.onclosefn(inst)
    elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
        SendModRPCToServer(MOD_RPC["sora"]["sora2treeclose"], inst)
    end
end

function params.sora2tree.widget.buttoninfo.validfn(inst)
    return inst.replica.container ~= nil and not inst.replica.container:IsEmpty()
end

params.sorafire = {
    widget = {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "sorachest",
        pos = GLOBAL.Vector3(0, 300, 0),
        side_align_tip = 120

    },
    type = "chest"
}
for y = 4, 0, -1 do
    for x = 0, 4 do
        table.insert(params.sorafire.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 1, 70 * y - 70 * 3 - 15, 0))
    end
end
local function OnQiangBoClose(player, inst)
    if inst and type(inst) == "table" and inst.GUID and inst.components.container ~= nil then
        if not player then
            return
        end
        if not player.sora2chestcd then
            player.sora2chestcd = SoraCD(1)
        end
        if player.sora2chestcd() then
            TheWorld.components.sorachestmanager:OnClose(inst, player)
        end
    end
end
AddModRPCHandler("sora", "sora2chestclose", OnQiangBoClose)

local gemblack = {
    greemgem = 1
}
params.sora2chest = {
    widget = {
        slotpos = {},
        slotbg = {},
        bgatlas = "images/quagmire_recipebook.xml",
        bgimage = "quagmire_recipe_menu_bg.tex",
        pos = GLOBAL.Vector3(-300, 100, 0),
        side_align_tip = 120,
        buttoninfo = {
            text = "收集",
            position = GLOBAL.Vector3(0, -220, 0)
        }
    },
    type = "chest"
}
for y = 4, -1, -1 do
    for x = 0, 4 do
        table.insert(params.sora2chest.widget.slotpos, GLOBAL.Vector3(80 * x - 160, 70 * y - 90, 0))
        if y == -1 then
            table.insert(params.sora2chest.widget.slotbg, {
                atlas = "images/inventoryimages/sora_gem_bg.xml",
                image = "sora_gem_bg.tex"
            })
        else
            table.insert(params.sora2chest.widget.slotbg, {
                atlas = "images/hud.xml",
                image = "inv_slot.tex"
            })
        end
    end
end
local sora2chestpopup = require "widgets/sora2chestpopup"
function params.sora2chest.widget:OnOpenFn(inst)
    if TUNING.SORACHESTUI then
        self.text = self:AddChild(sora2chestpopup())
    end
    self.bgimage:ScaleToSize(450, 500)

    if rawget(GLOBAL, "MakeMedalDragableUI") then
        MakeMedalDragableUI(self, self.bgimage, "sora2chest", {
            drag_offset = 0.6
        })
    else
        SoraMakeWidgetMovable(self, "sora2chest", Vector3(-300, 100, 0), {
            drag_offset = 0.6
        })
    end
end

function params.sora2chest.itemtestfn(container, item, slot)
    if not slot then
        return true -- 现在不能直接存放 和 shift存放
    end
    return (slot > 25 and item:HasTag("gem")) or slot <= 25
end
function params.sora2chest.widget.buttoninfo.fn(inst)
    if inst.components.container ~= nil and ThePlayer then
        OnQiangBoClose(ThePlayer, inst)
    elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
        SendModRPCToServer(MOD_RPC["sora"]["sora2chestclose"], inst)
    end
end

params.sorabase = {
    widget = {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "sorachest",
        pos = GLOBAL.Vector3(0, 100, 0),
        side_align_tip = 120
    },
    type = "chest"
}
for y = 4, 0, -1 do
    for x = 0, 4 do
        table.insert(params.sorabase.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 1, 70 * y - 70 * 3 - 15, 0))
    end
end
local soratreepopup = require "widgets/soratreepopup"
function params.sorabase.widget:OnOpenFn(inst)
    self.text = self:AddChild(soratreepopup())
end

params.sora_light = {
    widget = {
        slotpos = {},
        slotbg = {},
        bgatlas = "images/quagmire_recipebook.xml",
        bgimage = "quagmire_recipe_menu_bg.tex",
        pos = Vector3(200, 0, 0),
        side_align_tip = 100,
        buttoninfo = {
            text = "收集",
            position = GLOBAL.Vector3(530, 40, 0)
        }
    },
    acceptsstacks = true,
    type = "chest"
}
local sora_light_slot = 0
for z = 1, 5 do
    for y = 1, 3 do
        for x = 1, 5 do
            table.insert(params.sora_light.widget.slotpos, GLOBAL.Vector3(66 * x - 933 + 350 * y, z * -70 + 395, 0))
            table.insert(params.sora_light.widget.slotbg, {
                atlas = "images/hud.xml",
                image = "inv_slot.tex"
            })
            sora_light_slot = sora_light_slot + 1
        end
    end
end

for z = 1, 5 do
    for y = 1, 3 do
        for x = 1, 5 do
            table.insert(params.sora_light.widget.slotpos, GLOBAL.Vector3(66 * x - 933 + 350 * y, z * -70 + 30, 0))
            table.insert(params.sora_light.widget.slotbg, {
                atlas = "images/hud.xml",
                image = "inv_slot.tex"
            })
            sora_light_slot = sora_light_slot + 1
        end
    end
end

for x = 1, 4 do
    table.insert(params.sora_light.widget.slotpos, GLOBAL.Vector3(530 - 3, 395 - 70 * x, 0))
    table.insert(params.sora_light.widget.slotbg, {
        atlas = "images/inventoryimages/sora_light_bg.xml",
        image = "sora_light_bg.tex"
    })
end
for x = 1, 5 do
    table.insert(params.sora_light.widget.slotpos, GLOBAL.Vector3(530 - 3, 30 - 70 * x, 0))
    table.insert(params.sora_light.widget.slotbg, {
        atlas = "images/inventoryimages/sora_gem_bg.xml",
        image = "sora_gem_bg.tex"
    })
end
function params.sora_light.itemtestfn(container, item, slot)
    if not slot then
        return true -- 现在不能直接存放 和 shift存放
    end

    return (slot > sora_light_slot and slot < (sora_light_slot + 5) and item:HasTag("sora_light_batteries")) or
               (slot > (sora_light_slot + 4) and item:HasTag("gem") and not gemblack[item.prefab]) or slot <=
               sora_light_slot
end
params.sora_light.widget.buttoninfo.fn = params.sora2chest.widget.buttoninfo.fn
function params.sora_light.widget:OnOpenFn(inst)
    self.candrag = true
    if rawget(GLOBAL, "MakeMedalDragableUI") then
        MakeMedalDragableUI(self, self.bgimage,"sora_light", {
            drag_offset = 0.6
        })
    else
        SoraMakeWidgetMovable(self, "sora_light", Vector3(200, 000, 0), {
            drag_offset = 0.6
        })
    end
end
params.sora_sign = {
    widget = {
        slotpos = {Vector3(0, 15, 0)},
        animbank = "ui_alterguardianhat_1x1",
        animbuild = "ui_alterguardianhat_1x1",
        pos = Vector3(100, 0, 0),
        side_align_tip = 100
    },
    acceptsstacks = false,
    type = "chest"
}

params.sora_huapen = {
    widget = {
        slotpos = {Vector3(0, 15, 0)},
        animbank = "ui_alterguardianhat_1x1",
        animbuild = "ui_alterguardianhat_1x1",
        pos = Vector3(100, 0, 0),
        side_align_tip = 100
    },
    acceptsstacks = true,
    type = "chest"
}
function params.sora_huapen.itemtestfn(container, item, slot)
    return item and item.prefab ~= "sora_flh" and
               (item:HasTag("sorafood") or item.prefab == "butterfly" or item.prefab == "moonrocknugget" or item.prefab ==
                   "moonglass" or item.prefab == "petals" or item.prefab == "opalpreciousgem")
end

params.sora_lightflier_cat = {
    widget = {
        slotpos = {Vector3(-37.5, 50, 0), Vector3(37.5, 50, 0), Vector3(-37.5, -20, 0), Vector3(37.5, -20, 0),
                   Vector3(-37.5, -90, 0), Vector3(37.5, -90, 0)},
        animbank = "ui_bundle_2x2",
        animbuild = "ui_bundle_2x2",
        pos = Vector3(200, 0, 0),
        side_align_tip = 120

    },
    acceptsstacks = true,
    type = "chest"
}

if needhelp then
    print("????")
    local old_widgetsetup = containers.widgetsetup

    function containers.widgetsetup(container, prefab, data)
        local t = data or params[prefab or container.inst.prefab]
        if t ~= nil then
            for k, v in pairs(t) do
                container[k] = v
            end
            container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
        else
            return old_widgetsetup(container, prefab, data)
        end
    end

end
for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end

