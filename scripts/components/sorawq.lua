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
]]
local allwqs = SoraAPI.LeakTable()
local c = Class(function(self, inst)
    self.inst = inst
    self.level = 1
    self.str = nil
    allwqs[inst] = 1
    inst:AddTag("sorawqlevelup")
    --你都看到这儿了  自选风铃草里 禁止加入自选雾切
    inst:ListenForEvent("onremove",function (i)
        allwqs[i] = nil
    end)
    inst:DoTaskInTime(0,function(i)
        if not i.components.sorawq.str then
            i:Remove()
        end
        for k,v in pairs(allwqs) do
            if k and k ~= i and k.components.sorawq and i.components.sorawq.str == k.components.sorawq.str then
                i:Remove()
                return 
            end
        end
    end)
    self:LevelChange(1)
end)
function c:LevelChange(level)
    self.level = math.clamp(level,1,5)
    if self.level > 4 then
        self.inst:RemoveTag("sorawqlevelup")
    end
    self.inst:PushEvent("sorawqlevelchange",{level=self.level})
end

function c:Refine(level)
    self:LevelChange(self.level + level)
end

function c:LevelUp(doer,target)
    if not doer or not target then
        return false,"ERRLEVEL"
    end
    if not target.components.sorawq then
        return false,"ERRWQ"
    end
    if self.level >4 then
        return false,"MAXLEVEL"
    end
    if target.components.sorawq.level >4 then
        return false,"TARGETMAXLEVEL"
    end
    if target.components.sorawq.str == self.str then
        target:Remove()
        return false,"SAME"
    end
    local newlevel =math.min(5, (self.level + target.components.sorawq.level))
    target:Remove()
    self:LevelChange(newlevel)
    local owner = self.inst.components.inventoryitem:GetGrandOwner()
    if owner  and owner.components.talker then
        owner.components.talker:Say("雾切之回光 精炼等级:"..self.inst.components.sorawq.level)
    end
    return true
end
function c:OnSave() 
	return  {level = self.level,str = self.str }
end

function c:OnLoad(data)       
    self:LevelChange(data.level or 1 )
    self.str = data.str 
end
function c:GetDebugString()
    return "level:"..self.level  .. "  str:" .. tostring(self.str)
end
return c