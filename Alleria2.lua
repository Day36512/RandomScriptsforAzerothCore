local Alleria = {};


local function CastRapidShot(eventId, delay, calls, creature)
local victim = creature:GetVictim()
creature:CastSpell(victim, 71251, true)
end

local function CastShoot(eventId, delay, calls, creature)
local victim = creature:GetVictim()
creature:CastSpell(victim, 39079, true)
end

local function CastMultiShot(eventId, delay, calls, creature)
local victim = creature:GetVictim()
creature:CastSpell(victim, 59713, false)
end

local function CastExplosiveShot(eventId, delay, calls, creature)
local victim = creature:GetVictim()
creature:CastSpell(victim, 60053, false)
end

local function CastBlackArrow(eventId, delay, calls, creature)
local victim = creature:GetVictim()
creature:CastSpell(victim, 63672, false)
end

local function CastDisengage(eventId, delay, calls, creature)
local victim = creature:GetVictim()
creature:CastSpell(victim, 57635, false)
end

local function CastFD(eventId, delay, calls, creature)
creature:CastSpell(creature, 23604, false)
end

local function CastRoot(eventId, delay, calls, creature)
local victim = creature:GetVictim()
creature:CastSpell(victim, 50762, false)
end

local function ForceDespawn(eventId, delay, calls, creature)
creature:DespawnOrUnsummon(1)
end

local function OnEnterCombat(event, creature, target)

creature:RegisterEvent(CastFD, 1, 1)
creature:RegisterEvent(CastRoot, 10300, 1)
creature:RegisterEvent(CastDisengage, 10400, 1)
creature:RegisterEvent(CastRapidShot, 7100, 0)
creature:RegisterEvent(CastMultiShot, 6100, 0)
creature:RegisterEvent(CastExplosiveShot, 6600, 0)
creature:RegisterEvent(CastBlackArrow, 15300, 0)
creature:RegisterEvent(CastShoot, 499, 0)
creature:RegisterEvent(ForceDespawn, 90000, 1)
end

local function OnLeaveCombat(event, creature)
creature:RemoveEvents()
end

local function OnDied(event, creature, killer)
creature:RemoveEvents()
end

RegisterCreatureEvent(400021, 1, OnEnterCombat)
RegisterCreatureEvent(400021, 2, OnLeaveCombat)
RegisterCreatureEvent(400021, 4, OnDied)
