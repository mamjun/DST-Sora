if not CreateClientDB then
    return
end
local function encode(data)
    local r, str = pcall(json.encode, data)
    if not r then
        print("ClientDB:ERROE ENCODE", str, tostring(data))
    end
    return str
end

local function decode(str)
    local r, data = pcall(json.decode, str)
    if not r then
        print("Client:ERROE DECODE", data, tostring(str))
    end
    return data
end
env.SoraClientDB = {}

local temp = CreateClientDBTemple("chou", 300, 1)
temp:InitRoot("data") -- up池 纠缠之源 这些小数据
temp:InitRoot("record", 3) -- 大数据

temp.serverfn = function(ns, db, userid)

    db:ListenForEvent("", function(id, data, event)

    end)
    db:AddRPCHandle("chouka", function(id, data, cmd)
        if db.player and db.player:HasTag("sora") and type(data) == "table" and (data.code == 1 or data.code == 10) then
            local p = db.player
            return p.components.sorachouka and p.components.sorachouka:ChouKa(data.code)
        end
    end)
    db.inst = TheWorld
    db:BindMainDB("data", MailDB, "Players")
end

temp.clientfn = function(ns, db, userid)
    CKDB = db -- 用于客户端取数据
    SoraClientDB.SoraClientCKDB = CKDB
end

local temp = CreateClientDBTemple("seed", 300, 1)
temp:InitRoot("seeds")

temp.serverfn = function(ns, db, userid)
    db:ListenForEvent("GetSeeds", function(id, data, event)
        local player = UserToPlayer(id)
        if player and data and data.name then
            local staff = player.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if staff and staff.components.soraseedcontainer then
                staff.components.soraseedcontainer:HandleGetSeeds(player, data.name)
            end
        end
    end)
    db:ListenForEvent("CollectAllSeeds", function(id, data, event)
        local player = UserToPlayer(id)
        if player then
            local staff = player.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
            if staff and staff.components.soraseedcontainer then
                staff.components.soraseedcontainer:HandleCollectAllSeeds(player)
            end
        end
    end)
    db.inst = TheWorld
    local maindb = SeedDB
    local mode = GLOBAL.TUNING.SORAFGMODE or 0
    local selfroot, maindb, root = "seeds", maindb, "seeds"
    local oldOwnerKey = ""

    local function GetOwnerKey()
        if mode == 1 and userid then
            return "S_" .. userid
        end
        if mode == 2 then
            if rawget(GLOBAL, "FSAPI") then
                local team, level = GLOBAL.FSAPI.GetTeamByPlayer(userid)
                if level and level > 0 then
                    return "T_" .. team
                end
            end
            return ""
        end
        if mode == 3 then
            if rawget(GLOBAL, "FSAPI") then
                local team, level = GLOBAL.FSAPI.GetTeamByPlayer(userid)
                if level and level > 0 then
                    return "T_" .. team
                else
                    return "S_" .. userid
                end
            end
            return ""
        end
        -- 默认使用全局的 
        return ""
    end

    local getfn = function(s, r, k, v)
        if mode > 0 then
            local o = GetOwnerKey()
            if o == "" then
                return maindb:Get(root, k, v)
            end
            local t = maindb:Get(root, o, {})
            return t[k] or v
        end
        return maindb:Get(root, k, v)
    end

    local setfn = function(s, r, k, v)
        if mode > 0 then
            local o = GetOwnerKey()
            if o == "" then
                return maindb:Set(root, k, v)
            end
            local t = maindb:Get(root, o, {})
            t[k] = v
            return maindb:Set(root, o, t)
        end
        return maindb:Set(root, k, v)
    end

    local getrootfn = function(s, r)
        if mode > 0 then
            local o = GetOwnerKey()
            if o == "" then
                local newt = {}

                local allt = maindb:GetRoot(root)
                for ik, iv in pairs(allt) do
                    if ik:match("^S_") or ik:match("^T_") then

                    else
                        newt[ik] = iv
                    end
                end
                return newt
            end
            local t = maindb:Get(root, o, {})
            return t
        end
        return maindb:GetRoot(root)
    end

    db.UpdateOwnerKeyTask = db.inst:DoPeriodicTask(3, function()
        local newkey = GetOwnerKey()
        if oldOwnerKey == newkey then
            return
        end
        local newt = db:GetRoot(selfroot)
        local str = encode(newt)
        db:Send(nil, "SyncReply", selfroot, hash(str), str)
        oldOwnerKey = newkey
    end)
    local changefn = function(i, data)
        -- print("changefn", data.root, data.key)
        if data.root == root then
            local o = GetOwnerKey()
            if data.key then
                if data.key:match("^S_") or data.key:match("^T_") then
                    if o == data.key then
                        local str = encode(data.value)
                        db:Send(nil, "SyncReply", selfroot, hash(str), str)
                    else
                        return
                    end
                elseif o == "" then
                    db:Send(nil, "Set", selfroot, data.key, encode(data.value))
                end
            else
                if o == "" then
                    local newt = {}
                    for ik, iv in pairs(data.value) do
                        if ik:match("^S_") or ik:match("^T_") then

                        else
                            newt[ik] = iv
                        end
                    end
                    local str = encode(newt)
                    db:Send(nil, "SyncReply", selfroot, hash(str), str)
                else
                    local newt = data.value[o] or {}
                    local str = encode(newt)
                    db:Send(nil, "SyncReply", selfroot, hash(str), str)
                end
            end
        end
    end
    if db.inst and maindb.inst then -- 如果双方都有实体 就监听event
        db.inst:ListenForEvent("MainDBRootSync", changefn, maindb.inst)
        db.inst:ListenForEvent("MainDBSet", changefn, maindb.inst)
    end
    local bind = db:BindRootFn(selfroot, getfn, setfn, getrootfn)
    bind.Remove = function()
        db.inst:RemoveEventCallback("MainDBRootSync", changefn, maindb.inst)
        db.inst:RemoveEventCallback("MainDBSet", changefn, maindb.inst)
    end

    -- db:BindMainDB("seeds", SeedDB, "seeds")
