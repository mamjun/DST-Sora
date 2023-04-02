--[[
授权级别:开放级
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
    --请提前一键global 然后 modimport导入
    --verion = 1.05
    --v1.05 更新 修复兼容性问题
    --v1.04 更新 兼容R20版本
    --v1.03 更新 增加了对 share_bigportrait_name和 FrameSymbol的支持
    --调用示例
    --乱动皮肤的后果自负！！！
    --[[
    MakeCharacterSkin("sora","sora_dress",{
        name = "连衣长裙",      --皮肤的显示名称
        des = "悠!快出來...\n你在哪儿?",        --选人界面的皮肤描述
        quotes = "悠......",
        rarity = "总之就是非常可爱",
        raritycorlor = {255/255,215/255,0/255,1},
        skins = {normal_skin = "sora_dress",ghost_skin = "ghost_sora_build"},
        skin_tags = {"BASE","sora","CHARACTER"},
        init_fn = function()  print("dress_init") end,
        clear_fn = function() print("dress_clear") end,
    })
    MakeItemSkinDefaultImage("cookpot","images/inventoryimages/sora2sword.xml","sora2sword")    --设置默认皮肤的制作栏贴图
    MakeItemSkin("cookpot","cookpot_portable",{
        name = "便携锅",
        atlas = "images/inventoryimages1.xml",
        image = "portablecookpot_item",
        build = "portable_cook_pot",
        bank = "portable_cook_pot",
        basebuild = "cook_pot",
        basebank = "cook_pot",
    })
    GetSkin("sora_dress")
    如果需要在prefab里调用
    先GLOBAL.SoraAPI = env
    然后在prefab文件里
    SoraAPI.MakeCharacterSkin(...)
    SoraAPI.MakeItemSkin(...)
    SoraAPI.GetSkin(name)
    --如果喜欢用  aaa_build配方来制作 aaa 之类的话
    请打开下面的开关 recipe_help
    
    ]]
    
    local recipe_help = true
    --人物皮肤API
    local characterskins = {}
    --[[格式 skinname = {
        打*的为必填项 反之不必须
                        base_prefab = base,
                        
                        *name = string or skinname   --皮肤的名称
                        des = string or "",         --皮肤界面的描述
                        quotes = string or nil      --选人界面的描述
                        rarity = string or "Loyal", --珍惜度 官方不存在的珍惜度则直接覆盖字符串
                        rarityorder = int or -1 --  --珍惜度的排序 用于按优先级排序 基本没啥用
                        raritycorlor = {R,G,B,A} or { 0.635, 0.769, 0.435, 1 }
                        
                        checkfn = function or nil,  检查是否拥有的 主要是客机自己执行 为空则默认拥有
                        checkclientfn = function or nil, 检查客户端是否拥有的 主要是主机执行 
                        init_fn = function or nil,   
                        clear_fn = function or nil,
                        share_bigportrait_name = string or nil,  --人物皮肤的背景图 大图
                        FrameSymbol = string or nil ,            --人物base皮肤的背景
                        *skins = {
                            normal_skin  = string or name,
                            ghost_skin   = string or name_ghost,
                        } or nil
                        
                        
                        --所有参数会顺传给返回的prefab
                            skintags = {} or nil, 皮肤的tag 用于过滤
                            assets = {} or nil,   皮肤用到的资源
                        --其他参数暂时用不到，需要的自己带进来吧，会自动传递官方的
                      }]]
                      
    local FrameSymbol = {}
    local skincharacters = {}
    --人物过滤
    local SKIN_AFFINITY_INFO = require("skin_affinity_info")
    function MakeCharacterSkin(base,skinname,data)
        --基于哪个人物的  皮肤名称 额外数据
        data.type = nil
        
        --标记一下是拥有皮肤的人物
        if not skincharacters[base] then
            skincharacters[base] = true
        end
        characterskins[skinname] = data
        data.base_prefab = base
        data.rarity = data.rarity or "Loyal" --默认珍惜度
        data.build_name_override = data.build_name_override or skinname
        --不存在的珍惜度 自动注册字符串
        if not STRINGS.UI.RARITY[data.rarity] then
            STRINGS.UI.RARITY[data.rarity] = data.rarity
            SKIN_RARITY_COLORS[data.rarity] = data.raritycorlor or { 0.635, 0.769, 0.435, 1 }
            RARITY_ORDER[data.rarity] = data.rarityorder or -1
            if data.FrameSymbol then
                FrameSymbol[data.rarity] = data.FrameSymbol
            end
        end
        --注册到字符串
        STRINGS.SKIN_NAMES[skinname] = data.name or skinname
        STRINGS.SKIN_DESCRIPTIONS[skinname] = data.des or ""
        STRINGS.SKIN_QUOTES[skinname] = data.quotes or ""
        --注册到皮肤列表
        if not PREFAB_SKINS[base] then PREFAB_SKINS[base] = {} end
        table.insert(PREFAB_SKINS[base],skinname)
        if not SKIN_AFFINITY_INFO[base] then SKIN_AFFINITY_INFO[base] = {} end
        table.insert(SKIN_AFFINITY_INFO[base],skinname)
        
        --创建皮肤预制物
        local prefab_skin = CreatePrefabSkin(skinname,data)
        if data.clear_fn then
            prefab_skin.clear_fn = data.clear_fn 
        end
        prefab_skin.type = "base"
        RegisterPrefabs(prefab_skin)    --注册并加载皮肤的prefab
        TheSim:LoadPrefabs({skinname})
        return prefab_skin
    end
    --物品皮肤
    local itemskins = {}
    --[[格式 skinname = {
        打*的为必填项 反之不必须
                    base = "",
                        *name = string or skinname   --皮肤的名称
                        des = string or "",         --皮肤界面的描述       好像没啥用
                        rarity = string or "Loyal", --珍惜度 官方不存在的珍惜度则直接覆盖字符串
                        rarityorder = int or -1 --      珍惜度的排序 好像没啥用
                        raritycorlor = {R,G,B,A} or { 0.635, 0.769, 0.435, 1 }  --珍惜度的颜色
                        atlas = string or nil,      --贴图xml
                        image = string or nil,        --贴图tex 不带.tex
                        --解决官方默认皮肤图标不搜索mod的问题  如果是 prefab和imagename名字一致的 建议用官方的 RegisterInventoryItemAtlas
                        bank    = string or nil,        --如果需要替换bank就传 不需要就不传
                        build   = string or skinname,   --如果需要替换build就传 不需要就默认和皮肤同名
                        anim    = string or nil,        --如果需要替换anim就传 不需要就不传
                        
                        basebank    = string or nil,        --如果替换了bank就传 不需要就不传
                        basebuild   = string or prefab,        --如果替换了build就传 不需要默认原prefab
                        baseanim    = string or nil,        --如果替换了anim就传 不需要就不传
                        
                        checkfn = function or nil,  检查是否拥有的 主要是客机自己执行 为空则默认拥有
                        checkclientfn = function or nil, 检查客户端是否拥有的 主要是主机执行 
                        initfn = function or nil,   
                        clearfn = function or nil,
                           
                        --所有参数会顺传给返回的prefab
                            skintags = {} or nil, 皮肤的tag 用于过滤
                            assets = {} or nil,   皮肤用到的资源
                        --其他参数暂时用不到，需要的自己带进来吧，会自动传递官方的
                        
                    }
    
    ]]
    local itembaseimage = {}
    function MakeItemSkinDefaultImage (base,atlas,image)
        itembaseimage[base] = { atlas,
                                    (image or base )..".tex",
                                  "default.tex"}
    end
    function MakeItemSkin(base,skinname,data)
        data.type = nil
        itemskins[skinname] = data
        data.base_prefab = base
        data.rarity = data.rarity or "Loyal" --默认珍惜度
        data.build_name_override = data.build_name_override or skinname
        --不存在的珍惜度 自动注册字符串
        if not STRINGS.UI.RARITY[data.rarity] then
            STRINGS.UI.RARITY[data.rarity] = data.rarity
            SKIN_RARITY_COLORS[data.rarity] = data.raritycorlor or { 0.635, 0.769, 0.435, 1 }
            RARITY_ORDER[data.rarity] = data.rarityorder or -1
            if data.FrameSymbol then
                FrameSymbol[data.rarity] = data.FrameSymbol
            end
        end
        --注册到字符串
        STRINGS.SKIN_NAMES[skinname] = data.name or skinname
        STRINGS.SKIN_DESCRIPTIONS[skinname] = data.des or ""
        if data.atlas and data.image then
            RegisterInventoryItemAtlas(data.atlas,data.image..".tex")
        end
        --注册到皮肤列表
        if not PREFAB_SKINS[base] then PREFAB_SKINS[base] = {} end
        table.insert(PREFAB_SKINS[base],skinname)
        if not PREFAB_SKINS_IDS[base] then
            PREFAB_SKINS_IDS[base] = {}
        end
        local index = 1
        for k,v in pairs(PREFAB_SKINS_IDS[base]) do
            index = index + 1
        end
        PREFAB_SKINS_IDS[base][skinname] = index
        --创建皮肤预制物
        data.skininit_fn = data.init_fn or nil
        data.skinclear_fn = data.clear_fn or nil
        data.init_fn  = function(i) basic_skininit_fn(i,skinname) end
        data.clear_fn  = function(i) basic_skinclear_fn(i,skinname) end 
        if data.skinpostfn  then
            data.skinpostfn(data)   --给一个玩家改init_fn的接口
        end
        local prefab_skin = CreatePrefabSkin(skinname,data)
        if data.clear_fn then
            prefab_skin.clear_fn = data.clear_fn 
        end

        prefab_skin.type = "item"
        RegisterPrefabs(prefab_skin)    --注册并加载皮肤的prefab
        TheSim:LoadPrefabs({skinname})
        return prefab_skin
    end
    
    
    
    
    
    --下面的可以不看
    
    
    
    --皮肤权限hook
    
	
	local mt = getmetatable(TheInventory)
    local oldTheInventoryCheckOwnership = TheInventory.CheckOwnership
	mt.__index.CheckOwnership  = function(i,name,...) 
        --print(i,name,...)
		if type(name)=="string" and (characterskins[name] or itemskins[name]) then
            if characterskins[name] and characterskins[name].checkfn then
                return characterskins[name].checkfn(i,name,...)
            elseif itemskins[name] and itemskins[name].checkfn then
                return itemskins[name].checkfn(i,name,...)
            else
                return true 
            end
		else
			return oldTheInventoryCheckOwnership(i,name,...)
		end
	end
	local oldTheInventoryCheckOwnershipGetLatest = TheInventory.CheckOwnershipGetLatest
    mt.__index.CheckOwnershipGetLatest  = function(i,name,...) 
        --print(i,name,...)
		if type(name)=="string" and (characterskins[name] or itemskins[name]) then
            if characterskins[name] and characterskins[name].checkfn then
                return characterskins[name].checkfn(i,name,...)
            elseif itemskins[name] and itemskins[name].checkfn then
                return itemskins[name].checkfn(i,name,...)
            else
                return true,0 
            end
		else
			return oldTheInventoryCheckOwnershipGetLatest(i,name,...)
		end
	end
    
	local oldTheInventoryCheckClientOwnership = TheInventory.CheckClientOwnership
	mt.__index.CheckClientOwnership  = function(i,userid,name,...) 
		if type(name)=="string"  and (characterskins[name] or itemskins[name]) then
			if characterskins[name] and characterskins[name].checkclientfn then
                return characterskins[name].checkclientfn(i,userid,name,...)
            elseif itemskins[name] and itemskins[name].checkclientfn then
                return itemskins[name].checkclientfn(i,userid,name,...)
            else
                return true 
            end
		else
			return oldTheInventoryCheckClientOwnership(i,userid,name,...)
		end
	end
	
	local oldExceptionArrays = GLOBAL.ExceptionArrays
	GLOBAL.ExceptionArrays = function(ta,tb,...)
			local need
			for i=1,100,1 do
				local data = debug.getinfo(i,"S")
				if data then
					if data.source and data.source:match("^scripts/networking.lua") then
						need = true
					end
				else
					break
				end
			end
			if need then
				local newt = oldExceptionArrays(ta,tb,...)
                for k,v in pairs(skincharacters) do
                    table.insert(newt,k)		--偷渡
                end
				return newt
			else
				return oldExceptionArrays(ta,tb,...)
			end
	end
    local oldIsDefaultCharacterSkin = IsDefaultCharacterSkin
    GLOBAL.IsDefaultCharacterSkin = function(item,...)
        if item and characterskins[item] then
            if characterskins[item].checkfn then
                return characterskins[item].checkfn(nil,item)
            else
                return true
            end
        else
        return oldIsDefaultCharacterSkin(item,...)
        end
    end
    local oldGetPortraitNameForItem = GetPortraitNameForItem
    GLOBAL.GetPortraitNameForItem = function(item)
        if item and characterskins[item] and characterskins[item].share_bigportrait_name then
            return characterskins[item].share_bigportrait_name
        end
        return oldGetPortraitNameForItem(item)
    end
    local oldGetFrameSymbolForRarity = GetFrameSymbolForRarity
    GLOBAL.GetFrameSymbolForRarity = function(item)

        return FrameSymbol[item] or  oldGetFrameSymbolForRarity(item)
    end
    --骗过皮肤面板，让他以为我们是官方人物
	local function sorabaseenable(self)
		if self.name == "LoadoutSelect" then		--加载LoadoutSelect之前
            for k,v in pairs(skincharacters) do
                if not table.contains(DST_CHARACTERLIST,k) then
                    table.insert(DST_CHARACTERLIST,k)
                end
            end
		elseif	self.name == "LoadoutRoot" then		--已经判断完have_base_option了  可以删了 哈哈
            for k,v in pairs(skincharacters) do
                if table.contains(DST_CHARACTERLIST,k) then
                    RemoveByValue(DST_CHARACTERLIST,k)
                end
            end
		end
	end
	AddClassPostConstruct("widgets/widget", sorabaseenable)
    AddSimPostInit(function()
    if not TheNet:IsOnlineMode() then
        local net = getmetatable(GLOBAL.TheNet)
        net.__index.IsOnlineMode = function(n,...) 
        return true end
    end
    end)
    --人物皮肤的init_fn 和 clear_fn
    AddComponentPostInit("skinner",function(self)
        local oldfn = self.SetSkinName
        if oldfn then
            function self.SetSkinName(s,skinname,...)
                local old = s.skin_name
                local new = skinname
                if characterskins[old] and characterskins[old].clear_fn then
                    characterskins[old].clear_fn(s.inst,old)
                end
                if characterskins[new] and characterskins[new].init_fn then
                    characterskins[new].init_fn(s.inst,new)
                end
                oldfn(s,skinname,...)
            end
        end
    end)

    AddClassPostConstruct("widgets/recipepopup",function(self)
        local oldfn = self.GetSkinOptions
        function self.GetSkinOptions(s,...)
            local ret = oldfn(s,...)
            if ret then
                if ret[1] and ret[1].image then
                    if s.recipe and s.recipe.product and itembaseimage[s.recipe.product] then    --存在则覆盖
                        ret[1].image = itembaseimage[s.recipe.product]
                    end
                end
                for k,v in pairs(s.skins_list)do
                    if ret[k+1] and ret[k+1].image and v and v.item and itemskins[v.item] and (itemskins[v.item].atlas or  itemskins[v.item].image ) then
                        
                        local image = itemskins[v.item].image or v.item..".tex"
                        if image:sub(-4) ~= ".tex" then
                            image = image..".tex"
                        end
                        local atlas = itemskins[v.item].atlas or GetInventoryItemAtlas(image)
                        ret[k+1].image = {atlas,image,"default.tex"}
                        
                    end
                end
            end
            return ret
        end
    end)
    
    local skinselector = require("widgets/redux/craftingmenu_skinselector")
    function hookskinselector(self)
        local oldfn = self.GetSkinOptions
        function self.GetSkinOptions(s,...)
            local ret = oldfn(s,...)
            if ret then
                if ret[1] and ret[1].image then
                    if s.recipe and s.recipe.product and itembaseimage[s.recipe.product] then    --存在则覆盖
                        ret[1].image = itembaseimage[s.recipe.product]
                    end
                end
                for k,v in pairs(s.skins_list)do
                    if ret[k+1] and ret[k+1].image and v and v.item and itemskins[v.item] and (itemskins[v.item].atlas or  itemskins[v.item].image ) then
                        local image = itemskins[v.item].image or v.item..".tex"
                        if image:sub(-4) ~= ".tex" then
                            image = image..".tex"
                        end
                        local atlas = itemskins[v.item].atlas or GetInventoryItemAtlas(image)
                        ret[k+1].image = {atlas,image,"default.tex"}
                        
                    end
                end
            end
            return ret
        end
    end
    hookskinselector(skinselector)
    local oldGetSkinInvIconName = GetSkinInvIconName
    GLOBAL.GetSkinInvIconName = function(item,...)
        if itemskins[item] and itemskins[item].image then
            local image = itemskins[item].image
            if image:sub(-4) == ".tex" then
                image = image:sub(1,-5)
            end
            return image
        end
        return oldGetSkinInvIconName(item,...)
    
    end
    
    --这是全局函数 所以可以放后面 在执行前定义好就行
    function basic_skininit_fn(inst,skinname)
        if inst.components.placer == nil and not TheWorld.ismastersim then
            return
        end
        local data = itemskins[skinname] 
        if not data then return end
        if data.bank then
            inst.AnimState:SetBank(data.bank)
        end
        inst.AnimState:SetBuild(data.build or skinname)
        if data.anim then
            inst.AnimState:PlayAnimation(data.anim)
        end
        if inst.components.inventoryitem ~= nil then
            inst.components.inventoryitem.atlasname = data.atlas or ("images/inventoryimages/"..skinname .. ".xml")
            inst.components.inventoryitem:ChangeImageName(data.image or skinname )
        end
        if data.skininit_fn then
            data.skininit_fn(inst,skinname)
        end
    end
    function basic_skinclear_fn(inst, skinname)    --默认认为 build 和prefab同名 不对的话自己改
        local prefab = inst.prefab or ""
        local data = itemskins[skinname] 
        if not data then return end
        if data.basebank then
            inst.AnimState:SetBank(data.basebank)
        end
        if data.baseanim then
            inst.AnimState:PlayAnimation(data.baseanim)
        end
        inst.AnimState:SetBuild(data.basebuild or prefab)
        if inst.components.inventoryitem ~= nil then
            inst.components.inventoryitem.atlasname = GetInventoryItemAtlas(prefab..".tex")
            inst.components.inventoryitem:ChangeImageName(prefab)
            
        end
        if itemskins[skinname].skinclear_fn then
            itemskins[skinname].skinclear_fn(inst,skinname)
        end
    end
    local oldSpawnPrefab = SpawnPrefab
    GLOBAL.SpawnPrefab = function(prefab,skin,skinid,userid,...)
        if itemskins[skin] then
            skinid = 0
        end
        return oldSpawnPrefab(prefab,skin,skinid,userid,...)
    end
    local oldReskinEntity = Sim.ReskinEntity
    Sim.ReskinEntity = function(sim,guid,oldskin,newskin,skinid,userid,...)
        local inst = Ents[guid]
        if oldskin and itemskins[oldskin] then
            itemskins[oldskin].clear_fn(inst) --清除旧皮肤的
        end
        local r = oldReskinEntity(sim,guid,oldskin,newskin,skinid,userid,...)
        if newskin and itemskins[newskin] then
            
            itemskins[newskin].init_fn(inst)
            inst.skinname = newskin
            inst.skin_id = 0
        end
        return r
    end
    if recipe_help then
        AddSimPostInit(function()
            for k,v in pairs(AllRecipes) do
                if v.product ~= v.name and PREFAB_SKINS[v.product] then
                    PREFAB_SKINS[v.name]      = PREFAB_SKINS[v.product]
                    PREFAB_SKINS_IDS[v.name]  = PREFAB_SKINS_IDS[v.product]
                end
            end
        end)
    end
    function GetSkin(name)
        return characterskins[name] or itemskins[name] or nil
    end