local assets =
{
    Asset("ANIM", "anim/sora_jrxy.zip"),
}

local function MakeWingFx(name, animation, direction, source_frame, source_frame_end)
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddFollower()
        inst.entity:AddNetwork()

        inst.Transform:SetNoFaced()
        inst.AnimState:SetBank("sorabag_jrxy")
        inst.AnimState:SetBuild("sorabag_jrxy")
        inst.AnimState:PlayAnimation(animation, true)
        inst.AnimState:SetFinalOffset(1)

        inst:AddTag("FX")
        inst:AddTag("NOCLICK")
        inst:AddTag("NOBLOCK")
        inst:AddComponent("highlightchild")

        inst.wing_direction = direction
        inst.wing_source_frame = source_frame
        inst.wing_source_frame_end = source_frame_end

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("colouradder")
        inst.persists = false

        return inst
    end

    return Prefab(name, fn, assets)
end

return MakeWingFx(
        "sora_wingbag_draft_front_fx",
        "idle_loop_1",
        "front",
        9
    ),
    MakeWingFx(
        "sora_wingbag_draft_side_fx",
        "idle_loop_2",
        "side",
        10
    ),
    MakeWingFx(
        "sora_wingbag_draft_back_fx",
        "idle_loop_3",
        "back",
        6,
        8
    ),
    MakeWingFx(
        "sora_wingbag_draft_back_alt2_fx",
        "idle_loop_3",
        "back_alt2",
        11
    )
