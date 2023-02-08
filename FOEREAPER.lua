local FoeReaper = {};

local function CastTrample(eventId, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 5568, true)
end

function FoeReaper.OnEnterCombat(event, creature, target)
creature:RegisterEvent(CastTrample, 5000, 0)
end

function FoeReaper.OnLeaveCombat(event, creature)
creature:SendUnitYell("Haha, you lose!", 0)
creature:RemoveEvents()
end

function FoeReaper.OnDied(event, creature, killer)
if(killer:GetObjectType() == "Player") then
killer:SendBroadcastMessage("You killed " ..creature:GetName().."!")
end
creature:RemoveEvents()
end

function FoeReaper.OnSpawn(event, creature)
  creature:SendUnitYell("I'm baaaaaaaaack!!!", 0)
end

RegisterCreatureEvent(900003, 1, FoeReaper.OnEnterCombat)
RegisterCreatureEvent(900003, 2, FoeReaper.OnLeaveCombat)
RegisterCreatureEvent(900003, 4, FoeReaper.OnDied)
RegisterCreatureEvent(900003, 5, FoeReaper.OnSpawn)