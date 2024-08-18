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
local ImageButton = require "widgets/imagebutton"
local Image = require "widgets/image"
local UIAnim = require "widgets/uianim"
local Widget = require "widgets/widget"
local function AddButton(config, name, pos, fn, postfn)
    local btn
    local data = {
        tokill = {}
    }
    local SoraOnOpenFn = config.SoraOnOpenFn
    config.SoraOnOpenFn = function(self, inst, doer, ...)
        if btn and btn.inst and btn.inst.widget then
            btn:Kill()
            btn = nil
        end
        btn = self:AddChild(ImageButton("images/ui.xml", "button_small.tex", "button_small_over.tex",
            "button_small_disabled.tex", nil, nil, {1, 1}, {0, 0}))
        btn.image:SetScale(1.07)
        btn.text:SetPosition(2, -2)
        btn:SetPosition(pos:Get())
        btn:SetText(name)

        btn:SetFont(BUTTONFONT)
        btn:SetDisabledFont(BUTTONFONT)
        btn:SetTextSize(33)
        btn.text:SetVAlign(ANCHOR_MIDDLE)
        btn.text:SetColour(0, 0, 0, 1)

        if fn then
            btn:SetOnClick(function()
                if doer ~= nil then
                    if doer:HasTag("busy") then
                        -- Ignore button click when doer is busy
                        return
                    elseif doer.components.playercontroller ~= nil then
                        local iscontrolsenabled, ishudblocking = doer.components.playercontroller:IsEnabled()
                        if not (iscontrolsenabled or ishudblocking) then
                            -- Ignore button click when controls are disabled
                            -- but not just because of the HUD blocking input
                            return
                        end
                    end
                end
                fn(inst, doer, btn, self, data)
            end)
        end
        if postfn then
            postfn(btn, inst, name, self, data, ...)
        end
        if SoraOnOpenFn then
            return SoraOnOpenFn(self, inst, doer, ...)
        end
    end
    local SoraOnCloseFn = config.SoraOnCloseFn
    config.SoraOnCloseFn = function(self, inst, doer, ...)
        if btn and btn.inst and btn.inst.widget then
            btn:Kill()
            btn = nil
        end
        for k, v in pairs(data.tokill) do
            if v and v.inst and v.inst.widget then
                v:Kill()
            end
        end
    end

end

local function MoveTo(self,targetname,targetname2,targetname3)
    local p = self.parent and self.parent.parent  and self.parent.parent.parent
    if not p then return end 
    if p[targetname] then 
        local tar = p[targetname]
        if tar[targetname2] then
            tar = tar[targetname2]
            if tar[targetname3] then
                tar = tar[targetname3]
            end
        end
        p:RemoveChild(self)
        tar:AddChild(self)
        self:MoveToBack()
    end
end
local function MoveToHandInv(self)
    MoveTo(self,"inv","hand_inv")
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
    type = "chest",
    usespecificslotsforitems = true,
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
function params.sora2chest.widget:SoraOnOpenFn(inst)
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
            drag_offset = 0.6,
            ValidPos = {
                minx = -700,
                miny = -320,
                maxx = 700,
                maxy = 320
            }
        })
    end
end

function params.sora2chest.itemtestfn(container, item, slot)
    if not item then
        return false
    end
    if slot then
        local slotitem = container:GetItemInSlot(slot)
        if slotitem then 
            if slotitem.prefab ~= item.prefab then 
                return false 
            end
            if slotitem.replica.stackable and not slotitem.replica.stackable:IsFull() then 
                return true
            end
            return false
        end
        if (slot > 25 and item:HasTag("gem")) or slot <= 25 then 
            return true
        end
    else
        return true
    end
    return false
end
function params.sora2chest.widget.buttoninfo.fn(inst)
    r_event(nil, "Sora2ChestControl", {
        cmd = "Collect"
    }, inst)
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
function params.sorabase.widget:SoraOnOpenFn(inst)
    self.text = self:AddChild(soratreepopup())
    self:SoraAutoClose(self.text)
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
            position = GLOBAL.Vector3(530, 50, 0)
        }
    },
    acceptsstacks = true,
    usespecificslotsforitems = true,
    type = "chest"
}
local sora_light_slot = 0
for z = 1, 5 do
    for y = 1, 5 do
        for x = 1, 3 do
            table.insert(params.sora_light.widget.slotpos, GLOBAL.Vector3(66 * x - 820 + 211 * y, z * -70 + 395, 0))
            table.insert(params.sora_light.widget.slotbg, {
                atlas = "images/hud.xml",
                image = "inv_slot.tex"
            })
            sora_light_slot = sora_light_slot + 1
        end
    end
