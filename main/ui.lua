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
    local uianimbutton = require("widgets/uianimbutton")
    local widget= require("widgets/widget")
    --去除沙漠目镜的显示效果
   local function sorahat_Goggles_Disable(self,owner)
        local ToggleGoggles_old = self.ToggleGoggles
        self.ToggleGoggles = function(self, show, ...)
            ToggleGoggles_old(self, show, ...)
            if self.owner and self.owner.replica.inventory:EquipHasTag("soragoggles") then
            self.inst.entity:Hide(false)
            end
        end
    end
    AddClassPostConstruct("widgets/gogglesover", sorahat_Goggles_Disable)
    
    --左下角的经验的UI
	local SoraExp = require("widgets/soraexp")    

	local function AddControls(self)    
		if self.owner:HasTag("sora") then      
			self.SoraExp = self:AddChild(SoraExp(self.owner))
            SoraMakeWidgetMovable(self.SoraExp.expstr,"soraexp",Vector3(100,30,0))
            self.wikiroot = self:AddChild(widget("root"))
            self.SoraWiki = self.wikiroot:AddChild(uianimbutton("sorawiki","sorawiki","close","open","close","close","open")) 
            self.SoraWiki:SetTooltip("长按拖动\n双击空格重置\n长按等级隐藏")
            self.SoraWiki:SetTooltipPos(70, 0, 0)
            self.SoraWiki:SetScale(0.4,0.4,0.4)
            self.SoraWiki.cd =SoraCD(0.5)
            self.SoraWiki:SetOnClick(function()
                if not self.SoraWiki.cd() then
                    VisitURL("http://wikil.fl.lovetly.top/url.php?id=sora",false)
                end
            end)
            self.SoraWiki:SetOnDown(function() self.SoraWiki.cd()  end) --按下
            SoraMakeWidgetMovable(self.wikiroot,"sorawiki",Vector3(600,500,0))
            if not TUNING.SORAWIKI then
                self.SoraWiki:Hide()
            end
		end  
	end 
	AddClassPostConstruct("widgets/controls", AddControls) 
 

    --给容器组件添加一些事件
    local function containerwidgetapi(self)
        local oldOpen = self.Open
        self.Open = function(self,...)
            oldOpen(self,...)
            if self.container and self.container.replica.container then
                local widget = self.container.replica.container:GetWidget()
                if widget and widget.SoraOnOpenFn then 
                    widget.SoraOnOpenFn(self,...)
                end
            end
        end
        local oldClose = self.Close
        self.Close = function(self,...)
            if self.container and self.container.replica.container then
                local widget = self.container.replica.container:GetWidget()
                if widget and widget.SoraOnCloseFn then 
                    widget.SoraOnCloseFn(self,...)
                end
            end
            oldClose(self,...)
        end
        local oldRefresh = self.Refresh
        self.Refresh = function(self,...)
            oldRefresh(self,...)
            if self.container and self.container.replica.container then
                local widget = self.container.replica.container:GetWidget()
                if widget and widget.SoraOnRefreshFn then 
                    widget.SoraOnRefreshFn(self,...)
                end
            end
        end
    end
    AddClassPostConstruct("widgets/containerwidget", containerwidgetapi)

	--多层制作栏 开始处理
    
    MakeRecipeTabMul(skill,root)
    MakeRecipeTabMul(equip,root)
    MakeRecipeTabMul(equip2,root)
    MakeRecipeTabMul(item,root)
    MakeRecipeTabMul(build,root)
    MakeRecipeTabMul(soralight,build)
    MakeRecipeTabMul(DST,root)
    MakeRecipeTabMul(maker,root)
    
    MakeRecipeTabMul(itembuff,item)
    --MakeRecipeTabMul(DSTlight,DST)
