local BoneSentinel = {};

local function CastShadowCleave(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 38226, true)
end

local function CastEarthquake(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 33919, true)
end

local function OnEnterCombat(event, creature, target)
    creature:RegisterEvent(CastShadowCleave, 5000, 0)
    creature:RegisterEvent(CastEarthquake, 12000, 0)
end

local function OnLeaveCombat(event, creature)
    creature:RemoveEvents()
end

local function OnDied(event, creature, killer)
    creature:RemoveEvents()
end

RegisterCreatureEvent(400036, 1, OnEnterCombat)
RegisterCreatureEvent(400036, 2, OnLeaveCombat)
RegisterCreatureEvent(400036, 4, OnDied)
