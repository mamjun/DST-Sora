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
    db:BindMainDB("data",MailDB,"Players")
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
                staff.components.soraseedcontainer:HandleGetSeeds(player,data.name)
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
    db:BindMainDB("seeds",SeedDB,"seeds")
end

temp.clientfn = function(ns, db, userid)
    SeedCDB = db -- 用于客户端取数据
    db.inst = TheWorld
    SoraClientDB.SeedCDB = SeedCDB
end


local temp = CreateClientDBTemple("RPC", 300, 1)
temp.serverfn = function(ns, db, userid)

    db:ListenForEvent("SelectBook", function(id, data, event,ent)
        local player = UserToPlayer(id)
        if player and data and data.id and type(ent) == "table" and ent:IsValid() and ent.components.spellbook then
            ent.components.spellbook:SelectSpell(data.id)
        end
    end)
 
    db.inst = TheWorld

end

temp.clientfn = function(ns, db, userid)
    SoraRPC = db -- 用于客户端取数据
    db.inst = TheWorld
    SoraClientDB.SoraRPC = SoraRPC
end


--[[

CDB = SoraAPI.CDB SDB = SoraAPI.SDB MDB = SoraAPI.MailDB
SDB:Set("a","aaa",1) SDB:Set("b","aaa",1) print(CDB:Get("a","aaa"),CDB:Get("b","aaa")) 

CDB:Set("a","aaa",100) CDB:Set("b","aaa",10) print(CDB:Get("a","aaa"),CDB:Get("b","aaa")) 

TheWorld:StartThread(function () print("RPC",CDB:RPC(1,"aaa","print (111) return 111")) end)
]]

