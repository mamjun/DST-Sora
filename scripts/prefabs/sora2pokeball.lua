local assets =
{
    Asset("ANIM", "anim/sora2pokeball.zip"),
	Asset( "IMAGE", "images/inventoryimages/sora2pokeball.tex" ),
    Asset( "ATLAS", "images/inventoryimages/sora2pokeball.xml" ),
	Asset( "ATLAS_BUILD", "images/inventoryimages/sora2pokeball.xml" ,256),
}
local prefabs = {}

local function recharge(inst, data)
    if data.percent >= 1 and not inst:HasTag("sorarecharge") then
        inst:AddTag("sorarecharge")
    elseif data.percent < 1 and inst:HasTag("sorarecharge") then
        inst:RemoveTag("sorarecharge")
    end
end

local function fn()


    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()
    MakeInventoryPhysics(inst)
    inst.AnimState:SetBank("sora2pokeball")
    inst.AnimState:SetBuild("sora2pokeball")
    inst.AnimState:PlayAnimation("idle",true)
    inst.entity:SetPristine()
    inst:AddTag("sorarecharge")
    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst.components.inspectable:SetDescription([[快到球里来]])
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname="images/inventoryimages/sora2pokeball.xml"
	inst.components.inventoryitem.imagename="sora2pokeball"
	inst:AddComponent("named")
	inst:AddComponent("sora2pokeball")
    inst:AddComponent("rechargeable")
    inst:ListenForEvent("rechargechange", recharge)
    inst.components.rechargeable:SetMaxCharge(10)
    --inst.components.instrument:SetOnHeardFn(HearHorn)
    return inst
end


return Prefab("sora2pokeball", fn, assets, prefabs)