local Batch = {}

function Batch.Begin(db, root)
    if not db.data[root] then
        return false, "No Root"
    end
    local batch = db.batches[root]
    if batch then
        batch.depth = batch.depth + 1
    else
        db.batches[root] = {depth = 1, keys = {}, entries = {}}
    end
    return true
end

-- Keep the last complete value for each key, including nil (a deletion).
function Batch.Record(batch, key, value)
    local entry = batch.keys[key]
    if not entry then
        entry = {key = key}
        batch.keys[key] = entry
        table.insert(batch.entries, entry)
    end
    entry.value = value
end

function Batch.Finish(db, root)
    local batch = db.batches[root]
    if not batch then
        return false, "No Batch"
    end
    batch.depth = batch.depth - 1
    if batch.depth > 0 then
        return true
    end
    db.batches[root] = nil
    if #batch.entries > 0 then
        db:FlushBatch(root, batch.entries)
    end
    return true
end

function Batch.Send(db, root, entries, encode)
    if #entries == 1 then
        local entry = entries[1]
        db:Send(nil, "Set", root, entry.key, encode(entry.value))
    elseif #entries > 1 then
        db:Send(nil, "SetBatch", root, nil, encode(entries))
    end
end

function Batch.Apply(target, entries)
    if type(entries) ~= "table" then return false end
    local count = 0
    for index, entry in pairs(entries) do
        if type(index) ~= "number" or index < 1 or index ~= math.floor(index) or index > #entries
            or type(entry) ~= "table" then
            return false
        end
        local kind = type(entry.key)
        if kind ~= "number" and kind ~= "string" and kind ~= "boolean" then return false end
        count = count + 1
    end
    if count == 0 or count ~= #entries then return false end
    for _, entry in ipairs(entries) do
        target[entry.key] = entry.value
    end
    return true
end

return Batch
