local UNDEAD_BUNNY_ENTRY = 400100
local SPELL_TO_CAST = 10000
local CAST_DELAY = 90000 -- 90 seconds in milliseconds

local UndeadBunny = {}

function UndeadBunny.OnSpawn(event, creature)
    creature:RegisterEvent(UndeadBunny.CastSpellAfterDelay, CAST_DELAY, 1)
end

function UndeadBunny.CastSpellAfterDelay(event, delay, calls, creature)
    creature:CastSpell(creature, SPELL_TO_CAST, true)
end

RegisterCreatureEvent(UNDEAD_BUNNY_ENTRY, 5, UndeadBunny.OnSpawn) 
