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
local c = {}
--等级
c.level = {0,500,3000,10000,30000,70000,200000,500000}
--珍惜度
c.itemname = {"普通","常用","稀有","珍惜"}
c.sales = {
    thurible=10000,		--暗影香炉
    armorskeleton=10000,		--白骨盔甲
	skeletonhat=10000,		--骨头盔
    lavae_egg=7500,		--岩浆蛋
	lavae_cocoon=7500,		--冷冻虫卵
    dragon_scales=1000,		--蜻蜓龙鳞片
    lavae_egg_cracked=7500,		--岩浆蛋（孵化中的）
    shroom_skin=1000,		--魔蛤皮
    bearger_fur=1000,		--厚重的皮毛
    deerclops_eyeball=7500,		--鹿角怪眼球
    goose_feather=500,		--羽绒
	royal_jelly=500,		--蜂王浆
	hivehat = 8000,         --蜂王帽
    steelwool = 1000,       --钢丝棉
    phlegm = 1000,          --浓鼻涕
    malbatross_feather = 500,   --邪天翁羽毛
    malbatross_beak = 8000,     --邪天翁嘴
    spiderhat = 1000,
    
	glommerwings=5000,		--咕噜咪翅膀
	glommerflower=5000,		--咕噜咪之花
	glommerfuel=100,		--咕噜咪的粘液


	walrus_tusk=1000,		--海象牙
    cane=800,		--步行手杖
    gnarwail_horn = 1000,   --独角鲸的角
    lightinggoathorn = 1000,    --电羊角
    horn = 1000,            --牛角
    
    armor_sanity = 500,     --影甲
    nightsword = 500,       --影刀
	klaussackkey=5000,		--牡鹿角（克劳斯钥匙）
	
	
	shadowheart=1000,		--暗影之心
	minotaurhorn=10000,		--守护者之角
	
	batbat=500,		--蝙蝠棒
	walrushat=500,		--贝苏格兰帽
	
	
	butter=100,		--黄油
	
	goatmilk=500,		--活力牛奶
	mandrake=200,		--曼德拉草
	cookedmandrake=200,		--烤曼德拉草
	mandrakesoup=500,		--曼德拉草汤
    spidereggsack = 500,    --蜘蛛卵
    eyebrellahat = 10000,   --眼球伞
    beargervest = 10000,    --熊皮大衣
    moonglass = 100,        --月亮碎片
    moonglass_charged = 300,    --充能月亮碎片
    orangestaff = 1500,     --橙杖
    yellowstaff = 1500,     --星杖
    greenstaff = 1500,      --绿杖
    opalstaff = 5000,      --月杖 
    staff_tornado = 2500,  --天气风向标
    alterguardianhat = 15000,   --启迪
    moonstorm_static_item = 15000,  --约束静电
}
c.tagsales = {
    halloweencandy=10,
    winter_ornament=100,
}
c.namesales = {
    deer_antler = 100,
    trinket = 500,
    turf_ = 200,
    halloweencandy_ = 10,
    nmooneye = 300,
    gem = 300,
    staff = 500,
    amulet=300,
    rock_avocado_fruit_sprout=1000,
    dug_=500,
}

c.toprefabfn  = function(item)
    if c.sales[item.prefab] then
        return  item.prefab,c.sales[item.prefab] * ( item.components.stackable and  item.components.stackable.stacksize or 1)
    end
    
    for k,v in pairs(c.tagsales) do
        if item:HasTag(k) then
            return k,v * ( item.components.stackable and  item.components.stackable.stacksize or 1)
        end
    end
    for k,v in pairs(c.namesales) do
        if item.prefab:match(k) then
            return item.prefab,v * ( item.components.stackable and  item.components.stackable.stacksize or 1)
        end
    end
    
    local p = 1
    if item.components.equippable then
       p = p + 10
    end
    if item.components.tool then
       p = p + 10
    end
    if item.components.armor then
       p = p + 10
    end
    if item.components.weapon then
       p = p + 10
    end
    if item.components.edible then
        p = p + 5
        if item:HasTag("preparedfood") then
            p = p +10
        end
        if item:HasTag("spicedfood") then
            p = p +10
        end
        if item.components.edible.healthvalue > 50 then  p = p +50
        end
        if item.components.edible.hungervalue > 50 then p = p +50
        end
        if item.components.edible.sanityvalue > 50 then p = p +50
        end
    end
    if item.components.health then
        p = p +20
    end
    p = p * ( item.components.stackable and  item.components.stackable.stacksize or 5)
    return item.prefab,p
