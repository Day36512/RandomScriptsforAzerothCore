local INVISIBLE_BUNNY_ENTRY = 400099
local SPELL_TO_CAST = 10001

local InvisibleBunny = {}

function InvisibleBunny.OnSpawn(event, creature)
    creature:RegisterEvent(InvisibleBunny.CastSpellRandomly, math.random(5000, 12000), 0)
end

function InvisibleBunny.CastSpellRandomly(event, delay, calls, creature)
    creature:CastSpell(creature, SPELL_TO_CAST, true)
    creature:RegisterEvent(InvisibleBunny.CastSpellRandomly, math.random(5000, 12000), 0)
end

RegisterCreatureEvent(INVISIBLE_BUNNY_ENTRY, 5, InvisibleBunny.OnSpawn) 
