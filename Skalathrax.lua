local undeadDragon = {}

function undeadDragon.OnSpawn(event, creature)
creature:SetMaxHealth(4554119)
creature:CanFly(true)
creature:SetDisableGravity(true)
creature:SetReactState(0)
creature:SetRegeneratingHealth(false)
creature:SendUnitYell("Your warm flesh will freeze under the shadow of my wings!", 0)
creature:PlayDirectSound(20429)
creature:CastSpell(creature, 100151, true)
creature:CastSpell(creature, 17683, true)


creature:RegisterEvent(undeadDragon.CastSpell2, 20000, 0)
creature:RegisterEvent(undeadDragon.CastSpell3, 3500, 0)
creature:RegisterEvent(undeadDragon.CastSpell4, 10000, 0)
creature:RegisterEvent(undeadDragon.CastSpell5, 23000, 0)
creature:RegisterEvent(undeadDragon.CastSpell6, 45000, 0)
creature:RegisterEvent(undeadDragon.CastBlizzard, 4000, 0)
end

function undeadDragon.OnLeaveCombat(event, creature)
creature:SetRegeneratingHealth(false)
end

function undeadDragon.CastSpell2(event, delay, pCall, creature)
creature:CastSpell(creature:GetVictim(), 36741, true) --Frostbolt Volley
end

function undeadDragon.CastSpell3(event, delay, pCall, creature)
creature:CastSpell(creature:GetVictim(), 44614, true) --Frostfire. Make Custom
end

function undeadDragon.CastSpell4(event, delay, pCall, creature)
local targets = creature:GetAITargets()
local targetCount = #targets
for i = 1, math.min(2, targetCount) do
local target = targets[i]
creature:CastSpell(target, 71285, true) --Frozen Orb
end
end

function undeadDragon.CastSpell5(event, delay, pCall, creature)
local targets = creature:GetAITargets()
local targetCount = #targets
for i = 1, math.min(3, targetCount) do
local target = targets[i]
creature:CastSpell(target, 50635, true) --Freeze
end
end

function undeadDragon.CastSpell6(event, delay, pCall, creature)
creature:CastSpell(creature:GetVictim(), 364730, true) --Whelps
end

function undeadDragon.CastBlizzard(event, delay, pCall, creature)
  -- Get all creatures with NPC ID 400058 within 100 yards of the undead dragon
  local targets = creature:GetCreaturesInRange(100, 400058)
  if targets ~= nil then
    -- Pick 3 random targets from the list of creatures
    for i = 1, math.min(3, #targets) do
      local target = targets[math.random(1, #targets)]
      -- Cast Blizzard on the random target
      creature:CastSpell(target, 33634, true)
    end
  end
end

function undeadDragon.OnDeath(event, creature, killer)
creature:RemoveEvents()
end

RegisterCreatureEvent(400035, 5, undeadDragon.OnSpawn)
RegisterCreatureEvent(400035, 2, undeadDragon.OnLeaveCombat)
RegisterCreatureEvent(400035, 4, undeadDragon.OnDeath)