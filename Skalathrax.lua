local undeadDragon = {}

function undeadDragon.OnSpawn(event, creature)
creature:CanFly(true)
creature:SetDisableGravity(true)
creature:SetReactState(0)
creature:IsRegeneratingHealth(false)
creature:SendUnitYell("Your warm flesh will freeze under the shadow of my wings!", 0)
creature:PlayDirectSound(20429)
creature:CastSpell(creature, 100151, true)

creature:RegisterEvent(undeadDragon.CastSpell, 60000, 0)
creature:RegisterEvent(undeadDragon.CastSpell2, 20000, 0)
creature:RegisterEvent(undeadDragon.CastSpell3, 25000, 0)
creature:RegisterEvent(undeadDragon.CastSpell4, 30000, 0)
creature:RegisterEvent(undeadDragon.CastSpell5, 35000, 0)
end

function undeadDragon.OnLeaveCombat(event, creature)
creature:IsRegeneratingHealth(false)
end

function undeadDragon.CastSpell(event, delay, pCall, creature)
creature:CastSpell(creature, 100156, true)
end

function undeadDragon.CastSpell2(event, delay, pCall, creature)
creature:CastSpell(creature:GetVictim(), 200002, true)
end

function undeadDragon.CastSpell3(event, delay, pCall, creature)
creature:CastSpell(creature:GetVictim(), 200003, true)
end

function undeadDragon.CastSpell4(event, delay, pCall, creature)
creature:CastSpell(creature:GetRandomUnit(10), 200004, true)
end

function undeadDragon.CastSpell5(event, delay, pCall, creature)
creature:CastSpell(creature, 200005, true)
end

function undeadDragon.OnDeath(event, creature, killer)
creature:RemoveEvents()
end

RegisterCreatureEvent(400035, 5, undeadDragon.OnSpawn)
RegisterCreatureEvent(400035, 2, undeadDragon.OnLeaveCombat)
RegisterCreatureEvent(400035, 4, undeadDragon.OnDeath)