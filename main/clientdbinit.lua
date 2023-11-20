if not CreateClientDB then
    return
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
    db:BindMainDB("seeds", SeedDB, "seeds")
end

temp.clientfn = function(ns, db, userid)
    SeedCDB = db -- 用于客户端取数据
    db.inst = TheWorld
    SoraClientDB.SeedCDB = SeedCDB
end

local temp = CreateClientDBTemple("RPC", 300, 1)
temp.serverfn = function(ns, db, userid)

    db:ListenForEvent("SelectBook", function(id, data, event, ent)
        local player = UserToPlayer(id)
        if player and data and data.id and type(ent) == "table" and ent:IsValid() and ent.components.spellbook then
            ent.components.spellbook:SelectSpell(data.id)
        end
    end)
    db:ListenForEvent("SoraLock", function(id, data, event, ent)
        --print(id, data, event, ent)
        if not (data and type(data) == "table" and ent) then
            return
        end
        local cmd = data.cmd
        local doer = UserToPlayer(id)
        --print(doer.userid,cmd,data.pass or "0")
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


    db:ListenForEvent("Sora2ChestControl", function(id, data,event,ent)
        --print(id, data, event, ent)
        if not (data and type(data) == "table" and data.cmd) then
            return
        end
        local cmd = data.cmd    
        local doer = UserToPlayer(id)
        --print(doer.userid,cmd,data.pass or "0")
        if not (doer) then
            return
        end    
        if cmd == "Collect" and ent and type(ent) == "table" and ent.components and ent.components.container  then
            if not doer.sora2chestcd then
                doer.sora2chestcd = SoraCD(1)
            end
            if not doer.sora2chestcd() then return end

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
        end
        TheWorld.components.sorachestmanager:GetStopTime(doer)
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
            if ThePlayer.SoraLockUI then ThePlayer.SoraLockUI:Kill() end --ThePlayer.SoraLockUI = nil 
        else
            local a = ui(ThePlayer,ent,data and data.name or "未知")
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
--[[

CDB = SoraAPI.CDB SDB = SoraAPI.SDB MDB = SoraAPI.MailDB
SDB:Set("a","aaa",1) SDB:Set("b","aaa",1) print(CDB:Get("a","aaa"),CDB:Get("b","aaa")) 

CDB:Set("a","aaa",100) CDB:Set("b","aaa",10) print(CDB:Get("a","aaa"),CDB:Get("b","aaa")) 

TheWorld:StartThread(function () print("RPC",CDB:RPC(1,"aaa","print (111) return 111")) end)
]]

