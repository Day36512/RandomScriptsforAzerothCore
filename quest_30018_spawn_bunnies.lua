local CREATURE_EVENT_ON_QUEST_ACCEPT = 31
local QUEST_ID = 30018
local CREATURE_SPAWNER = 400096
local BUNNY_ENTRY = 400099
local UNDEAD_BUNNY_ENTRY = 400100
local UNDEAD_WARLORD = 400101
local SPAWN_TYPE = 3
local DESPAWN_TIMER = 600000 -- 10 minutes in milliseconds
local CAST_SPELL_ID = 37679

local function DespawnCreatures(spawner)
    local spawnedCreatures = spawner:GetCreaturesInRange(100, {BUNNY_ENTRY, UNDEAD_BUNNY_ENTRY})
    for _, spawnedCreature in ipairs(spawnedCreatures) do
        spawnedCreature:DespawnOrUnsummon(100) -- Despawn with a 100 ms delay
    end
end

local function OnQuestAccept(event, player, creature, quest)
    if quest:GetId() == QUEST_ID then
        creature:SetReactState(0) -- Set react state to passive
        creature:CastSpell(creature, CAST_SPELL_ID, true) -- Cast the specified spell on self
        local x, y, z = creature:GetLocation()
        for i = 1, 5 do
            local randomX = x + math.random(-5, 5)
            local randomY = y + math.random(-5, 5)
            creature:SpawnCreature(BUNNY_ENTRY, randomX, randomY, z, SPAWN_TYPE, DESPAWN_TIMER)
        end
        local undeadX = x + math.random(-5, 5)
        local undeadY = y + math.random(-5, 5)
        creature:SpawnCreature(UNDEAD_BUNNY_ENTRY, undeadX, undeadY, z, SPAWN_TYPE, DESPAWN_TIMER)
    end
end

local function OnCreatureDeath(event, creature, killer)
    if creature:GetEntry() == UNDEAD_WARLORD then
        local spawner = creature:GetNearestCreature(100, CREATURE_SPAWNER)
        if spawner then
            DespawnCreatures(spawner)
            spawner:SetReactState(1) -- Set react state back to aggressive
            spawner:StopSpellCast(CAST_SPELL_ID) 
        end
    end
end

RegisterCreatureEvent(CREATURE_SPAWNER, CREATURE_EVENT_ON_QUEST_ACCEPT, OnQuestAccept)
RegisterCreatureEvent(UNDEAD_WARLORD, 4, OnCreatureDeath) -- 4 is the event for creature death
