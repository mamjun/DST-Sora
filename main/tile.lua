
local tiles = {
    flower = "cave"
}
local reg = {}
-- table.insert(Assets, Asset("IMAGE", "levels/tiles/map_edge.tex"))
-- table.insert(Assets, Asset("ATLAS", "levels/tiles/map_edge.xml"))
for k, v in pairs(tiles) do
    local name = "sora_tile_" .. k
    local turf = "sora_" .. k
    RegisterInventoryItemAtlas("images/inventoryimages/turf_" .. turf .. ".xml", "turf_"..turf .. ".tex")
    AddTile(name, "LAND", {
        name = name
    }, {
        name = v,
        noise_texture = name .. ".tex",
        runsound="dontstarve/movement/run_carpet",
        walksound="dontstarve/movement/walk_carpet",
        snowsound="dontstarve/movement/run_snow",
        mudsound = "dontstarve/movement/run_mud",
    }, {
        name =  "map_edge",
        noise_texture = "mini_" .. name .. ".tex"
    }, {
        name = turf,
        anim = 'idle',
        bank_build = "turf_"..turf
    }) 
    -- if not reg[v] then
    --     reg[v] = 1
    --     table.insert(Assets, Asset("IMAGE", "levels/tiles/" .. v .. ".tex"))
    --     table.insert(Assets, Asset("ATLAS", "levels/tiles/" .. v .. ".xml"))
    -- end
    table.insert(Assets, Asset("ATLAS", "images/inventoryimages/turf_"..turf .. ".xml"))
    table.insert(Assets, Asset("IMAGE", "images/inventoryimages/turf_"..turf .. ".tex"))
    ChangeTileRenderOrder(WORLD_TILES[name],WORLD_TILES.FOREST)
end