end

for z = 1, 5 do
    for y = 1, 5 do
        for x = 1, 3 do
            table.insert(params.sora_light.widget.slotpos, GLOBAL.Vector3(66 * x - 820 + 211 * y, z * -70 + 30, 0))
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
    if not item then
        return false
    end
    if slot then
        local slotitem = container:GetItemInSlot(slot)
        if slotitem then 
            if slotitem.prefab ~= item.prefab then 
                return false 
            end
            if slotitem.replica.stackable and not slotitem.replica.stackable:IsFull() then 
                return true
            end
            return false
        end
        if (slot > sora_light_slot and slot < (sora_light_slot + 5) and item:HasTag("sora_light_batteries")) or (slot > (sora_light_slot + 4) and item:HasTag("gem") and not gemblack[item.prefab]) or slot <= sora_light_slot then 
            return true
        end
    else
        return true
    end
    return false
end
params.sora_light.widget.buttoninfo.fn = params.sora2chest.widget.buttoninfo.fn
function params.sora_light.widget:SoraOnOpenFn(inst)
    self.candrag = true
    if rawget(GLOBAL, "MakeMedalDragableUI") then
        MakeMedalDragableUI(self, self.bgimage, "sora_light", {
            drag_offset = 0.6
        })
    else
        SoraMakeWidgetMovable(self, "sora_light", Vector3(200, 000, 0), {
            drag_offset = 0.6,
            ValidPos = {
                minx = -460,
                miny = -240,
                maxx = 480,
                maxy = 240
            }
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
local function OnHuaPen(player, inst)
    if inst and type(inst) == "table" and inst.GUID and inst.components.container ~= nil then
        if not player then
            return
        end
        if not player.sora2chestcd then
            player.sora2chestcd = SoraCD(1)
        end
        if player.sora2chestcd() and inst.CollectFood then
            inst:CollectFood(player)
        end
    end
end
AddModRPCHandler("sora", "sora_huapen", OnHuaPen)

params.sora_huapen = {
    widget = {
        slotpos = {Vector3(0, 15, 0)},
        animbank = "ui_alterguardianhat_1x1",
        animbuild = "ui_alterguardianhat_1x1",
        pos = Vector3(100, 0, 0),
        side_align_tip = 100,
        buttoninfo = {
            text = "收集",
            position = GLOBAL.Vector3(0, -40, 0)
        }
    },
    acceptsstacks = true,
    type = "chest"
}
function params.sora_huapen.itemtestfn(container, item, slot)
    return item and item.prefab ~= "sora_flh" and
               (item:HasTag("sorafood") or item.prefab == "butterfly" or item.prefab == "moonrocknugget" or item.prefab ==
                   "moonglass" or item.prefab == "petals" or item.prefab == "opalpreciousgem")
end

function params.sora_huapen.widget.buttoninfo.fn(inst)
    if inst.components.container ~= nil and ThePlayer then
        OnHuaPen(ThePlayer, inst)
    elseif inst.replica.container ~= nil and not inst.replica.container:IsBusy() then
        SendModRPCToServer(MOD_RPC["sora"]["sora_huapen"], inst)
    end
end

function params.sora_huapen.widget.buttoninfo.validfn(inst)
    return inst.replica.container ~= nil and not inst.replica.container:IsEmpty()
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
sora2chestcontrol = require "widgets/sora2chestcontrol"
AddButton(params.sora2chest.widget, "控制", Vector3(120, -220, 0), function(inst, doer, ui, s, data)
    if ui.sora2chestcontrol and ui.sora2chestcontrol.inst and not ui.sora2chestcontrol.inst.widget then
        ui.sora2chestcontrol = nil
    end
    if not ui.sora2chestcontrol then
        ui.sora2chestcontrol = s:AddChild(sora2chestcontrol())
        ui.sora2chestcontrol:SetPosition(120, -400, 0)
        table.insert(data.tokill, ui.sora2chestcontrol)
        return
    end
    if ui.sora2chestcontrol.shown then
        ui.sora2chestcontrol:Hide()
    else
        ui.sora2chestcontrol:Show()
        ui.sora2chestcontrol:ShowTime()
    end
end)
AddButton(params.sora_light.widget, "控制", Vector3(530, 10, 0), function(inst, doer, ui, s, data)
    if ui.sora2chestcontrol and ui.sora2chestcontrol.inst and not ui.sora2chestcontrol.inst.widget then
        ui.sora2chestcontrol = nil
    end
    if not ui.sora2chestcontrol then
        ui.sora2chestcontrol = s:AddChild(sora2chestcontrol())
        ui.sora2chestcontrol:SetPosition(680, 10, 0)
        table.insert(data.tokill, ui.sora2chestcontrol)
        return
    end
    if ui.sora2chestcontrol.shown then
        ui.sora2chestcontrol:Hide()
    else
        ui.sora2chestcontrol:Show()
        ui.sora2chestcontrol:ShowTime()
    end
end)

params.sora_pickhat = {
    widget = {
        slotpos = {},
        bgatlas = "images/quagmire_recipebook.xml",
        bgimage = "quagmire_recipe_menu_bg.tex",
        pos = Vector3(100, 80, 0)

    },
    acceptsstacks = true,
    type = "sora_pickhat"
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.sora_pickhat.widget.slotpos, Vector3(70 * x - 70, 70 * y - 70, 0))
    end
end
function params.sora_pickhat.widget:SoraOnOpenFn(inst)
    self.bgimage:ScaleToSize(240, 240)
    MoveToHandInv(self)
end
params.sora_pickhat.itemtestfn = function()
    return not SoraAPI.IsTradeIteming
end

params.sora3chest = {
    widget = {
        slotpos = {},
        bgatlas = "images/quagmire_recipebook.xml",
        bgimage = "quagmire_recipe_menu_bg.tex",
        pos = Vector3(100, 80, 0),
        buttoninfo = {
            text = "收集",
            position = GLOBAL.Vector3(-50, -120, 0)
        }
    },
    acceptsstacks = true,
    type = "sora3chest"
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.sora3chest.widget.slotpos, Vector3(70 * x - 70, 70 * y - 50, 0))
    end
end
function params.sora3chest.widget:SoraOnOpenFn(inst)
    self.bgimage:ScaleToSize(240, 300)
    MoveToHandInv(self)
    SoraMakeWidgetMovable(self, "sora3chest", Vector3(-100, 80, 0), {
        drag_offset = 0.6,
        ValidPos = {
            minx = -1200,
            miny = 0,
            maxx = 520,
            maxy = 920
        }
    })
end
function params.sora3chest.widget.buttoninfo.fn(inst)
    r_event(nil, "Sora2ChestControl", {
        cmd = "Collect"
    }, inst)
end
AddButton(params.sora3chest.widget, "控制", Vector3(60, -120, 0), function(inst, doer, ui, s, data)
    if ui.sora2chestcontrol and ui.sora2chestcontrol.inst and not ui.sora2chestcontrol.inst.widget then
        ui.sora2chestcontrol = nil
    end
    if not ui.sora2chestcontrol then
        ui.sora2chestcontrol = s:AddChild(sora2chestcontrol())
        ui.sora2chestcontrol:SetPosition(200, -50, 0)
        table.insert(data.tokill, ui.sora2chestcontrol)
        return
    end
    if ui.sora2chestcontrol.shown then
        ui.sora2chestcontrol:Hide()
    else
        ui.sora2chestcontrol:Show()
        ui.sora2chestcontrol:ShowTime()
    end
end)

params.sora_pot = {
    widget = {
        slotpos = {Vector3(-360, 160, 0), Vector3(-290, 160, 0), Vector3(-360, 90, 0), Vector3(-290, 90, 0),
                   Vector3(-360, 20, 0), Vector3(-290, 20, 0), Vector3(-360, -140, 0), Vector3(-290, -140, 0),

                   Vector3(-180, 160, 0), Vector3(-180, 20, 0), Vector3(-60, 160, 0), Vector3(-60, 20, 0),

                   Vector3(-180, -140, 0), Vector3(-60, -140, 0)},
        slotbg = {{
            atlas = "images/ui/sora_pot_ui.xml",
            image = "tomato.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "tomato.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "tomato.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "tomato.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "portablecookpot_item.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "spice_salt.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "meatballs.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "salt.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "meat.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "meat_dried.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "potato.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "potato_cooked.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "ice.tex"
        }, {
            atlas = "images/ui/sora_pot_ui.xml",
            image = "charcoal.tex"
        }},

        bgatlas = "images/quagmire_recipebook.xml",
        bgimage = "quagmire_recipe_menu_bg.tex",
        pos = Vector3(10, 500, 0)

    },
    acceptsstacks = true,
    usespecificslotsforitems=true,
    type = "sora_pot",
    openlimit = 1,
}
for y = 4, 0, -1 do
    for x = 0, 4 do
        table.insert(params.sora_pot.widget.slotpos, Vector3(75 * x + 60, 75 * y - 140, 0))
    end
end
local cooking = require("cooking")

function params.sora_pot.widget:SoraOnOpenFn(inst)

    self.bgimage:ScaleToSize(900, 500)

    self.cookanim = {}
    for k, v in pairs({1, 2, 3, 4, 5, 6, 9, 11, 13}) do
        local anim = self:AddChild(UIAnim())
        anim:GetAnimState():SetBank("sora_pot_ui")
        anim:GetAnimState():SetBuild("sora_pot_ui")
        anim:GetAnimState():PlayAnimation("idle", true)
        anim:SetPosition(params.sora_pot.widget.slotpos[v]:Get())
        self:SoraAutoClose(anim)
        anim:Hide()
        anim:SetClickable(false)
        self.cookanim[v] = anim
    end
    -- self.firebgimage = self:AddChild(Image("images/hud.xml","craft_slot_place.tex"))
    -- self.firebgimage:SetPosition(-210,-215,0)
    -- self.firebgimage:ScaleToSize(380, 20)
    local anim = self:AddChild(UIAnim())
    anim:GetAnimState():SetBank("sora_pot_ui_rope")
    anim:GetAnimState():SetBuild("sora_pot_ui_rope")
    anim:GetAnimState():PlayAnimation("idle")
    anim:GetAnimState():Pause()
    anim:SetScale(0.75, 0.75)
    anim:SetPosition(-385, -215, 0)
    anim:SetClickable(false)
    self:SoraAutoClose(anim)
    self.cookrope = anim

    local anim = self:AddChild(UIAnim())
    anim:GetAnimState():SetBank("sora_pot_ui_fire")
    anim:GetAnimState():SetBuild("sora_pot_ui_fire")
    anim:GetAnimState():PlayAnimation("idle", true)
    anim:SetScale(0.75, 0.75)
    anim:SetPosition(-385, -215, 0)
    anim:SetClickable(false)
    self:SoraAutoClose(anim)
    self.cookfire = anim
    self.CookRopeTask = function()
        if self.isopen and self.container and self.container.sorapotper then
            self:SetCookRope(self.container.sorapotper:value() / 100)
            for k, v in pairs({1, 2, 3, 4, 5, 6, 9, 11, 13}) do
                if self.container.sorapotui[v] and self.cookanim[v] then
                    if self.container.sorapotui[v]:value() and not self.cookanim[v].shown then
                        self.cookanim[v]:Show()
                    elseif not self.container.sorapotui[v]:value() and self.cookanim[v].shown then
                        self.cookanim[v]:Hide()
                    end
                end
            end
        end
    end
    self.SetCookRopeTask = self.inst:DoPeriodicTask(0.1, self.CookRopeTask)

    self.SetCookRope = function(s, per)
        self.cookrope:GetAnimState():SetPercent('idle', 1 - per)
        self.cookfire:SetPosition(-385 - 360 * (1 - per), -215, 0)
    end
    self:CookRopeTask()

    SoraMakeWidgetMovable(self, "sora_pot", Vector3(10, 500, 0), {
        drag_offset = 0.6,
        ValidPos = {
            minx = -570,
            miny = -320,
            maxx = 560,
            maxy = 320
        }
    })
    local img = self:AddChild(Image("images/hud.xml", "inventory_bg_arrow.tex"))
    img:SetPosition(-65, 115, 0)
    img:SetRotation(-90)
    img:MoveToBack()
    self:SoraAutoClose(img)
    local img = self:AddChild(Image("images/hud.xml", "inventory_bg_arrow.tex"))
    img:SetPosition(-185, 115, 0)
    img:SetRotation(-90)
    img:MoveToBack()
    self:SoraAutoClose(img)
    local img = self:AddChild(Image("images/hud.xml", "inventory_bg_arrow.tex"))
    img:SetPosition(-295, -45, 0)
    img:SetRotation(-90)
    img:MoveToBack()
    self:SoraAutoClose(img)
    local img = self:AddChild(Image("images/hud.xml", "inventory_bg_arrow.tex"))
    img:SetPosition(-365, -45, 0)
    img:SetRotation(-90)
    img:MoveToBack()
    self:SoraAutoClose(img)
    self.bgimage:MoveToBack()
end

function params.sora_pot.itemtestfn(container, item, slot)
    if not item then
        return false
    end
    if slot then
        local slotitem = container:GetItemInSlot(slot)
        if slotitem then 
            if slotitem.prefab ~= item.prefab then 
                return false 
            end
            if slotitem.replica.stackable and not slotitem.replica.stackable:IsFull() then 
                return true
            end
            return false
        end
        if slot > 0 and slot < 6 then
            if item:HasTag("preparedfood") or cooking.IsCookingIngredient(item.prefab) then
                return true
            end
        elseif slot == 6 then
            if item:HasTag("preparedfood") or cooking.IsCookingIngredient(item.prefab) or item:HasTag("spice") then
                return true
            end
        elseif slot == 7 then
            if item:HasTag("preparedfood") and not item:HasTag("spicedfood") then
                return true
            end
        elseif slot == 8 then
            if item:HasTag("preparedfood") and item:HasTag("spicedfood") then
                return true
            end
        elseif slot == 9 then
            if item:HasTag("dryable") then
                return true
            end
        elseif slot == 11 then
            if item:HasTag("cookable") then
                return true
            end
        elseif slot == 13 then
            return item.prefab == "ice"
        elseif slot == 14 then
            return item.prefab == "charcoal"
        else
            if item:HasTag("preparedfood") or cooking.IsCookingIngredient(item.prefab) or item:HasTag("spice") then
                return true
            end
            if item:HasTag("dryable") then
                return true
            end
            if item:HasTag("cookable") then
                return true
            end
            if item.prefab == "ice" or item.prefab == "charcoal" then
                return true
            end
            if not (item:HasTag("fresh") or item:HasTag("stale") or item:HasTag("spoiled")) then
                return false
            end
            if item:HasTag("smallcreature") then
                return false
            end
            -- Edible
            for k, v in pairs(FOODTYPE) do
                if item:HasTag("edible_" .. v) then
                    return true
                end
            end
        end
        return false
    else
        if item:HasTag("preparedfood") or cooking.IsCookingIngredient(item.prefab) or item:HasTag("spice") then
            return true
        end
        if item.prefab == "ice" or item.prefab == "charcoal" then
            return true
        end
        if not (item:HasTag("fresh") or item:HasTag("stale") or item:HasTag("spoiled")) then
            return false
        end
        if item:HasTag("smallcreature") then
            return false
        end
        -- Edible
        for k, v in pairs(FOODTYPE) do
            if item:HasTag("edible_" .. v) then
                return true
            end
        end
        return false
    end
end


params.sora_tqy_box = {
    widget = {
        slotpos = {},
        bgatlas = "images/quagmire_recipebook.xml",
        bgimage = "quagmire_recipe_menu_bg.tex",
        pos = Vector3(0, 130, 0)

    },
    acceptsstacks = false,
    type = "sora_tqy_box"
}
for y = 5, 1, -1 do
    for x = 0, 0 do
        table.insert(params.sora_tqy_box.widget.slotpos, Vector3(70 * x -0, 70 * y - 210, 0))
    end
end

function params.sora_tqy_box.widget:SoraOnOpenFn(inst)
    self.bgimage:ScaleToSize(90, 380)
    MoveToHandInv(self)
end
params.sora_tqy_box.itemtestfn = function(container, item, slot)
    return item and item:HasTag("sora_tqy")
end

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

