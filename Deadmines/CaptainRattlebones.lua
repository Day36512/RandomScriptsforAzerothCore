local NPC_CAPTAIN_RATTLEBONES = 400115

local SPELL_SHADOW_BOLT = 20791
local SPELL_CURSE_OF_THE_PIRATE_KING = 70542
local SPELL_PIRATES_CLEAVE = 40505
local SPELL_CANNONBALL_BARRAGE = 6251

local YELL_AGGRO_DIALOGUE = {
    "Ye be treadin' on dangerous waters!",
    "Yarr, ye landlubbers be meetin' yer doom!",
    "Arrr, ye won't leave me ship alive!",
    "I be sendin' ye to the depths of the sea!",
    "Ye be facin' the wrath of Captain Rattlebones!"
}

local YELL_DEATH_DIALOGUE = "Me ship...me crew...I be joinin' ye soon..."

local function CastShadowBolt(creature)
    creature:CastSpell(creature:GetVictim(), SPELL_SHADOW_BOLT, false)
end

local function CastCurseOfThePirateKing(creature)
    creature:CastSpell(creature:GetVictim(), SPELL_CURSE_OF_THE_PIRATE_KING, false)
end

local function CastPiratesCleave(creature)
    creature:CastSpell(creature:GetVictim(), SPELL_PIRATES_CLEAVE, false)
end

local function CastCannonballBarrage(creature)
    creature:CastSpell(creature:GetVictim(), SPELL_CANNONBALL_BARRAGE, false)
end

local function CaptainRattlebones_OnEnterCombat(event, creature, target)
    creature:SendUnitYell(YELL_AGGRO_DIALOGUE[math.random(1, #YELL_AGGRO_DIALOGUE)], 0)
    creature:RegisterEvent(CastShadowBolt, math.random(2000, 4000), 0)
    creature:RegisterEvent(CastCurseOfThePirateKing, math.random(10000, 15000), 0)
    creature:RegisterEvent(CastPiratesCleave, math.random(6000, 10000), 0)
    creature:RegisterEvent(CastCannonballBarrage, math.random(15000, 20000), 0)
end

local function CaptainRattlebones_OnLeaveCombat(event, creature)
    creature:RemoveEvents() -- Remove events when leaving combat
end

local function CaptainRattlebones_OnDied(event, creature, killer)
    creature:RemoveEvents() -- Remove events when died
    creature:SendUnitSay(YELL_DEATH_DIALOGUE, 0)
end

RegisterCreatureEvent(NPC_CAPTAIN_RATTLEBONES, 1, CaptainRattlebones_OnEnterCombat)
RegisterCreatureEvent(NPC_CAPTAIN_RATTLEBONES, 2, CaptainRattlebones_OnLeaveCombat)
RegisterCreatureEvent(NPC_CAPTAIN_RATTLEBONES, 4, CaptainRattlebones_OnDied)

