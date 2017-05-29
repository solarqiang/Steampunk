local Widget = require "widgets/widget"
local HealthBadge = require "widgets/healthbadge"

local Sentinel_Health = Class(Widget, function(self, owner)
    Widget._ctor(self, "Status")
    self.owner = owner

    self.heart = self:AddChild(HealthBadge(owner))
    self.heart:SetPosition(-80,90,-150)
    self.heart:SetScale(0.6)

    self:FollowMouseConstrained()
    self:StartUpdating()
	self:UpdateValues()
end)

function Sentinel_Health:UpdateValues()
    self.heart:SetPercent(self.owner.components.health:GetPercent(), self.owner.components.health.maxhealth, self.owner.components.health:GetPenaltyPercent())
end

function Sentinel_Health:OnUpdate()

	local target = nil

	local ents = TheInput:GetAllEntitiesUnderMouse()
	for k,v in pairs(ents) do
		if v:HasTag("gear_sentinel") and v.Transform then
			target = v
			break
		end
	end
	
	if (target) then
		self:Show()
		self.owner = target
		local pos = TheInput:GetScreenPosition()
		self:UpdatePosition(pos.x, pos.y)
	else
		self.owner = GetPlayer()
		self:Hide()
	end
	
	self:UpdateValues()
end

function Sentinel_Health:UpdatePosition(x,y)
    self:SetPosition(x+75,y-10,0)
end

function Sentinel_Health:FollowMouseConstrained()
    if not self.followhandler then
        self.followhandler = TheInput:AddMoveHandler(function(x,y) self:UpdatePosition(x,y) end)
        local pos = TheInput:GetScreenPosition()
        self:UpdatePosition(pos.x, pos.y)
    end
end

function Sentinel_Health:HealthDelta(data)
	self.heart:SetPercent(data.newpercent, self.owner.components.health.maxhealth,self.owner.components.health:GetPenaltyPercent()) 
	
	if data.oldpercent > .33 and data.newpercent <= .33 then
		self.heart:StartWarning()
	else
		self.heart:StopWarning()
	end
	
	if not data.overtime then
		if data.newpercent > data.oldpercent then
			self.heart:PulseGreen()
			TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/health_up")
		elseif data.newpercent < data.oldpercent then
			TheFrontEnd:GetSound():PlaySound("dontstarve/HUD/health_down")
			self.heart:PulseRed()
		end
	end
end

return Sentinel_Health
