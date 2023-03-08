local OrgArcher = {}

local function CastShoot(eventId, delay, calls, creature)
    local range = 200 -- set range to 200 yards
    local target = creature:GetNearestCreature(range, 400035) -- find nearest target within range
    if target ~= nil then
        creature:CastSpell(target, 37770, true) -- cast shoot on target
    end
end

local function CastSerpentSting(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 36984, true)
end

local function CastMultiShot(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 30990, true)
end

local function CastShootOnSpawn(event, creature)
    local range = 200 -- set range to 200 yards
    local target = creature:GetNearestCreature(range, 400035) -- find nearest target within range
    if target ~= nil then
        creature:CastSpell(target, 37770, true) -- cast shoot on target
    end
end

local function OnEnterCombat(event, creature, target)
    creature:RegisterEvent(CastShoot, 750, 0)
    creature:RegisterEvent(CastSerpentSting, 15000, 0)
    creature:RegisterEvent(CastMultiShot, 5000, 0)
end

local function OnLeaveCombat(event, creature)
    creature:RemoveEvents()
end

local function OnDied(event, creature, killer)
    creature:RemoveEvents()
end

RegisterCreatureEvent(400041, 1, OnEnterCombat)
RegisterCreatureEvent(400041, 2, OnLeaveCombat)
RegisterCreatureEvent(400041, 4, OnDied)

RegisterCreatureEvent(400035, 5, CastShootOnSpawn)
