local PatchWorkHorror = {};

local function AcidSpit(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 61597, true)
end

function CastPoisonCloud(eventId, delay, calls, creature)
local targets = creature:GetAITargets(10)
local target = targets[math.random(#targets)]
creature:CastSpell(target, 12766, true)
end

local function OnEnterCombat(event, creature, target)
	    creature:RegisterEvent(AcidSpit, 5000, 0)
		creature:RegisterEvent(CastPoisonCloud, 7000, 0)
	end
	
local function OnLeaveCombat(event, creature)
    creature:RemoveEvents()
end

local function OnDied(event, creature, killer)
    creature:RemoveEvents()
end

RegisterCreatureEvent(400050, 1, OnEnterCombat)
RegisterCreatureEvent(400050, 2, OnLeaveCombat)
RegisterCreatureEvent(400050, 4, OnDied)

