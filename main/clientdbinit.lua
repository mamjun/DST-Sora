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
    SoraClientDB.SoraClientDB = CKDB
end

--[[

CDB = SoraAPI.CDB SDB = SoraAPI.SDB MDB = SoraAPI.MailDB
SDB:Set("a","aaa",1) SDB:Set("b","aaa",1) print(CDB:Get("a","aaa"),CDB:Get("b","aaa")) 

CDB:Set("a","aaa",100) CDB:Set("b","aaa",10) print(CDB:Get("a","aaa"),CDB:Get("b","aaa")) 

TheWorld:StartThread(function () print("RPC",CDB:RPC(1,"aaa","print (111) return 111")) end)
]]