end
c.gift = {}
local function AddGift(gifts,weight,level,exp,testfn,givefn)
    local giftconfig = {
    gifts=gifts or {},--礼物
    weight = weight or 1,--几率
    level=level or 1,   --需要的等级
    exp=exp or 100,    --需要的经验
    testfn = testfn or nil, --给于之前测试的fn
    givefn = givefn or nil, --给于之后执行的fn inst,doer,gift,config
    }
    table.insert(c.gift,giftconfig)
end

local function AddSora(gifts,weight,level,exp,testfn,givefn)
    AddGift(gifts,weight,level,exp,function(s,doer,data) return doer and doer:HasTag("sora") and testfn(s,doer,data) end,givefn)

end
--干草*10
--一夜暴富的希望
local function ozxz(isnt,doer,gift,config)
    TheNet:Announce("发现欧洲细作: "..doer.name .."  各大单位请务必歼灭！")
end
AddGift({sora2sword=1,sora2prop=1,sora3sword=1,sora2hat=1,sora2armor=1,sora2bag=1,sora2amulet=1},0.05,1,10,nil,ozxz)
AddGift({sora2sword=1,sora2prop=1,sora3sword=1,sora2hat=1,sora2armor=1,sora2bag=1,sora2amulet=1},0.05,2,10,nil,ozxz)
AddGift({sora2sword=1,sora2prop=1,sora3sword=1,sora2hat=1,sora2armor=1,sora2bag=1,sora2amulet=1},0.05,3,10,nil,ozxz)
AddGift({sora2sword=1,sora2prop=1,sora3sword=1,sora2hat=1,sora2armor=1,sora2bag=1,sora2amulet=1},0.05,4,10,nil,ozxz)
AddGift({sora2sword=1,sora2prop=1,sora3sword=1,sora2hat=1,sora2armor=1,sora2bag=1,sora2amulet=1},0.05,5,10,nil,ozxz)
AddGift({sora2sword=1,sora2prop=1,sora3sword=1,sora2hat=1,sora2armor=1,sora2bag=1,sora2amulet=1},0.05,6,10,nil,ozxz)
AddGift({sora2sword=1,sora2prop=1,sora3sword=1,sora2hat=1,sora2armor=1,sora2bag=1,sora2amulet=1},0.05,7,10,nil,ozxz)
AddGift({sora2sword=1,sora2prop=1,sora3sword=1,sora2hat=1,sora2armor=1,sora2bag=1,sora2amulet=1},0.05,8,10,nil,ozxz)

--level1  少许基础资源
AddGift({cutgrass=100},5,1,0)
AddGift({twigs=100},5,1,0)
AddGift({log=100},5,1,0)
AddGift({rocks=100},5,1,0)
AddGift({flint=100},5,1,0)
AddGift({nitre=100},5,1,0)
AddGift({goldnugget=40},5,1,0)
AddGift({charcoal=100},3,1,0)
AddGift({ice=100},3,1,0)

AddGift({dug_grass=3},1,1,0)
AddGift({dug_sapling=3},1,1,0)
AddGift({dug_berrybush=3},1,1,0)
AddGift({dug_berrybush2=3},1,1,0)
AddGift({dug_berrybush_juicy=3},1,1,0)
--level2 少许食物
AddGift({meatballs=2},5,2,200)
AddGift({honeyham=2},5,2,200)
AddGift({honeynuggets=2},5,2,200)
AddGift({turkeydinner=2},5,2,200)
AddGift({baconeggs=2},5,2,200)
AddGift({frogglebunwich=2},5,2,200)
AddGift({fishsticks=2},5,2,200)
AddGift({perogies=2},5,2,200)
AddGift({flowersalad=2},5,2,200)

AddGift({icecream=2},2.5,2,300)
AddGift({bonestew=2},2.5,2,300)
AddGift({waffles=2},2.5,2,300)
AddGift({dragonpie=2},2.5,2,300)

AddGift({mandrakesoup=1},1,2,500)
AddGift({jellybean=6},1,2,500)
--level3 常用装备

AddGift({armorwood=1},5,3,500)
AddGift({footballhat=1},5,3,500)

AddGift({slurtlehat=1},3,3,800)
AddGift({wathgrithrhat=1},3,3,800)


AddGift({cane=1},1,3,1200)
AddGift({minerhat=1},2,3,1200)
AddGift({raincoat=1},2,3,1200)
AddGift({hawaiianshirt=1},2,3,1200)
AddGift({trunkvest_winter=1},2,3,1200)
AddGift({hawaiianshirt=1},2,3,1200)
AddGift({beefalohat=1},2,3,1200)


AddGift({armorruins=1},0.5,3,1500)
AddGift({armor_sanity=1},0.5,3,1500)
AddGift({walrushat=1},1,3,1500)

