local npcId = 400013

local function CastCleave(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 20677, true)
end

local function OnEnterCombat(event, creature, target)
	    creature:RegisterEvent(CastCleave, 5000, 0)
	end
	
local function OnLeaveCombat(event, creature)
    creature:RemoveEvents()
end

local function OnDied(event, creature, killer)
    creature:RemoveEvents()
end

RegisterCreatureEvent(npcId, 1, OnEnterCombat)
RegisterCreatureEvent(npcId, 2, OnLeaveCombat)
RegisterCreatureEvent(npcId, 4, OnDied)