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
如确实需要加密以保护其他文件,请额外放置一份 后缀为.lua.src 或者.txt的源代码。
]]
--免疫神话的丹药
-- AddComponentPostInit("container", function(self)
    -- if self.HasMkTag then
        -- local oldHasMkTag = self.HasMkTag
        -- self.HasMkTag = function(self,item,amount,...)
            -- if self and self.inst and self.inst:HasTag("sora") then
                -- return false,0
            -- end
            -- return oldHasMkTag(self,item,amount,...)
        -- end
    -- end
-- end)

-- AddComponentPostInit("inventory", function(self)
	-- if self.HasMkTag then
        -- local oldHasMkTag = self.HasMkTag
        -- self.HasMkTag = function(self,item,amount,...)
            -- if self and self.inst and self.inst:HasTag("sora") then
                -- return false,0
            -- end
            -- return oldHasMkTag(self,item,amount,...)
        -- end
    -- end
-- end)

--请勿擅自修改MOD名称
local BadMod = {
    "workshop-1829477822",
    "workshop-1870782128",
    "workshop-1830433072",
    "workshop-1976432245",
    "workshop-1820591093",
    "workshop-1800868708",
    "workshop-1687438493",
    "workshop-1674666887",
    "workshop-1674662490",
    "workshop-1615139219",
    "workshop-1624535534",
    "workshop-1632769407",
    "workshop-1654028208",
    "workshop-1656795580",
    "workshop-1668128860",
    "workshop-1668829945",
    "workshop-1669680112",
    "workshop-2199027653598521890",
    "workshop-2199027653598523249",
    "workshop-2199027653598523231",
    "workshop-2199027653598523248",
    "workshop-2199027653598524255",
    "workshop-2199027653598522108",--玉兔全制造版
    "workshop-2199027653598522336",--玉兔全制造版
    "workshop-2199027653598521298",--玉兔全制造版
}

local function Reset(s)
    ThePlayer:DoTaskInTime(s,function() DoRestart(true) end)
end
local function CheckMod(inst)
    local badstr 
    for k,v in pairs(ModManager.mods) do
        if k and v and v.modname and table.contains(BadMod,v.modname) then
            badstr = (badstr or "" )..string.format("%-20s %-s\n",v.modinfo.name,v.modinfo.author)
        end
    end
    if badstr then
        SoraPushPopupDialog("小穹的温馨提示","你可能是盗版作者的受害者\n请关闭以下MOD再试\n"..badstr,"断开连接",function() DoRestart(true) end)
    end
end


local function CheckName(inst)
    local fnname = debug.getinfo(1)
    if fnname and fnname.source and not TUNING.FLDEBUGCOMMAND then
        local src = fnname.source
        name = src:match("mods/([^\/]+)")
        if name == "workshop-2199027653598519351" or name == "workshop-2819945075" or name == "workshop-1638724235" then
            
        else
            Reset(10)
            SoraPushPopupDialog("小穹的温馨提示","请勿盗搬运MOD!!!","断开连接",function() DoRestart(true) end)
        end
    end
end

local function FuckGemCore()
    if rawget(_G,"gemrun") and not TheNet:IsDedicated() then
        (ThePlayer or TheWorld):DoTaskInTime(1,function()
         SoraPushPopupDialog("小穹的温馨提示","本MOD与GemCore/宝石核心存在已知严重冲突\n请关闭GemCore/宝石核心后再次游玩\n如果你是开启了全局暂停模组\n现在已经不需要了","退出游戏",function() DoRestart(true) end)
         end)
    end
end

local function Fuckjhbj()
    if IsModEnable("2199027653598511651") or IsModEnable("1279875294") then
        (ThePlayer or TheWorld):DoTaskInTime(1,function()
             SoraPushPopupDialog("小穹的温馨提示","您使用的\"几何布局\"MOD过老\n极易发生错误,建议更换新版本\n","退出游戏",function() DoRestart(true) end)
        end)
    end