--level4 进阶资源
AddGift({marble=1},5,4,2000)
AddGift({moonrocknugget=5},5,4,2000)
AddGift({thulecite=5},2,4,2000)
AddGift({livinglog=5},5,4,2000)
AddGift({nightmarefuel=5},5,4,2000)
AddGift({boards=10},5,4,2000)
AddGift({cutstone=10},5,4,2000)
AddGift({pigskin=10},5,4,2000)
AddGift({papyrus=10},5,4,2000)
AddGift({feather_crow=10},5,4,2000)
AddGift({feather_robin=10},5,4,2000)
AddGift({feather_robin_winter=10},5,4,2000)
AddGift({feather_canary=3},5,4,2000)
AddGift({shadowheart=1},1,4,2000)

AddGift({gears=2},3,4,1000)
AddGift({redgem=1},2,4,300)
AddGift({bluegem=1},2,4,300)
AddGift({yellowgem=1},2,4,1000)
AddGift({greenem=1},2,4,1000)
AddGift({purplegem=1},2,4,1000)
AddGift({orangegem=1},2,4,1000)


--level5 进阶装备

AddGift({nightsword=1},2,5,300)
AddGift({armorruins=1},2,5,300)
AddGift({armor_sanity=1},2,5,300)

AddGift({sora2lm=10},2,5,500)
AddGift({sora2lh=10},2,5,500)
AddGift({sora2ry=10},2,5,500)
AddGift({sora2yy=10},2,5,500)
AddGift({sora2xs=10},2,5,500)
AddGift({sora2gz=10},2,5,500)
AddGift({sora2cs=10},2,5,500)
AddGift({sora2qb=10},2,5,500)

AddGift({icestaff=1},1,5,100)
AddGift({firestaff=1},1,5,100)
AddGift({telestaff=1},1,5,200)
AddGift({orangestaff=1},1,5,500)
AddGift({yellowstaff=1},1,5,500)
AddGift({greenstaff=1},1,5,500)
AddGift({opalstaff=1},1,5,500)

AddGift({amulet=1},1,5,1000)
AddGift({blueamulet=1},1,5,2000)
AddGift({purpleamulet=1},1,5,2000)
AddGift({yellowamulet=1},1,5,2000)
AddGift({orangeamulet=1},1,5,2000)
AddGift({greenamulet=1},1,5,2000)

AddGift({eyebrellahat=1},0.5,5,8000)
AddGift({beargervest=1},0.5,5,8000)
--level6 大包资源
AddGift({pigskin=40,cutstone=40,boards=40},1,6,15000)
AddGift({manrabbit_tail=40,carrot=100,boards=40},1,6,15000)
AddGift({cutstone=50,boards=50},1,6,15000)
AddGift({redgem=1,bluegem=1,orangegem=1,purplegem=1,greengem=1,yellowgem=1},1,6,15000)
AddGift({feather_crow=40,feather_robin=40,feather_robin_winter=40,feather_canary=10},1,6,15000)
AddGift({goldnugget=100,cutstone=50},1,6,15000)
AddGift({sora2stone=40},1,6,15000)
AddGift({moonrocknugget=40},1,6,10000)
--level7 BOSS材料
AddGift({goose_feather=10},1,7,20000)
AddGift({dragon_scales=5},1,7,20000)
AddGift({bearger_fur=2},1,7,20000)
AddGift({deerclops_eyeball=2},1,7,20000)
AddGift({minotaurhorn=2},1,7,20000)
AddGift({shroom_skin=5},1,7,20000)
AddGift({shadowheart=5},1,7,20000)
--level8 珍惜装备
 AddGift({redgem=3,bluegem=3,orangegem=3,purplegem=3,greengem=3,yellowgem=3},1,8,80000)
 AddGift({sora2sword=1},1,8,10000)
 AddGift({sora2prop=1},1,8,10000)
 AddGift({sora3sword=1},1,8,30000)
 AddGift({sora2hat=1},1,8,30000)
 AddGift({sora2armor=1},1,8,30000)
 AddGift({sora2bag=1},1,8,30000)
 AddGift({sora2amulet=1},1,8,30000)

  
--level8 大量珍惜物品
 AddGift({redgem=10,bluegem=10,orangegem=10,purplegem=10,greengem=10,yellowgem=10},1,8,150000,nil,ozxz)
 AddGift({sora2sword=1,sora2prop=1,sora3sword=1,sora2hat=1,sora2armor=1,sora2bag=1,sora2amulet=1},1,8,150000,nil,ozxz)
 AddGift({sora2lm=20,sora2lh=20,sora2qb=20,sora2cs=20,sora2ry=20,sora2yy=20,sora2gz=20,sora2xs=20},1,8,5000)
return c