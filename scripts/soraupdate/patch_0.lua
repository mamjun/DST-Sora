local patches = { { name ="bancmd" ,version = 3,fn = function(data)
        local server_name = TheNet:GetServerName()
        if server_name:match("萤火之夜") then
            print("The",TheWorld,ThePlayer)
            if not TUNING.FLDEBUG then
                _G.ExecuteConsoleCommand = function () end
            end
        
        end
        return false,"success"
    end } ,{ name ="fixys" ,version = 9,fn = function(data)
        if TheWorld and TheWorld.ismastersim then
            TheWorld.FixYSTask=TheWorld:DoPeriodicTask(1,function(i)
                for k,v in pairs(AllPlayers) do
                    if v and v.components.combatstatus then
                        if v.components.combatstatus.clothing_base == ""  then
                            v.components.combatstatus.clothing_base = v.AnimState:GetBuild()
                        end
                    end
                end
            end)
        end
        if not TheNet:IsDedicated() then
            local  newupdateplayer  =function(self)
                    local combatstatus = TheWorld.ismastersim and self.owner.components.combatstatus or self.owner.replica.combatstatus
                    --在命之座界面不显示人物
                    if self.button_constellation.selected == true then
                        self.playeranim:Hide()
                    elseif self.playeranim.shown == false then
                        self.playeranim:Show()
                    end
                
                    --获取人物动画数据
                    local bank, animation, skin_mode, scale, y_offset = GetPlayerBadgeData(self.owner.prefab, false, false, false, false)
                    self.playeranim:GetAnimState():SetBank(bank)
                    self.defaultanim = bank == "ghost" and animation or "idle_loop"
                
                    --print(GetSkinModes(self.owner.prefab)[1].type)
                
                    --获取皮肤
                    local clothing = combatstatus and combatstatus:GetClothing() or {}
                
                    if clothing == nil or clothing.base == nil then
                        return
                    end
                    local base_build = string.find(clothing.base, "none") ~= nil and self.owner.AnimState:GetBuild() or clothing.base
                    --print(clothing.base)
                    --print(base_build)
                
                    --设置人物皮肤
                    if base_build == "" or self.last_basebuild == base_build then return end
                    self.last_basebuild = base_build
                    SetSkinsOnAnim(self.playeranim:GetAnimState(), self.owner.prefab, base_build, clothing, skin_mode)
            
            end
            if ThePlayer and ThePlayer.HUD.controls.property_main then
                ThePlayer.HUD.controls.property_main.UpdatePlayer  = newupdateplayer
            end
            local ui = require "widgets/property_main"
            ui.UpdatePlayer  = newupdateplayer
        end
        return false,"success"
    end } ,}
        local function try(t) 
            local allpatch = {}
            if U.TryToPatch then
                for k,v in ipairs(patches) do
                    currentpatch = v
                    allpatch[v.name]={U:TryToPatch(v.name,v.version,v.fn)}
                    currentpatch = {}
                end
            end
            return allpatch
        end
        return try