end

temp.clientfn = function(ns, db, userid)
    SeedCDB = db -- 用于客户端取数据
    db.inst = TheWorld
    SoraClientDB.SeedCDB = SeedCDB
end

local temp = CreateClientDBTemple("RPC", 300, 1)
temp:InitRoot("data")
temp.serverfn = function(ns, db, userid)

    db:ListenForEvent("SelectBook", function(id, data, event, ent)
        local player = UserToPlayer(id)
        if player and data and data.id and type(ent) == "table" and ent:IsValid() and ent.components.spellbook then
            ent.components.spellbook:SelectSpell(data.id)
        end
    end)
    db:ListenForEvent("SoraLock", function(id, data, event, ent)
        -- print(id, data, event, ent)
        if not (data and type(data) == "table" and ent) then
            return
        end
        local cmd = data.cmd
        local doer = UserToPlayer(id)
        -- print(doer.userid,cmd,data.pass or "0")
        if not (doer and ent and ent.components.soracontainlock) then
            return
        end

        if cmd == "UnLockByUser" then
            ent.components.soracontainlock:OpenByUser(doer)
        elseif cmd == "UnLockByClick" then
            if not doer.SoraLockCD then
                doer.SoraLockCD = SoraCD(30)
            end
            if doer.SoraLockCD() then
                TheNet:Announce("各单位请注意: 「" .. doer.name .. "  」正在尝试开启「" ..
                                    (ent.components.soracontainlock.lockername or "未知") ..
                                    "」的保险，请及时处理！")
            end
        elseif cmd == "UndoPass" then
            ent.components.soracontainlock:Uninit(doer)
        elseif cmd == "ChangePass" then
            ent.components.soracontainlock:ChangePass(doer, data.pass or "000000")
        elseif cmd == "UnLockByPass" then
            ent.components.soracontainlock:TryPass(doer, data.pass or "000000")
        end
    end)

    db:ListenForEvent("Sora2ChestControl", function(id, data, event, ent)
        -- print(id, data, event, ent)
        if not (data and type(data) == "table" and data.cmd) then
            return
        end
        local cmd = data.cmd
        local doer = UserToPlayer(id)
        -- print(doer.userid,cmd,data.pass or "0")
        if not (doer) then
            return
        end
        if cmd == "Collect" and ent and type(ent) == "table" and ent.components and ent.components.container then
            if not doer.sora2chestcd then
                doer.sora2chestcd = SoraCD(1)
            end
            if not doer.sora2chestcd() then
                return
            end

            if TheWorld.components.sorachestmanager:IsStop() then
                TheWorld.components.sorachestmanager:GetStopTime(doer)
                return
            end
            TheWorld.components.sorachestmanager:OnClose(ent, doer)
            return
        end
        if cmd == "UnPause" then
            TheWorld.components.sorachestmanager:Pause(false)
        elseif cmd == "Pause" then
            TheWorld.components.sorachestmanager:Pause(true)
        elseif cmd == "PauseDay" then
            TheWorld.components.sorachestmanager:SetStopTime(TUNING.TOTAL_DAY_TIME)
        elseif cmd == "PauseTenDays" then
            TheWorld.components.sorachestmanager:SetStopTime(TUNING.TOTAL_DAY_TIME * 10)
        elseif cmd == "GlobalBuild" then
            if TUNING.SORADISABLEGLOBAL then
                Say(doer,
                    IsGemEnable and "全局制作不兼容GemCore,已自动禁用" or "设置里已禁止全局制作")
                return
            end
            if doer and doer.player_classified and doer.player_classified.soraglobalbuild then
                local b = not doer.player_classified.soraglobalbuild:value()
                doer.player_classified.soraglobalbuild:set(b)
                Say(doer, b and "开启全局制作模式" or "关闭全局制作模式")
            end
            return
        end
        TheWorld.components.sorachestmanager:GetStopTime(doer)
    end)
    db:ListenForEvent("SoraBuild", function(id, data, event, ent)
        if not (data and type(data) == "table" and data.cmd) then
            return
        end
        local cmd = data.cmd
        local doer = UserToPlayer(id)
        -- print(doer.userid,cmd,data.pass or "0")
        if not (doer) then
            print(111)
            return
        end
        if not doer.sorabuildcd then
            doer.sorabuildcd = SoraCD(0.1)
        end
        if not (ent and ent.prefab == "sora_build") then
            print(222)
            return
        end
        print(id,data,event,ent)
        if cmd == "Reset" then
            ent:ResetBuild(doer)
        elseif cmd == "Set" then
            if data.pos and data.scale then
                ent:FixBuild(doer,Point(data.pos.x,data.pos.y,data.pos.z),data.scale)
            else
                return
            end
        elseif cmd == "Clear" then
            ent:ClearAllTarget(doer)
        end
        return
    end)
    db.inst = TheWorld

