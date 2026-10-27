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
如确实需要加密以保护其他文件,请额外放置一份 后缀为.lua.src 或者.txt的源代码。
]] if modname == "sora-dev" then
    GLOABLcount = {}
    GLOBAL.setmetatable(env, {
        __index = function(t, k)
            GLOABLcount[k] = (GLOABLcount[k] or 0) + 1
            if GLOABLcount[k] > 99 and GLOABLcount[k] % 100 == 0 then
                print( modname ,
                    "访问全局变量过多，可能存在死循环或者频繁访问全局变量的情况，访问的变量名为" ..
                        k)
            end
            return GLOBAL.rawget(GLOBAL, k)
        end
    })
    GetGLOBAL = function(k)
        local toprint = {}
        for k, v in pairs(GLOABLcount) do
            table.insert(toprint, {k, v})
        end
        table.sort(toprint, function(a, b)
            return a[2] > b[2]
        end)
        print("全局变量访问统计：")
        for _, v in ipairs(toprint) do
            if v[2] > 3 then
                print(v[1] .. "=" .. v[2])
            end
        end
    end
else
    GLOBAL.setmetatable(env, {
        __index = function(t, k)
            return GLOBAL.rawget(GLOBAL, k)
        end
    })
end

modimport("main/init")
-- prefab文件列表
PrefabFiles = {}
function AddPreFile(str)
    table.insert(PrefabFiles, str)
end

AddPreFile("sora")
AddPreFile("sora_assets")
AddPreFile("sora_helper")


AddPreFile("build/sora2base")
AddPreFile("build/sora2birdchest")
AddPreFile("build/sora2build")
AddPreFile("build/sora2chest")
AddPreFile("build/sora2fire")
AddPreFile("build/sora2ice")
AddPreFile("build/sora2tree")
AddPreFile("build/sora2vchest")
AddPreFile("build/sora3chest")
AddPreFile("build/sora_build")
AddPreFile("build/sora_gemsign")
AddPreFile("build/sora_huapen")
AddPreFile("build/sora_light")
AddPreFile("build/sora_plant")
AddPreFile("build/sora_shouban")
AddPreFile("build/sora_smalllight")


AddPreFile("equip/sora2amulet")
AddPreFile("equip/sora2bag")
AddPreFile("equip/sora2hat")
AddPreFile("equip/sora2list")
AddPreFile("equip/sora2plant")
AddPreFile("equip/sora2prop")
AddPreFile("equip/sora3sword")
AddPreFile("equip/sorabag")
AddPreFile("equip/sorabowknot")
AddPreFile("equip/soraclothes")
AddPreFile("equip/sorahat")
AddPreFile("equip/sorahealing")
AddPreFile("equip/soramagic")
AddPreFile("equip/sorapick")
AddPreFile("equip/soratele")
AddPreFile("equip/sora_dieyu")
AddPreFile("equip/sora_lantern")
AddPreFile("equip/sora_lyj")
AddPreFile("equip/sora_pickhat")
AddPreFile("equip/sora_qiyu")
AddPreFile("equip/sora_tqy")
AddPreFile("equip/sora_wq")
AddPreFile("equip/sora_yingyu")


AddPreFile("item/sora2buffer")
AddPreFile("item/sora2pokeball")
AddPreFile("item/sora2sword")
AddPreFile("item/sorabooks")
AddPreFile("item/sorafoods")
AddPreFile("item/sorapocky")
AddPreFile("item/sorarepairer")
AddPreFile("item/sora_fl")
AddPreFile("item/sora_flh")
AddPreFile("item/sora_lock")
AddPreFile("item/sora_nizao")
AddPreFile("item/sora_pot")
AddPreFile("item/sora_ring")


AddPreFile("fx/sorahealingstar")
AddPreFile("fx/sorameteor")
AddPreFile("fx/soraprojectile")
AddPreFile("fx/sora_fx_feather")
AddPreFile("fx/sora_item_fx")
AddPreFile("fx/sora_foot_star")
