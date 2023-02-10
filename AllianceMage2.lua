local AMage = {};

local function CastFireball(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 38692, true)
end

local function OnEnterCombat(event, creature, target)
	    creature:RegisterEvent(CastFireball, 3600, 0)
	end
	
local function OnLeaveCombat(event, creature)
    creature:RemoveEvents()
end

local function OnDied(event, creature, killer)
    creature:RemoveEvents()
end

RegisterCreatureEvent(400027, 1, OnEnterCombat)
RegisterCreatureEvent(400027, 2, OnLeaveCombat)
RegisterCreatureEvent(400027, 4, OnDied)