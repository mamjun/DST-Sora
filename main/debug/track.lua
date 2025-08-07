local alltracks = LeakTable()
local Saves = {}
Track = {}
Track.BlackList = {}
Track.BlackList[GLOBAL] = 1

function Track.Track(tbl, name)
    alltracks[tbl] = name
end
local metacall = {__call = Track.Track}
setmetatable(Track,metacall)
function Track.Clear()
    alltracks = LeakTable()
    Saves = {}
end
function Track.GetSaves()
    return Saves 
end
function Track.Compare(ret1, ret2)
    local new = {}
    local ia, ib = #ret1, #ret2
    local i = 0

end
local function Sort(a, b)
    if a.name == "all" then
        return true
    end
    return a.name < b.name
end
function Track.Save(ret)
    table.sort(ret, Sort)
    table.insert(Saves, ret)
end
function Track.DumpAll()

    collectgarbage() -- 收集一下内存 清除弱引用的失效内容
    local t = os.clock()
    local HasVisited = LeakTable()
    local ret = {{
        name = 'all',
        count = 0
    }}
    for k, v in pairs(alltracks) do
        Track.GetTrack(ret, k, v, HasVisited)
    end
    print("统计耗时", os.clock() - t)
    collectgarbage() -- 收集一下内存

    return ret
end
function Track.GetTrack(ret, key, tbl, visit)
    local count = 0
    local tblret = {
        name = key
    }
    table.insert(ret, tblret)
    for k, v in pairs(tbl) do
        count = count + 1
        ret[1].count = ret[1].count + 1

        if type(v) == "table" then
            visit[v] = (visit[v] or 0) + 1
            if visit[v] < 2 and not Track.BlackList[v] then
                Track.GetTrack(ret, key .. "." .. tostring(k), v, visit)
            end
        end
    end
    tblret.count = count
end
function Track.Dump(tbl)
    local t = os.clock()
    collectgarbage() -- 收集一下内存 清除弱引用的失效内容
    print("回收耗时1", os.clock() - t)
    local t = os.clock()
    local HasVisited = LeakTable()
    local ret = {{
        name = 'all',
        count = 0
    }}
    Track.GetTrack(ret, "/", tbl, HasVisited)
    print("统计耗时", os.clock() - t)
    for k, v in pairs(ret) do
        print(v.name, v.count)
    end
    local t = os.clock()
    collectgarbage() -- 收集一下内存
    print("回收耗时2", os.clock() - t)
    return ret
end

return Track
