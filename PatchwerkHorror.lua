local PatchWorkHorror = {};

local function AcidSpit(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 61597, true)
end

function CastBludgeoningStrike(eventId, delay, calls, creature)
local targets = creature:GetAITargets(10)
local target = targets[math.random(#targets)]
creature:CastSpell(target, 60870, true)
end

local function OnEnterCombat(event, creature, target)
	    creature:RegisterEvent(AcidSpit, 7000, 0)
		creature:RegisterEvent(CastBludgeoningStrike, 14000, 0)
	end
	
local function OnLeaveCombat(event, creature)
    creature:RemoveEvents()
end

local function OnDied(event, creature, killer)
	creature:RemoveCorpse()
    creature:RemoveEvents()
end

RegisterCreatureEvent(400054, 1, OnEnterCombat)
RegisterCreatureEvent(400054, 2, OnLeaveCombat)
RegisterCreatureEvent(400054, 4, OnDied)

