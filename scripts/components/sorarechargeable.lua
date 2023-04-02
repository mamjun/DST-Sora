--[[-- Unofficial Rechargeable component
local Rechargeable = Class(function(self, inst)
	self.inst         = inst
	self.bonus        = 1.0 -- Percent
	self.rechargetime = 0
	self._remaining   = 0
	self.inst._task   = nil
end)

function Rechargeable:GetPercent()
	return (self.rechargetime - self._remaining) / self.rechargetime
end

-- bonus param must be in [0, 1] range
function Rechargeable:SetBonus(bonus)
	self.bonus = 1.0 + bonus
end

function Rechargeable:GetRechargeTime()
	return self.rechargetime
end

function Rechargeable:SetRechargeTime(rechargetime)
	self.rechargetime = rechargetime
end

local function Update(inst)
	if inst.components.rechargeable._remaining > 0 then
		inst.components.rechargeable._remaining = inst.components.rechargeable._remaining - (1 * inst.components.rechargeable.bonus)
	else
		inst._task:Cancel()
		inst.components.rechargeable._remaining = 0
		inst.components.aoetargeting:SetEnabled(true)
	end
end

function Rechargeable:Reset()
	self._remaining = self.rechargetime
	self.inst._task = self.inst:DoPeriodicTask(1, Update)
end

return Rechargeable--]]

--[[
本段代码来自Forced Forge mod。
]]

local Rechargeable = Class(function(self, inst)
	self.inst = inst
    inst.components.rechargeable = self
	self.recharge = 255
	self.rechargetime = -2
	self.maxrechargetime = 30
	self.cooldownrate = 1
	self.isready = true
	self.updatetask = nil
	self.onready = nil
	self.pickup = false
    self.inst:AddTag("rechargeable")
	self.onequip = function(inst, data)
        self:RecalculateRate()
    end
	-- when a player equips this weapon
	self.inst:ListenForEvent("equipped", function(inst, data)
		self.owner = data.owner
		self:RecalculateRate()
		-- check if less than 1 sec remaining on CD? then have a 1 sec equip?
		-- if not on cooldown, then add 1 sec equip CD
		if self.updatetask == nil then
			self.pickup = true
			self:StartRecharge()
		end
		-- when the player who equipped this wep equips/unequipes something else
		self.inst:ListenForEvent("equip", self.onequip, self.owner)
		self.inst:ListenForEvent("unequip", self.onequip, self.owner)
	end)
	-- when a player unequips this weapon
	self.inst:ListenForEvent("unequipped", function(inst, data)
		self.inst:RemoveEventCallback("equip", self.onequip, self.owner)
		self.inst:RemoveEventCallback("unequip", self.onequip, self.owner)
		-- if dropping it when 1 sec pickup cd active, remove it
		if self.pickup and self.updatetask ~= nil then
			self.pickup = false
			self.updatetask:Cancel()
			self.updatetask = nil
		end
		-- if dropped, then remove CDR bonuses
		self.cooldownrate = 1
		self.owner = nil
	end)
end)

function Rechargeable:GetCoolDownRate()
	local equips_rate = 1
	local owner = self.inst.components.inventoryitem:GetGrandOwner()
	if owner and owner.components.inventory then 
		for k,v in pairs(owner.components.inventory.equipslots) do 
			if v and v.components.equippable and v.components.equippable.cooldown_rate then 
				equips_rate = equips_rate * v.components.equippable.cooldown_rate
			end
		end
	end 
	return self.cooldownrate * equips_rate
end 

function Rechargeable:SetRechargeTime(rechargetime)
	self.maxrechargetime = rechargetime
end

function Rechargeable:SetOnReadyFn(fn)
	self.onready = fn
end
function Rechargeable:OnRemoveFromEntity()
    self.inst:RemoveTag("rechargeable")
end
function Rechargeable:RecalculateRate()
	if self.owner ~= nil then
		self.cooldownrate = 1--self.owner.components.buffable:ApplyStatBuffs({"cooldown"}, 1)
		-- if we still have a recharge going, need to update client info with new rechargetime
		if self.updatetask ~= nil then
			self.inst.replica.inventoryitem:SetChargeTime(self:GetRechargeTime())
		end
	end
end

function Rechargeable:FinishRecharge()
	if self.updatetask ~= nil then
		self.updatetask:Cancel()
		self.updatetask = nil
	end
	self.isready = true
    self.inst:AddTag("sorarecharready")
    self.inst:RemoveTag("sorarecharing")
	if self.inst.components.aoetargeting then
		self.inst.components.aoetargeting:SetEnabled(true)
	end
	if self.onready then
		self.onready(self.inst)
	end
	self.pickup = false
	self.recharge = 255
	self.inst:PushEvent("rechargechange", { percent = self.recharge and self.recharge / 180, overtime = false })
end

function Rechargeable:Update()
	self.recharge = self.recharge + 180 * FRAMES / (self.rechargetime * (self.pickup and 1 or self:GetCoolDownRate()))
	if self.recharge >= 180 then
		self:FinishRecharge()
	end
end

function Rechargeable:StartRecharge()
	self.isready = false
    self.inst:RemoveTag("sorarecharready")
    self.inst:AddTag("sorarecharing")
	if self.inst.components.aoetargeting then
		self.inst.components.aoetargeting:SetEnabled(false)
	end
	self.rechargetime = self.pickup and 1 or self.maxrechargetime
	self.recharge = 0
	self:RecalculateRate()
	self.inst:DoTaskInTime(0, function()
		self.inst.replica.inventoryitem:SetChargeTime(self:GetRechargeTime())
		self.inst:PushEvent("rechargechange", { percent = self.recharge and self.recharge / 180, overtime = false })
		self.updatetask = self.inst:DoPeriodicTask(FRAMES, function() self:Update() end)
	end)
end

function Rechargeable:GetPercent()
	return self.recharge and self.recharge / 180, false
end

function Rechargeable:GetRechargeTime()
	return (self.pickup and 1) or self.maxrechargetime * self:GetCoolDownRate()
end

function Rechargeable:GetDebugString()
    return string.format("recharge: %2.2f, rechargetime: %2.2f, cooldownrate: %2.2f", self.recharge, self:GetRechargeTime(), self.cooldownrate)
end

return Rechargeable