end

temp.clientfn = function(ns, db, userid)
    SoraRPC = db -- 用于客户端取数据
    local ui = require("widgets/soralock")

    db:ListenForEvent("OpenLockUI", function(id, data, event, ent)
        if data.cmd == "close" then
            if data.pass and ThePlayer.SoraLockUI and ThePlayer.SoraLockUI.SavePass then
                ThePlayer.SoraLockUI:SavePass(data.pass)
            end
            if ThePlayer.SoraLockUI then
                ThePlayer.SoraLockUI:Kill()
            end -- ThePlayer.SoraLockUI = nil 
        else
            local a = ui(ThePlayer, ent, data and data.name or "未知")
            ThePlayer.HUD.controls.containerroot:AddChild(a)
            ThePlayer.SoraLockUI = a
        end
    end)
    db.inst = TheWorld
    SoraClientDB.SoraRPC = SoraRPC
end

function r_event(user, event, data, ent)
    local db = user and GetClientDB("RPC", type(user) == "string" and user or user.userid, true) or SoraClientDB.SoraRPC
    if not db then
        -- print("ERROR R_EVENT",user,event,data,ent)
        return
    end
    db:PushEvent(event, data, nil, ent)
end

AddPlayerPostInit(function(inst)
    if TheWorld.soraismastersim then
        inst:ListenForEvent("newactiveitem", function(i, data)
            if data and i.userid then
                local db = GetClientDB("RPC", i.userid, true)
                if not db then
                    return
                end
                if data.item and data.item:HasTag("sora_photo") and data.item.data and data.item.data.bank then
                    db:Set('data', 'photodata', data.item.data)
                else
                    db:Set('data', 'photodata', nil)
                end
            end
        end)
    end
end)

--[[

CDB = SoraAPI.CDB SDB = SoraAPI.SDB MDB = SoraAPI.MailDB
SDB:Set("a","aaa",1) SDB:Set("b","aaa",1) print(CDB:Get("a","aaa"),CDB:Get("b","aaa")) 

CDB:Set("a","aaa",100) CDB:Set("b","aaa",10) print(CDB:Get("a","aaa"),CDB:Get("b","aaa")) 

TheWorld:StartThread(function () print("RPC",CDB:RPC(1,"aaa","print (111) return 111")) end)
]]

