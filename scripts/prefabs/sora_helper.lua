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
require "prefabutil"
local IsModEnable = SoraIsModEnable
local helper = {}
local function Help(name,bank,build,anim,...)
    table.insert(helper,MakePlacer(name.."_helper_placer",bank,build,anim,...))
end

Help("pond","marsh_tile","marsh_tile","idle")
Help("pond_cave","marsh_tile","marsh_tile","idle_cave")
Help("lava_pond","lava_tile","lava_tile","bubble_lava")


Help("beebox_hermit","bee_box_hermitcrab","bee_box_hermitcrab","idle")
Help("meatrack_hermit","meatrack_hermit","meatrack_hermit","idle_empty")
Help("seastack","water_rock01","water_rock_01","3_full")
Help("saltstack","salt_pillar2","salt_pillar2","full")
Help("catcoonden","catcoon_den","catcoon_den","idle")
Help("stagehand","stagehand","stagehand","idle_loop_01")


if IsModEnable("taizhen") or IsModEnable("太真") or IsModEnable("2066838067")  or IsModEnable("2199027653598516676") then
    local allskill = nil
    
    local function TaiZhenSkill()
        if not allskill then
            allskill = {}
            for k,v in pairs(QMSkTable) do
                for ik,iv in pairs(v) do
                    table.insert(allskill, "item_" .. iv.tex)
                end
            end
        end
        return SpawnPrefab(allskill[math.random(1,#allskill)])
    end
    STRINGS.NAMES.TZ_SKILLBOOKS = "太真技能机"
    STRINGS.RECIPE_DESC.TZ_SKILLBOOKS = "能抽到什么技能呢"
    table.insert(helper,Prefab("tz_skillbooks",TaiZhenSkill))
end
local function wormholefn()
    local a = SpawnPrefab("wormhole")
    a:DoTaskInTime(0,function()
        local b = SpawnPrefab("wormhole")
        local x,y,z = a:GetPosition():Get()
        b.Transform:SetPosition(x+1,y,z)
        if a.components.teleporter and b.components.teleporter then
            a.components.teleporter:Target(b)
            b.components.teleporter:Target(a)
        end
    end)
    return a
end
table.insert(helper,Prefab("wormhole_help",wormholefn))

Help("wormhole_help","teleporter_worm","teleporter_worm_build","idle_loop")
return unpack(helper)