end
local function CheckMoGu()
    if IsModEnable("蘑菇慕斯")  then
        local save = Config:Get("CheckMogu",0)
        if ((tonumber(save) or 0 )< os.time())then
           (ThePlayer or TheWorld):DoTaskInTime(1,function()
            SoraPushPopupDialog("小穹的温馨提示","你已经开启了<<蘑菇慕斯>>\n如发生崩溃或者bug\n请在关闭蘑菇慕斯后再试","我已了解",function() end)
                    Config:Set("CheckMogu",os.time()+24*3600*31)
            end)
        end
    end
end

local function CheckYou()
    if IsModEnable("32836506999") or IsModEnable("21990276535985458279") then
        (ThePlayer or TheWorld):DoTaskInTime(1,function()
             SoraPushPopupDialog("小穹的温馨提示","您使用的\"悠\"MOD和本mod存在已知冲突,请关闭任一mod后游玩\n","退出游戏",function() DoRestart(true) end)
        end)
    end
end

local function ConfigTip()
        local save = Config:Get("ConfigTip",0)
        if ((tonumber(save) or 0 )< os.time())then
           (ThePlayer or TheWorld):DoTaskInTime(1,function()
            SoraPushPopupDialog("小穹的温馨提示","UI重置,部分UI切换等功能已经移到\n物品栏右下角[审视自我]中的[穹妹配置]里","我已了解",function() end)
                   Config:Set("ConfigTip",os.time()+24*3600*31)
            end)
        end
end

local function ConfigTip()
        local save = Config:Get("ConfigTip2",0)
        if ((tonumber(save) or 0 )< os.time())then
           (ThePlayer or TheWorld):DoTaskInTime(1,function()
            SoraPushPopupDialog("小穹的温馨提示","由于最近更新问题,部分设置数据可能不正确,\n建议在模组设置里恢复默认再重新设置","我已了解",function() end)
                   Config:Set("ConfigTip2",os.time()+24*3600*31)
            end)
        end
end

local function CheckFuck()
    local match = {"主从不同步","无视服务器","别在意"}
    for k,v in pairs(ModManager.mods) do 
        if v and v.modinfo and v.modinfo.name then
            for i,word in ipairs(match) do
                if string.find(v.modinfo.name,word) then
                    local save = Config:Get("CheckFuck"..word,0)
                    if ((tonumber(save) or 0 )< os.time())then
                       (ThePlayer or TheWorld):DoTaskInTime(1,function()
                        SoraPushPopupDialog("小穹的温馨提示","你使用了忽视问题的MOD\n"..v.modinfo.name.."\n会导致各种奇怪bug\n开启后请勿反馈bug浪费作者时间\n后果自负！后果自负！后果自负！","我已了解",function() end)
                                Config:Set("CheckFuck"..word,os.time()+2*3600) --两小时内不再提示
                        end)
                    end
                    
                end
            end
        end
    end
end
local function CheckNamePostInit(self)
    ThePlayer:DoTaskInTime(1,CheckName)
    ThePlayer:DoTaskInTime(1.5,CheckFuck)
    ThePlayer:DoTaskInTime(1,CheckMod)
    ThePlayer:DoTaskInTime(2,Fuckjhbj)
    ThePlayer:DoTaskInTime(3,CheckYou)
    ThePlayer:DoTaskInTime(4,CheckMoGu)
    ThePlayer:DoTaskInTime(5,ConfigTip)
    ThePlayer:DoTaskInTime(6,ConfigTip6)
end
AddClassPostConstruct("widgets/controls", CheckNamePostInit) 


--For StoreRoom 一类的返鲜
AddPrefabPostInit("storeroom",function(inst)
    if not inst.components.preserver then
        inst:AddComponent("preserver")
        inst.components.preserver:SetPerishRateMultiplier(TUNING.PERISH_STOREROOM_MULT or 0)
    end

end)
local function nothing() end
AddLaterFn(function()
    for k,mod in pairs(ModManager.mods) do
        if mod.postinitfns and mod.postinitfns.ComponentPostInit and
            mod.postinitfns.ComponentPostInit.perishable then -- 地窖的
            for ik,fn in pairs(mod.postinitfns.ComponentPostInit.perishable) do
                local info = debug.getinfo(fn)
                if info and info.source and info.source:match("perishable/dst") then
                    mod.postinitfns.ComponentPostInit.perishable[ik] = nothing
                end
            end
        end
    
    end
end)