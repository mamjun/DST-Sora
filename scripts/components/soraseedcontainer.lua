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
local seedinfo = {
}
local function AddSeed(name,data)
    table.insert(seedinfo,{name=name,data=data})
end
AddSeed("carrot_seeds")  --胡萝卜种子	
AddSeed("corn_seeds")  --玉米种子	
AddSeed("eggplant_seeds")  --茄子种子	
AddSeed("pumpkin_seeds")  --南瓜种子	
AddSeed()

AddSeed("potato_seeds")  --土豆种子	
AddSeed("tomato_seeds")  --番茄种子	
AddSeed("asparagus_seeds")  --芦笋种子	
AddSeed("gourd_seeds")  --葫芦种子	
AddSeed()


AddSeed("dragonfruit_seeds")  --火龙果种子	
AddSeed("watermelon_seeds")  --西瓜种子	
AddSeed("durian_seeds")  --榴莲种子	
AddSeed("pomegranate_seeds")  --石榴种子	
AddSeed()


AddSeed("garlic_seeds")  --蒜种子	
AddSeed("pepper_seeds")  --辣椒种子	
AddSeed("onion_seeds")  --洋葱种子	
AddSeed()
AddSeed("pineananas_seeds")  --松萝种子	

AddSeed("mandrake_seeds")  --曼德拉种子	
AddSeed("medal_weed_seeds")  --杂草种子	
AddSeed("medal_gift_fruit_seed")  --包果种子	
AddSeed("immortal_fruit_seed")  --不朽种子	
AddSeed("seeds")  --种子	

local DB = nil
local c = Class(function(self, inst)
    self.inst = inst
    if not DB then
        inst:DoTaskInTime(0,function ()
            DB = SoraAPI.SeedCSDB or SoraAPI.SeedCDB
        end)
    end
end)
function  c:AddSeed(name,num)
    local old = DB:Get("seeds",name,0)
    old = old + num
    DB:Set("seeds",name,old)
    return old
end
function  c:GetAllSeeds()
    for k,v in paris(seedinfo) do
        v.num = DB:Get("seeds",v.name,0) 
    end
    return seedinfo 
end
function  c:GetDebugString()
    local strs = {}
    table.insert(strs,"SeedSave:")
    for k,v in pairs(seedinfo) do
        if v.name then
         local str = (STRINGS.NAMES["KNOWN_"..v.name:upper()] or STRINGS.NAMES[v.name:upper()] or "未知") .."|"..tostring(v.name) .. ":".. DB:Get("seeds",v.name,0) 
         table.insert(strs,str)
        end
    end
    return table.concat(strs,"\n")
end
return c