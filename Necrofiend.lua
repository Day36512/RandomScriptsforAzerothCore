local Necrofiend = {}

function Necrofiend.OnEnterCombat(event, creature, target)
creature:RegisterEvent(Necrofiend.WebSpray, 15000, 0)
creature:RegisterEvent(Necrofiend.CastBanefulPoison, 7000, 0)
end

function Necrofiend.WebSpray(event, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 55508, true)
end

function Necrofiend.CastBanefulPoison(event, delay, calls, creature)
local targets = creature:GetAITargets(10)
local target = targets[math.random(#targets)]
creature:CastSpell(target, 15475, true)
end

function Necrofiend.OnLeaveCombat(event, creature)
creature:RemoveEvents()
end

function Necrofiend.OnDied(event, creature, killer)
creature:RemoveCorpse()
creature:RemoveEvents()
end

RegisterCreatureEvent(400055, 1, Necrofiend.OnEnterCombat)
RegisterCreatureEvent(400055, 2, Necrofiend.OnLeaveCombat)
RegisterCreatureEvent(400055, 4, Necrofiend.OnDied)