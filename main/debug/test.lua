collectgarbage("collect")
function TestPrefab()
    local t = os.clock()
    local a = LeakTable()
    collectgarbage()
    local size = collectgarbage("count")
    local t2 = os.clock()
    for k=1,1000 do 
        local inst = SpawnPrefab("log")
        --inst:AddComponent("tradable")
        --inst:AddComponent("inventoryitem")
        --inst:AddComponent("health")
        --inst:AddComponent("combat")
        a[inst] = 1
        inst:Remove()
    end
    print("实体生成耗时",os.clock()-t2)
    local newsize = collectgarbage("count")
    print("申请" ,newsize-size)
    collectgarbage()
    print("收集" ,collectgarbage("count")-newsize)
    print("剩余",GetTableSize(a))
    print("总耗时",os.clock()-t)
end

function TestPrefabOut()
    collectgarbage()
    local size = collectgarbage("count")
    TestPrefab()
    collectgarbage()
    print("总剩余",collectgarbage("count")-size)
end


function TestDayUpdate()
    TimeCallName('ChestManagerDayUpdate')
    TimeCall(TheWorld.components.sorachestmanager.DayUpdate)
end
--[[
LM = {__mode="k"} GC=collectgarbage function LT(t) local t={} setmetatable(t,LM) return t end function TP() local t=os.clock() local a=LT() GC() local s = GC("count") for k=1,1000 do local inst = SpawnPrefab("log") a[inst] = 1 inst:Remove() end local n = GC("count") print("申请" ,n-s) GC() print("收集" ,GC("count")-n) print("剩余",GetTableSize(a)) end function TPO() GC() local s=GC("count") TP() GC() print("总剩余",GC("count")-s) end TPO()
]]


function TestCook()
    local cooking = require("cooking")
    local all = {}
    for k,v in pairs(cooking.ingredients) do
        table.insert(all, k)
    end
    local num = GetTableSize(all)
    local pos = ThePlayer:GetPosition()
    local light = nil
    for i=1,num do 
        if i % 50 == 1 then 
            light = SpawnAt("sora_light",pos+Point(math.floor(i/50),0,0))
            light.components.container:GiveItem(SpawnPrefab("bluegem"),155)
        end
        local prefab = all[i]
        local inst = SpawnPrefab(prefab)
        if inst then 
            if inst.components.inventoryitem then 
                light.components.container:GiveItem(inst)
                if inst.components.stackable then 
                    inst.components.stackable:SetStackSize(math.random(10,50))
                else
                    for i=1,2 do 
                        light.components.container:GiveItem(SpawnPrefab(prefab))
                    end
                end
            else
                inst:Remove()
            end
        end
    end
end


