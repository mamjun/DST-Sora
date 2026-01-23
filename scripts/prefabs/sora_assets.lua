local function fn()
    local inst = CreateEntity()
    inst.persists = false
    return inst
end

return Prefab("sora_mod_assets", fn, SoraAPI.SoraAssets)