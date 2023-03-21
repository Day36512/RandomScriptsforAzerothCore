local NPC_SUTURES = 400113

local SPELL_CLEAVE = 15496
local SPELL_DISEASE_CLOUD = 30122
local SPELL_ABOMINATION_SLAM = 40546

local YELL_COMBAT_DIALOGUE = {
    "Sutures smash!",
    "Me make you hurt!",
    "You not escape Sutures!",
    "Why you bother Sutures?",
    "Sutures crush you!"
}

local function CastCleave(creature)
    creature:CastSpell(creature:GetVictim(), SPELL_CLEAVE, false)
end

local function CastDiseaseCloud(creature)
    creature:CastSpell(creature:GetVictim(), SPELL_DISEASE_CLOUD, false)
end

local function CastAbominationSlam(creature)
    creature:CastSpell(creature:GetVictim(), SPELL_ABOMINATION_SLAM, false)
end

local function Sutures_OnEnterCombat(event, creature, target)
    if math.random(1, 100) <= 50 then -- 50% chance to yell upon entering combat
        creature:SendUnitYell(YELL_COMBAT_DIALOGUE[math.random(1, #YELL_COMBAT_DIALOGUE)], 0)
    end
    creature:RegisterEvent(CastCleave, math.random(4000, 8000), 0)
    creature:RegisterEvent(CastDiseaseCloud, math.random(10000, 15000), 0)
    creature:RegisterEvent(CastAbominationSlam, math.random(8000, 12000), 0)
end

local function Sutures_OnLeaveCombat(event, creature)
    creature:RemoveEvents() -- Remove events when leaving combat
end

local function Sutures_OnDied(event, creature, killer)
    creature:RemoveEvents() -- Remove events when died
    creature:SendUnitSay("Sutures...fall...", 0)
end

RegisterCreatureEvent(NPC_SUTURES, 1, Sutures_OnEnterCombat)
RegisterCreatureEvent(NPC_SUTURES, 2, Sutures_OnLeaveCombat)
RegisterCreatureEvent(NPC_SUTURES, 4, Sutures_OnDied)
