local APriest = {};

local function CastSmite(eventId, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 48122, true)
end

local function CastHolyFire(eventId, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 48134, true)
end

local function CastSWP(eventId, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 27605, true)
end

local function CastHeal(eventId, delay, calls, creature)
local friendlyUnit = creature:GetRandomFriendlyUnit(5.0)
if friendlyUnit then
creature:CastSpell(friendlyUnit, 25314, true)
end
end

local function CastRenew(eventId, delay, calls, creature)
local friendlyUnit = creature:GetRandomFriendlyUnit(5.0)
if friendlyUnit then
creature:CastSpell(friendlyUnit, 25315, true)
end
end

local function OnEnterCombat(event, creature, target)
creature:RegisterEvent(CastSmite, 2600, 0)
creature:RegisterEvent(CastHolyFire, 5000, 0)
creature:RegisterEvent(CastSWP, 15000, 0)
creature:RegisterEvent(CastHeal, 10000, 0)
creature:RegisterEvent(CastRenew, 7000, 0)
end

local function OnLeaveCombat(event, creature)
creature:RemoveEvents()
end

local function OnDied(event, creature, killer)
creature:RemoveEvents()
end

RegisterCreatureEvent(400026, 1, OnEnterCombat)
RegisterCreatureEvent(400026, 2, OnLeaveCombat)
RegisterCreatureEvent(400026, 4, OnDied)