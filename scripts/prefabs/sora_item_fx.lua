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
]] local Assets = {Asset("ANIM", "anim/sora_item_fx.zip"),Asset("ANIM", "anim/sora_wsqt_fx.zip")}
local function Bind(inst, target, time)
    inst.entity:SetParent(target.entity)
    inst:DoTaskInTime(time, inst.Remove)
end
local function fn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.AnimState:SetBank("sora_item_fx")
    inst.AnimState:SetBuild("sora_item_fx")
    inst.AnimState:PlayAnimation("pre")
    inst.AnimState:PushAnimation("loop")
    inst.AnimState:SetLayer(LAYER_WORLD_BACKGROUND)
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst.Bind = Bind
    inst.entity:SetPristine()
    inst.persists = false
    return inst
end

local tmpAssets = {Asset("ANIM", "anim/soratmp.zip")}
local function tmpBind(inst, target, scale, offset)
    local scale = scale or 1
    local pos = offset or Point(0, 0.5, 0)
    inst.entity:SetParent(target.entity)
    inst.AnimState:SetScale(scale, scale, scale)
    inst.Transform:SetPosition(pos.x, pos.y, pos.z)
end
local function tmpfn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    inst.AnimState:SetBank("soratmp")
    inst.AnimState:SetBuild("soratmp")
    inst.AnimState:PlayAnimation("idle")
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst.Bind = tmpBind
    inst.entity:SetPristine()
    inst.persists = false
    return inst
end
local function footsbycfn(Sim)
    -- print("footsbyfncc0")
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    -- inst.entity:AddNetwork()
    inst.AnimState:SetBank("sora_foot_fx_sby")
    inst.AnimState:SetBuild("sora_foot_fx_sby")
    inst.AnimState:PlayAnimation("idle")
    local scale = math.random() * 0.5 + 0.65
    inst.AnimState:SetScale(scale, scale, scale)
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst.entity:SetPristine()
    inst.persists = false
    inst:ListenForEvent("animover", inst.Remove)
    return inst
end

local function FootFX(inst)
    local parent = inst.entity:GetParent()
    if parent and not parent:HasTag("moving") then
        return
    end
    local fx = SpawnPrefab("sora_foot_fx_sby_c")
    local pos = inst:GetPosition()
    pos.x = pos.x + math.random() * 2 - 1
    pos.z = pos.z + math.random() * 2 - 1
    fx.Transform:SetPosition(pos:Get())

    -- local fx = SpawnPrefab("sora_foot_fx_sby_c")
    -- local pos = inst:GetPosition()
    -- pos.x = pos.x + math.random()*2 -1 
    -- pos.z = pos.z + math.random()*2 -1 
    -- fx.Transform:SetPosition(pos:Get())

end

local function footsbyfn(Sim)
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddNetwork()
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst.entity:SetPristine()
    inst.persists = false
    if not TheNet:IsDedicated() then
        inst:DoPeriodicTask(0.3, FootFX, math.random())
    end
    return inst
end
local function wsqt_fxbind(inst,owner,pos)
	inst.entity:SetParent(owner.entity)
	inst.owner = owner
	owner:SoraLockSymbol("headbase","sora_wsqt","sora_wsqt_fx","swap_headbase")
	owner:SoraLockSymbol("headbase_hat","sora_wsqt","sora_wsqt_fx","swap_headbase")
	owner:SoraLockSymbol("hair","sora_wsqt","sora_wsqt_fx","swap_hair")
	owner:SoraLockSymbol("hair_hat","sora_wsqt","sora_wsqt_fx","swap_hair")
	owner:SoraLockSymbolShow("face","sora_wsqt",false)
	owner:SoraLockSymbolShow("swap_face","sora_wsqt",false)
	owner:SoraLockSymbolShow("swap_hat","sora_wsqt",false)
	owner:SoraLockSymbolShow("beard","sora_wsqt",false)
	owner:SoraLockSymbolShow("cheeks","sora_wsqt",false)
	owner:SoraLockSymbolShow("hairfront","sora_wsqt",false)
	owner:SoraLockSymbolShow("hairpigtails","sora_wsqt",false)
	owner:SoraLockLayerShow("HAT","sora_wsqt",false)
	owner:SoraLockLayerShow("HAIR_HAT","sora_wsqt",false)
	owner:SoraLockLayerShow("HAIR_NOHAT","sora_wsqt",false)
	owner:SoraLockLayerShow("HAIR","sora_wsqt",true)

	owner:SoraLockLayerShow("HEAD","sora_wsqt",true)
	owner:SoraLockLayerShow("HEAD_HAT_NOHELM","sora_wsqt",false)
	owner:SoraLockLayerShow("HEAD_HAT_HELM","sora_wsqt",false)
	owner:SoraLockLayerShow("HAIR_NOHAT","sora_wsqt",false)
end
local function wsqt_unfxbind(inst)
	local owner = inst.owner 
	if not owner then 
		return 
	end
	owner:SoraUnlockSymbol("headbase","sora_wsqt")
	owner:SoraUnlockSymbol("headbase_hat","sora_wsqt")
	owner:SoraUnlockSymbol("hair","sora_wsqt")
	owner:SoraUnlockSymbol("hair_hat","sora_wsqt")
	owner:SoraUnlockSymbolShow("face","sora_wsqt")
	owner:SoraUnlockSymbolShow("swap_face","sora_wsqt")
	owner:SoraUnlockSymbolShow("swap_hat","sora_wsqt")
	owner:SoraUnlockSymbolShow("beard","sora_wsqt")
	owner:SoraUnlockSymbolShow("cheeks","sora_wsqt")
	owner:SoraUnlockSymbolShow("hairfront","sora_wsqt")
	owner:SoraUnlockSymbolShow("hairpigtails","sora_wsqt")
	owner:SoraUnlockLayerShow("HAT","sora_wsqt")
	owner:SoraUnlockLayerShow("HAIR_HAT","sora_wsqt")
	owner:SoraUnlockLayerShow("HAIR_NOHAT","sora_wsqt")
	owner:SoraUnlockLayerShow("HAIR","sora_wsqt")

	owner:SoraUnlockLayerShow("HEAD","sora_wsqt")
	owner:SoraUnlockLayerShow("HEAD_HAT_NOHELM","sora_wsqt")
	owner:SoraUnlockLayerShow("HEAD_HAT_HELM","sora_wsqt")
	owner:SoraUnlockLayerShow("HAIR_NOHAT","sora_wsqt")
end
local function ResetTime(inst)
    if inst.killtask then 
        inst.killtask:Cancel()
    end
    inst.killtask = inst:DoTaskInTime(inst.time,inst.Remove)
end
local function wsqt_fxfn(Sim)
    -- print("footsbyfncc0")
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()

	--inst.AnimState:SetLayer(LAYER_BELOW_GROUND)
	inst.bind= wsqt_fxbind
    inst:AddTag("FX")
    inst:AddTag("NOCLICK")
    inst:AddTag("NOBLOCK")
    inst.entity:SetPristine()
    inst.persists = false
    inst.time = 480
	if not TheWorld.soraismastersim then 
		return true 
	end
    inst.ResetTime = ResetTime 
    inst.killtask = inst:DoTaskInTime(inst.time,inst.Remove)
	inst:ListenForEvent("onremove",wsqt_unfxbind)
    return inst
end
return Prefab("sora_item_fx", fn, Assets), Prefab("sora_tmp_fx", tmpfn, tmpAssets),
    Prefab("sora_foot_fx_sby", footsbyfn), Prefab("sora_foot_fx_sby_c", footsbycfn), Prefab("sora_wsqt_fx", wsqt_fxfn)
