if not TheNet:GetIsServer() then
    return
end
local function TrimLevel(t, level)
    level = (level or 0) + 1
    if t.prefab and t.data then
        if t.data.unwrappable and level > 30 then
            t.data.unwrappable = nil
            return
        end
    end
    for k, v in pairs(t) do
        if type(v) == "table" then
            TrimLevel(v, level)
        end
    end
end
--[[{KEY={
    opener=nil,
    name = nil,
    locktime = 0,
    data = {}
}}]]
function GetChestKey(userid)
    if rawget(GLOBAL, "FSAPI") then
        local team, level = GLOBAL.FSAPI.GetTeamByPlayer(userid)
        if level and level > 0 then
            return "T_" .. team
        end
        return "global"
    else
        return "global"
    end
end
function c_pt()
    print(fastdump(MailDB:GetRoot("GlobalChest")))
end
local function GetChestData(key)
    local data = MailDB:Get("GlobalChest", key, {})
    return data
end
local function SetChestData(key, data)
    local data = MailDB:Set("GlobalChest", key, data)
    return data
end
AddSimPostInit(function()
    TheWorld:ListenForEvent("FLTeamDel", NextFrame(function(inst, data)
        if not (data and data.team and data.all) then
            return
        end
        if TheShard:GetShardId() == MID then
            local key = "T_" .. data.team
            SetChestData(key, {})
            MailDB:PushEvent("ChestOpenBy", {
                Key = key,
                name = "",
                mustclose = true
            })
        end
    end))
end)
MailDB:ListenForEvent("TryOpenChest", NextFrame(function(id, data)
    if not (data and data.player and data.name and data.guid) then
        return
    end
    local o = GetChestKey(data.player)
    local d = GetChestData(o)
    local t = os.time()
    if d.opener and d.opener ~= data.player then
        if t < (d.locktime or 0) then
            -- 被其他人锁定
            MailDB:PushEvent("ChestOpenBy", {
                Key = o,
                player = d.opener,
                name = d.name,
                open = true
            }, id)
            return
        else
            -- 被其他人锁定 但是过期了 剥夺所有权
            -- 估计是世界崩了之类的 
            d.opener = nil
            d.name = nil
            d.locktime = 0
        end
    elseif d.opener and d.opener == data.player then
        -- 自己已经打开了
        if t < (d.locktime or 0) then
            MailDB:PushEvent("ChestOpenBy", {
                Key = o,
                player =d.opener,
                name = d.name,
                open = true
            }, id)
            return
        else
            d.opener = nil
            d.name = nil
            d.locktime = 0
        end
    end
    -- 打开箱子
    d.opener = data.player
    d.name = data.name
    d.locktime = t + 60
    d.data = d.data or {}
    SetChestData(o, d)
    MailDB:PushEvent("ChestOpenBy", {
        Key = o,
        player=d.opener,
        name = d.name,
        open = true
    })
    MailDB:PushEvent("ChestData", {
        key = o,
        player = data.player,
        guid = data.guid,
        data = d.data,
        name = d.name
    }, id)

end))

MailDB:ListenForEvent("TryCloseChest", NextFrame(function(id, data)
    if not (data and data.player and data.name and data.guid and data.data) then
        return
    end
    print(fastdump(data))
    local o = data.key or GetChestKey(data.player)

    local d = GetChestData(o)
    local t = os.time()
    if not d.opener then
        return
    end
    if d.opener and d.opener == data.player then
        MailDB:PushEvent("ChestOpenBy", {
            Key = o,
            name = d.name,
            open = false
        })
        d.opener = nil
        d.name = nil
        d.data = data.data
        d.locktime = 0
        SetChestData(o, d)
    else
        print("ErrCloseChest")
    end
end))
-- 更新锁定时间
MailDB:ListenForEvent("TryUpdateChest", NextFrame(function(id, data)
    if not (data and data.player and data.name and data.guid) then
        return
    end
    local o = GetChestKey(data.player)
    local d = GetChestData(o)
    local t = os.time()
    if not d.opener then
        return
    end
    if d.opener and d.opener == data.player then
        MailDB:PushEvent("ChestOpenBy", {
            Key = o,
            player=data.player,
            open=true,
            name = d.name
        })
        d.locktime = t + 60
        SetChestData(o, d)
    else
        print("ErrUpdateChest")
    end
end))
MailDB:ListenForEvent("ChestOpenBy", function(id, data)
    if not (data and data.Key) then
        return
    end
    local chest = TheWorld.components.soraenttrack:FindWith("sora2global", function(inst)
        if inst and inst.OwnerKey == data.Key then
            if data.open then
                inst.components.named:SetName("穹の末影箱(被" .. data.name .. "打开)")
                inst.components.rechargeable:Discharge(999999)
            elseif data.mustclose then
                inst:Reset()
            else
                inst:Reset()
            end
            return true
        end
    end)
end)
MailDB:ListenForEvent("ChestData", NextFrame(function(id, data)
    print(fastdump( data))
    if not (data and data.player and data.data and data.guid) then
        return
    end
    local doer = UserToPlayer(data.player)
    local inst = Ents[data.guid]

    if not doer and inst then
        return
    end
    local owner = inst.components.inventoryitem and inst.components.inventoryitem:GetGrandOwner()
    if not (doer == owner) then
        return
    end
    inst.components.container.ignoreoverstacked = true
    inst.components.container:DestroyContents()
    inst.components.container.ignoreoverstacked = false
    inst.OpenedKey = data.key
    inst.components.container:OnLoad(data.data)
    inst.ChestOpen(inst.components.container, doer)
    inst.ResetTaskTask = inst:DoTaskInTime(inst.CloseTime, inst.ResetTask)
end))
-- 尝试打开箱子
function TryOpenGlobalChest(player, inst)
    if not (player and player.userid and player.name) then
        return
    end
    print(player.userid, "TryOpenGlobalChest")
    MailDB:PushEvent("TryOpenChest", {
        player = player.userid,
        name = player.name,
        guid = inst.GUID
    }, MID)

end
-- 尝试关闭箱子
function TryCloseGlobalChest(player, inst)
    if not (player and player.userid and player.name) then
        return
    end
    print(player.userid, "TryCloseChest")
    local data = inst.components.container:OnSave()
    inst.components.container.ignoreoverstacked = true
    inst.components.container:DestroyContents()
    inst.components.container.ignoreoverstacked = false
    MailDB:PushEvent("TryCloseChest", {
        player = player.userid,
        name = player.name,
        guid = inst.GUID,
        key = inst.OpenedKey,
        data = data
    }, MID)
    inst.OpenedKey = nil
end
-- 刷新锁定时间
function TryUpdateGlobalChest(player, inst)
    if not (player and player.userid and player.name) then
        return
    end
    print(player.userid, "TryUpdateGlobalChest")
    MailDB:PushEvent("TryUpdateChest", {
        player = player.userid,
        name = player.name,
        guid = inst.GUID
    }, MID)
end
