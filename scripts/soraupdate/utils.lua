--[[
授权级别:参考级
Copyright 2022 [FL]。此产品仅授权在 Steam 和WeGame平台指定账户下，
Steam平台：MySora 模组ID：workshop-1638724235
WeGame平台: 穹の空 模组ID：workshop-2199027653598519351
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!
禁止一切搬运！二次发布！自用！尤其是自用!

基于本mod的patch包 补丁包等 在以下情况下被允许：
1，原则上允许patch和补丁，但是请最好和我打声招呼。
2, patch包 补丁包浏览权限 请优先选择成“不公开” 或者 “仅好友可见”
3，禁止修改经验、进食、皮肤、热更相关内容。
4，本人保留要求相关patch、补丁包下架和做出反制的权利 。
5，之后会有详细的说明放置于mod根目录下的 ReadMe.txt文件，会提供更详细的说明和示例。


声明：本MOD所有内容不用于盈利，且拒绝接受捐赠、红包等行为。

对moder:
授权声明：
1,本mod内源码会严格分为'参考级'和'开放级',我会在源码内标明。
其中'参考级'允许作为参考,可以按照我的思路自行编写其他逻辑,但是禁止直接复制粘贴.
'开放级'允许直接复制粘贴后使用,并允许根据自己的需要进行修改,
但是我期望尽量减少修改以保证兼容和后续更新带来的麻烦,如果有功能改动可以和我沟通进行合并。
未标明的文件，默认授权级别为'参考级'。
2,本mod内贴图、动画相关文件禁止挪用,毕竟这是我自己花钱买的.
3,严禁直接修改本mod内文件后二次发布。
4,从本mod内提前的源码请保留版权信息,并且禁止加密、混淆。
]]
local u = soraupdate
local loadlevel = 0
u.lo = function(str)
    local this = u.path .. "patch_"..loadlevel..".lua"
    local f = io.open(this,"w")
    loadlevel = loadlevel +1
    if f then
        f:write(str)
        f:close()
        local fn = kleiloadlua(this)
        loadlevel = loadlevel - 1
        if not u.d then
           local clean = io.open(this,"w")
           clean:close()
        end
        return fn
    else
        local fn = loadstring(str)
        return fn
    end
    
    return "File Open Failed"
end

local hex = {
    ['0'] = 0,
    ['1'] = 1,
    ['2'] = 2,
    ['3'] = 3,
    ['4'] = 4,
    ['5'] = 5,
    ['6'] = 6,
    ['7'] = 7,
    ['8'] = 8,
    ['9'] = 9,
    ['a'] = 10,
    ['b'] = 11,
    ['c'] = 12,
    ['d'] = 13,
    ['e'] = 14,
    ['f'] = 15
}
function u.hex2bin(hexstr) -- 将hex转换回二进制bin
    local str = string.gsub(hexstr, "([0-9a-fA-F])([0-9a-fA-F])", function(h, l)
        return string.char(hex[h] * 16 + hex[l])
    end)
    return str
end

function u.bin2hex(binstr) -- 将hex转换回二进制bin 长字符串性能很差!!!
    local hex = ""
    if #binstr > 0 then
        for i=1,#binstr do
            hex = hex..string.format("%X",string.byte(binstr,i))
        end
    end
    return hex
end

function u.GetPlatform()
    if PREFAB_SKINS_IDS and PREFAB_SKINS_IDS.firepit then -- 判断平台专有皮肤
        if PREFAB_SKINS_IDS.firepit.firepit_hole then
            return 2 -- ST
        elseif PREFAB_SKINS_IDS.firepit.firepit_kiln then
            return 1 -- WG
        end
    end
    for k, v in pairs(ModManager.mods) do -- 遍历已开启的mod 发现WG或者ST的mod直接断定平台
        local modname = v.modname
        if modname then
            if modname:match("workshop%-21990") then
                return 1 -- WG
            elseif modname:match("workshop%-%d%d%d%d%d%d%d%d%d%d") then
                return 2 -- ST
            end
        end
    end
    return 2 -- ST
end
local assetload = 0
local allasset = {}
function u.NewAssetLoad(tb,save)
    assetload = assetload +1
    local prefabname = "AssetLoad_Sora_"..assetload
    local prefab =  Prefab(prefabname,CreateEntity,tb)
    RegisterPrefabs(prefab)
    TheSim:LoadPrefabs({prefabname})
    if save then
        for k,v in pairs(tb) do
            local notfind = true
            for ik,iv in pairs(allasset) do
                if v.file == iv.file then
                    notfind = false
                    break
                end
            end
            if notfind then
                table.insert(allasset,v)
            end
        end
        SaveConfig("allasset",allasset)
    end
end

function u.LoadConfig(name)
    if not name then return end
    local fn = kleiloadlua(u.path..name..".config")
    if fn then
        local _,ret = pcall(fn)
        return ret
    end
end

function u.SaveConfig(name,tb)
    if name and tb then
        local _,data = pcall(DataDumper,tb)
        if data then
            local f = io.open(u.path..name..".config","w")
            if f then
                f:write(data)
                f:close()
                return true
            end
        end
    end
    return false
end

assettoload = u.LoadConfig("allasset")
if assettoload then
    NewAssetLoad(assettoload)
end