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
--[[扩展三维模块
用于兼容其他变更三维的mod
--假设其他mod都是  a = a +1 这种模式
]] --
local function CreateFix(inst,cmpname,tofix,base,extfn)
    --需要处理的组件名称 需要处理的组件属性  扩展函数
    local Fix = {
        inst = inst,
        cmpname = cmpname,
        tofix = tofix,
        base = base,
        extfn = extfn,
        }
    inst.components[cmpname][tofix] = base
   
    Fix.Set = function(self,num)
        local cur = inst.components[cmpname][tofix]
        if inst.components[cmpname]['base_'..cmpname] then
            cur = inst.components[cmpname]['base_'..cmpname]
        end
        
        if self.extfn then      --用于还原一些mod百分比的 或者 对方处理良好的 例如 元素反应 mod
            for k,v in pairs(self.extfn) do
                cur = v(inst,inst.components[cmpname],cur)
            end
        end
        local ext = cur - self.base -- 原有额外属性
        local new = num + ext
        self.base = num
        if cmpname == "health" then
            inst.components[cmpname]:SetMaxHealth(math.max(1,new))
        else
            inst.components[cmpname][tofix] = math.max(1,new)
        end
               --赋值
        if inst.components.levelsystem then
            if inst.components.levelsystem[cmpname.."max"]  then
                inst.components.levelsystem[cmpname.."max"] = new
            end
        end
    end
    return Fix
end
local extheafn = {      --额外的对其他mod的支持
    -- forys = function(inst,cmp,cur)      --还原元素反应的加成
        -- return cur
    -- end,
}

local function FixPlayer(inst,basehun,basesan,basehea)
    inst.SoraExtend = {
    hun = CreateFix(inst,"hunger","max",basehun),
    san = CreateFix(inst,"sanity","max",basesan),
    hea = CreateFix(inst,"health","maxhealth",basehea,extheafn),
    }
    inst.SoraSetExtend = function(inst,exthun,extsan,exthea)
        --算出自己的属性值
        inst.SoraExtend.hun:Set(exthun)
        inst.SoraExtend.san:Set(extsan)
        inst.SoraExtend.hea:Set(exthea)
    end
end
if not getsora("healthfix") == 0 then
    function FixPlayer()
    end
end
return FixPlayer