Magmakin = {}

function Magmakin.CastFlameBuffet(eventId, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 23189, true)
end

function Magmakin.CastMagmaBlast(eventId, delay, calls, creature)
local targets = creature:GetAITargets(10)
local target = targets[math.random(#targets)]
creature:CastSpell(target, 20565, true)
end

function Magmakin.CastLavaBurst(eventId, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 21158, true)
end

function Magmakin.OnEnterCombat(event, creature, target)
creature:RegisterEvent(Magmakin.CastFlameBuffet, 15000, 0)
creature:RegisterEvent(Magmakin.CastMagmaBlast, 16000, 0)
creature:RegisterEvent(Magmakin.CastLavaBurst, 8000, 0)
end

function Magmakin.OnLeaveCombat(event, creature)
creature:RemoveEvents()
end

function Magmakin.OnDied(event, creature, killer)
creature:RemoveEvents()
end

function Magmakin.OnSpawn(event, creature)
creature:SetMaxHealth(349000)
end

RegisterCreatureEvent(12806, 1, Magmakin.OnEnterCombat)
RegisterCreatureEvent(12806, 2, Magmakin.OnLeaveCombat)
RegisterCreatureEvent(12806, 4, Magmakin.OnDied)
RegisterCreatureEvent(12806, 5, Magmakin.OnSpawn)