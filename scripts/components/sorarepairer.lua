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
local sorarepairer = Class(function(self, inst)
    self.inst = inst
    self.repair_value = 1
end)
local cantrepair = {
    greenstaff = 1 ,
    greenamulet=1,
}
function sorarepairer:DoRepair(inst,target, doer)
    if not inst or not target or not doer or cantrepair[target.prefab] then
        return -1
    end
    local size =inst and inst.components.stackable and inst.components.stackable.stacksize  or 1 
    local num = 0 
    if target.components.finiteuses and target.components.finiteuses:GetPercent() < 1 then
        local uses = target.components.finiteuses.total - target.components.finiteuses.current
        local per = math.max(math.ceil(target.components.finiteuses.total*0.2),5)
        num =  math.max(math.floor(uses / per ),1)
        if size < num then return -2 end
        target.components.finiteuses:Use(-1 * per * num)
        if  target.components.finiteuses:GetPercent() > 1 then
            target.components.finiteuses:SetPercent(1)
        end
        doer:PushEvent("sorarepair",{inst=inst,target=target,doer=doer,type="finiteuses"})
        return num
    elseif target.components.fueled and target.components.fueled:GetPercent() < 1 then
        num = target.components.fueled:GetPercent() < 0.5 and 2 or 1 
        if size < num then return -2 end
        target.components.fueled:SetPercent(1)
        doer:PushEvent("sorarepair",{inst=inst,target=target,doer=doer,type="fueled"})
        return 1
    elseif target.components.perishable and target.components.perishable:GetPercent() < 1 then
        num = target.components.perishable:GetPercent() < 0.5 and 2 or 1 
        if size < num then return -2 end
        target.components.perishable:SetPercent(1)
        doer:PushEvent("sorarepair",{inst=inst,target=target,doer=doer,type="perishable"})
        return 1
    elseif target.components.armor and target.components.armor:GetPercent() < 1 then
        num = target.components.armor:GetPercent() < 0.5 and 2 or 1
        if size < num then return -2 end
        target.components.armor:SetPercent(1)
        doer:PushEvent("sorarepair",{inst=inst,target=target,doer=doer,type="armor"})
        return num
    -- elseif arget.components.finiteuses and target.components.finiteuses:GetPercent() < 1 then
        -- target.components.finiteuses:Use(math.max(math.ceil(0.2*target.components.finiteuses.total),2))
        -- return true
    end
    return -1
end

return sorarepairer