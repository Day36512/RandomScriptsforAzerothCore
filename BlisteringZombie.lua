local BlisteringZombie = {};

local function CastSpit(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 25262, true)
end

local function OnEnterCombat(event, creature, target)
	    creature:RegisterEvent(CastSpit, 5000, 0)
	end
	
local function OnLeaveCombat(event, creature)
    creature:RemoveEvents()
end

local function OnDied(event, creature, killer)
    creature:RemoveEvents()
end

RegisterCreatureEvent(400029, 1, OnEnterCombat)
RegisterCreatureEvent(400029, 2, OnLeaveCombat)
RegisterCreatureEvent(400029, 4, OnDied)