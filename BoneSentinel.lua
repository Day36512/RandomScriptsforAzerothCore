local BoneSentinel = {};
BoneSentinel.npcId = 400036

local function CastShadowCleave(eventId, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 38226, true)
end

local function CastEarthQuake(eventId, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), 33919, true)
end

local function CastBoneBarrier(eventId, delay, calls, creature)
creature:CastSpell(creature, 49222, true)
end

function BoneSentinel:OnSpawn(event, creature)
creature:CastSpell(creature, 49222, true)
creature:RegisterEvent(CastBoneBarrier, 35000, 0)
end

function BoneSentinel:OnEnterCombat(event, creature, target)
creature:RegisterEvent(CastShadowCleave, 7750, 0)
creature:RegisterEvent(CastEarthQuake, 35000, 0)
end

function BoneSentinel:OnLeaveCombat(event, creature)
-- Do not remove events
end

function BoneSentinel:OnDied(event, creature, killer)
creature:RemoveEvents()
end

RegisterCreatureEvent(BoneSentinel.npcId, 5, function(event, creature) BoneSentinel:OnSpawn(event, creature) end)
RegisterCreatureEvent(BoneSentinel.npcId, 1, function(event, creature) BoneSentinel:OnEnterCombat(event, creature) end)
RegisterCreatureEvent(BoneSentinel.npcId, 2, function(event, creature) BoneSentinel:OnLeaveCombat(event, creature) end)
RegisterCreatureEvent(BoneSentinel.npcId, 4, function(event, creature) BoneSentinel:OnDied(event, creature) end)