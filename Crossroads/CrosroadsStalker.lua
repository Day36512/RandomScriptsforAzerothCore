local NPC_UNDEAD_ROGUE = 400114
local NPC_TARGET = 3338

local SPELL_SINISTER_STRIKE = 1752
local SPELL_EVASION = 5277
local SPELL_GOUGE = 12540
local SPELL_CAST_DEATH = 5

local function CastSinisterStrike(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), SPELL_SINISTER_STRIKE, false)
end

local function CastGouge(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), SPELL_GOUGE, false)
end

local function CastSpellOnTarget(creature, targetNPC)
    creature:CastSpell(targetNPC, SPELL_CAST_DEATH, true)
end

local function UndeadRogue_OnEnterCombat(event, creature, target)
    creature:RegisterEvent(CastSinisterStrike, math.random(4000, 6000), 0)
    creature:RegisterEvent(CastGouge, math.random(14000, 18000), 0)
    
    local targetNPC = creature:GetNearestCreature(50, NPC_TARGET)
    if targetNPC then
        CastSpellOnTarget(creature, targetNPC)
    end
end

local function UndeadRogue_OnLeaveCombat(event, creature)
    creature:RemoveEvents()
end

local function UndeadRogue_OnDamageTaken(event, creature, attacker, damage)
    local healthPct = creature:GetHealthPct()
    if healthPct <= 30 and not creature:HasAura(SPELL_EVASION) then
        creature:CastSpell(creature, SPELL_EVASION, true)
    end
end

local function UndeadRogue_OnDied(event, creature, killer)
    creature:RemoveEvents()
end

RegisterCreatureEvent(NPC_UNDEAD_ROGUE, 1, UndeadRogue_OnEnterCombat)
RegisterCreatureEvent(NPC_UNDEAD_ROGUE, 2, UndeadRogue_OnLeaveCombat)
RegisterCreatureEvent(NPC_UNDEAD_ROGUE, 4, UndeadRogue_OnDied)
RegisterCreatureEvent(NPC_UNDEAD_ROGUE, 9, UndeadRogue_OnDamageTaken)
