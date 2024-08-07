--[[
授权级别:开放级
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
local Tags = {}
local Tags_hash = {}
local key = modname .. "fixtag" -- 默认用modname 做key 防止冲突
if not TUNING.MoreTagsReg then 
    TUNING.MoreTagsReg = {}
end
function RegTag(tag) -- 必须先注册 主客机一起注册 注册后的tag会被截留
    tag = string.lower(tag)
    if not TUNING.MoreTagsReg[tag] then 
        TUNING.MoreTagsReg[tag] = key
        Tags[tag] = tag
        Tags_hash[hash(tag)] = tag
    end
end
function PrintTags(inst)
    if inst and inst[key] then 
        print("MoreTags")
        for k,v in pairs(inst[key].Tags) do 
            print(k,v:value())
        end
        print("NOMoreTags")
        for k,v in pairs(inst[key].TagsD) do 
            print(k,v)
        end
    end
end
local function AddTag(inst, stag, ...)
    if not inst or not stag then return end
    local tag = type(stag) == "number" and Tags_hash[stag] or stag
    tag = string.lower(tag)
    if Tags[tag] then
        if inst[key].Tags and inst[key].Tags[tag] then
            inst[key].Tags[tag]:set_local(false)
            inst[key].Tags[tag]:set(true)
        end
    else
        if TAGSDEBUG then 
            RemoveByValue(inst[key].TagsD,stag)
            table.insert(inst[key].TagsD,stag)
            if #inst[key].TagsD > 63 then 
                print("ERRTAG",inst,fastdump(inst[key].TagsD))
                print("ERRTAG","toadd",stag)
                print(DoStackTrace("ERRTAG", 5))
            end
        end
        return inst[key].AddTag(inst, stag, ...)
    end
end

local function RemoveTag(inst, stag, ...)
    if not inst or not stag then return end
    local tag = type(stag) == "number" and Tags_hash[stag] or stag
    tag = string.lower(tag)
    if Tags[tag] then
        if inst[key].Tags and inst[key].Tags[tag] then
            inst[key].Tags[tag]:set_local(true)
            inst[key].Tags[tag]:set(false)
        end
    else
        if TAGSDEBUG then 
            RemoveByValue(inst[key].TagsD,stag)
        end
        return inst[key].RemoveTag(inst, stag, ...)
    end
end

local function HasTag(inst, stag, ...)
    if not inst or not stag then return end
    local tag = type(stag) == "number" and Tags_hash[stag] or stag
    tag = string.lower(tag)
    if Tags[tag] and inst[key].Tags and inst[key].Tags[tag] then
        return inst[key].Tags[tag]:value()
    else
        return inst[key].HasTag(inst, stag, ...)
    end
end

function HasTags(inst,...)
    local tags = select(1, ...)
    local stags  = type(tags) == "table" and tags or {...}
    for i = 1, #stags do
        local tkey = stags[i] and stags[i]:lower() or ""
        local fn = HasTag or inst[key].HasTag
        if not fn(inst, tkey, ...) then return false end
    end
    return true
end

function HasOneOfTags(inst, ...)
    local tags = select(1, ...)
    local stags  = type(tags) == "table" and tags or {...}
    for i = 1, #stags do
        local tkey = stags[i] and stags[i]:lower() or ""
        local fn = HasTag or inst[key].HasTag
        if fn(inst, tkey, ...) then return true end
    end
    return false
end
function AddOrRemoveTag(inst,stag,condition,...)
    local ltag = type(stag) == "number" and Tags_hash[stag] or stag
    ltag = string.lower(ltag)
    if  Tags[ltag] then 
        if condition then 
            AddTag(inst,ltag,...)
        else
            RemoveTag(inst,ltag,...)
        end
    else
        return inst[key].AddOrRemoveTag(inst,tag,condition,...)
    end
end
function FixTag(inst) -- 传入实体 主客机一起调用
    inst[key] = {
        AddTag = inst.AddTag,
        HasTag = inst.HasTag,
        RemoveTag = inst.RemoveTag,
        HasTags = inst.HasTags,
        HasOneOfTags = inst.HasOneOfTags,
        AddOrRemoveTag = inst.AddOrRemoveTag,
        Tags = {},
        TagsD = {}
    }
    inst.AddTag = AddTag
    inst.HasTag = HasTag
    inst.RemoveTag = RemoveTag
    inst.HasTags = HasTags
    inst.HasOneOfTags = HasOneOfTags
    inst.HasAnyTag = HasOneOfTags
    inst.HasAllTags = HasTags
    inst.AddOrRemoveTag = AddOrRemoveTag
    for k, v in pairs(Tags) do
        inst[key].Tags[k] = net_bool(inst.GUID, key .. "." .. k, GUID,
                                     key .. "." .. k .. "dirty")
        if inst[key].HasTag(inst, k) then
            inst[key].RemoveTag(inst, k)
            inst[key].Tags[k]:set_local(false)
            inst[key].Tags[k]:set(true)
        else
            inst[key].Tags[k]:set(false)
        end
    end

end

AddPlayerPostInit(function(inst) -- 默认只扩展人物的
    FixTag(inst)
end)

-- return {
-- RegTag = RegTag, -- 用于注册tag   --需要主客机一起调用 注册后的tag会被截留
-- FixTag = FixTag -- 用来扩展实体的tag槽位
-- }
