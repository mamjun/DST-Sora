if not CreateClientDB then
    return
end
env.SoraClientDB = {}

local temp = CreateClientDBTemple("test", 30, 1)
temp:InitRoot("a")
temp:InitRoot("b")
temp:InitRoot("c")
temp.serverfn = function(ns,db,userid)
    
    db:ListenForEvent("aaa", function(...)
        print(...)
    end)
    db:AddRPCHandle("aaa", function(...)
        print(...)
    end)
    
    db.inst = TheWorld
    db:BindMainDB("b", MailDB, "Players")

    -- SDB = db
    -- SoraClientDB.SDB = SDB
    -- global("SDB")
    -- global("MDB")
    -- GLOBAL.SDB = SDB
    -- GLOBAL.MDB = MailDB
end
temp.clientfn = function(ns,db,userid)
    -- CDB = db
    -- global("CDB")
    -- SoraClientDB.CDB = CDB
    -- GLOBAL.CDB = CDB
end



local temp = CreateClientDBTemple("test2", 30, 1)
temp:InitRoot("a")
temp:InitRoot("b")
temp:InitRoot("c")
temp.serverfn = function(ns,db,userid)
    
    db:ListenForEvent("aaa", function(...)
        print(...)
    end)
    db:AddRPCHandle("aaa", function(...)
        print(...)
    end)
    
    db.inst = TheWorld
    db:BindMainDB("b", MailDB, "Players")

    -- SDB = db
    -- SoraClientDB.SDB = SDB
    -- global("SDB")
    -- global("MDB")
    -- GLOBAL.SDB = SDB
    -- GLOBAL.MDB = MailDB
end
temp.clientfn = function(ns,db,userid)
    -- CDB = db
    -- global("CDB")
    -- SoraClientDB.CDB = CDB
    -- GLOBAL.CDB = CDB
end
--[[

CDB = SoraAPI.CDB SDB = SoraAPI.SDB MDB = SoraAPI.MailDB
SDB:Set("a","aaa",1) SDB:Set("b","aaa",1) print(CDB:Get("a","aaa"),CDB:Get("b","aaa")) 

CDB:Set("a","aaa",100) CDB:Set("b","aaa",10) print(CDB:Get("a","aaa"),CDB:Get("b","aaa")) 

TheWorld:StartThread(function () print("RPC",CDB:RPC(1,"aaa","print (111) return 111")) end)
]]

