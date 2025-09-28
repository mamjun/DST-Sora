local pri = {}
local skipprefab = {}
function photo_skip(inst)
    local prefab
    if type(inst) == "string" then
        prefab = inst
    elseif type(inst) == "table" then
        if inst.prefab then
            prefab = inst.prefab
        end
    elseif type(inst) == "nil" then
        inst = ConsoleWorldEntityUnderMouse()
        if inst then
            prefab = inst.prefab

        end
    end
    if prefab then
        skipprefab[prefab] = 1
        Say(ThePlayer, "已忽略" .. prefab)
    else
        Say(ThePlayer, "请选择一个物品")
    end
end
local function GetTileCenter(pos)
    if pos then
        pos.x, pos.y, pos.z = TheWorld.Map:GetTileCenterPoint(pos.x, pos.y, pos.z)
    end
    return pos
end

function photo_all(range)
    if not ThePlayer then
        return
    end
    local sq = range or 5
    if sq > 2000 then
        sq = nil
    end
    local all = 0 
    local pos = GetTileCenter(ThePlayer:GetPosition())

    for k, v in pairs(Ents) do
        if v and v.prefab and v.Transform and v.AnimState and v:IsValid() then
            if sq then
                local itempos = v:GetPosition()
                local dis = itempos - pos
                if math.abs(dis.x) < sq and math.abs(dis.z) < sq then
                    if pri.TestPhoto(v) then
                        pri.ToPhoto(v)
                        all = all+1
                    end
                end
            else
                if pri.TestPhoto(v) then
                    pri.ToPhoto(v)
                    all = all+1
                end
            end
        end
    end
    Say(ThePlayer, "总共" .. all .. "个" .. (range and "（" .. range .. "格内）" or "") .. "实体被转换成留影了")
end

function pri.TestPhoto(inst)
    local srcinst = inst
    if inst.highlightforward then
        inst = inst.highlightforward
    end
    if inst:IsInLimbo() then
        return false
    end
    if inst:HasTag("player") then
        return false
    end

    if inst:HasTag("sora_photo") or inst:HasTag("cantphoto") then
        return false
    end
    if inst.components.skinedlegion then
        -- Say(doer, "这个皮肤暂时不能留影")
        return false
    end
    if inst.skinname and not TheInventory:CheckClientOwnership(ThePlayer.userid, inst.skinname) then
        -- Say(doer, "你还没有拥有这个皮肤")
        return false
    end

    local skinbuild = inst.AnimState:GetSkinBuild()
    if skinbuild and skinbuild ~= "" then
        -- Say(doer, "这个皮肤暂时不能留影")
        return false
    end

    return true
end

function pri.ToPhoto(inst)
    local pos = inst:GetPosition()
    local data = SoraAPI.TryPhoto(inst, ThePlayer)
    if not data then
        return
    end
    local photo = SpawnPrefab("sora_photo")
    if photo then
        photo.Transform:SetPosition(pos:Get())
        photo:SetData(data)
        inst:Remove()
    end
end
