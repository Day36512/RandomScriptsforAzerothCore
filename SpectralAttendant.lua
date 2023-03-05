local SpectralAttendant = {}

function SpectralAttendant.OnSpawn(event, creature)
creature:SetMaxHealth(43240)
creature:CastSpell(creature, 17683, true)
end

function SpectralAttendant.OnEnterCombat(event, creature, target)
creature:RegisterEvent(SpectralAttendant.Immolate, 6000, 0)
creature:RegisterEvent(SpectralAttendant.Incinerate, 12000, 0)
creature:RegisterEvent(SpectralAttendant.AOEFear, 30000, 0)
reature:RegisterEvent(SpectralAttendant.Teleport, math.random(12000,16000), 0)
end

function SpectralAttendant.Immolate(eventId, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 11668, true)
end

function SpectralAttendant.Incinerate(eventId, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 29722, true)
end

function SpectralAttendant.AOEFear(eventId, delay, calls, creature)
creature:CastSpell(creature, 8122)
end

function SpectralAttendant.OnLeaveCombat(event, creature)
creature:RemoveEvents()
end

function SpectralAttendant.OnDied(event, creature, killer)
creature:RemoveEvents()
end

function SpectralAttendant.Teleport(eventId, delay, calls, creature)
local targets = creature:GetAITargets(10)
local target = targets[math.random(#targets)]
creature:CastSpell(target, 69904)
creature:ClearThreatList()
end

RegisterCreatureEvent(400052, 5, SpectralAttendant.OnSpawn)
RegisterCreatureEvent(400052, 1, SpectralAttendant.OnEnterCombat)
RegisterCreatureEvent(400052, 2, SpectralAttendant.OnLeaveCombat)
RegisterCreatureEvent(400052, 4, SpectralAttendant.OnDied)