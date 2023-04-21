if not TheNet:GetIsServer() then
    return
end
if not CreateMainDB then
    return
end
env.SoraDB = {}
MailDB = CreateMainDB("SoraMail", 300, 1)
SoraDB.MailDB = MailDB
GLOBALDB = CreateMainDB("SoraGLOBAL", 300, 1)
SoraDB.GLOBALDB = GLOBALDB
AddPrefabPostInit("world", function(inst)
    inst.components.SoraMailDB = SoraDB.MailDB
    inst.components.SoraGLOBALDB = SoraDB.GLOBALDB
    SoraDB.MailDB.inst = inst
    SoraDB.GLOBALDB.inst = inst
end)
MailDB:InitRoot("Players")      --存放玩家 以及玩家拥有哪些邮件
MailDB:InitRoot("Mails",3)      --存放邮件详细内容 

GLOBALDB:InitRoot("expsave")    --穹妹的经验存储
GLOBALDB:InitRoot("sorasave")    --尝试在换人的时候保存更多的数据


GLOBALDB:InitRoot("giftsave")    --领取过的礼包码
GLOBALDB:InitRoot("giftitemtype")    --礼包码转ID




