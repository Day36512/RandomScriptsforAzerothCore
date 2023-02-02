-- Table to store NPC IDs and original levels
local npcOrigLevels = {
  [400013] = 55,
  [400014] = 56,
  [68] = 57,
  [1976] = 58,
  [466] = 59,
}

-- Function to cast spell ID 100133 on the creature and update its level and health pool
local function CastSpellOnSpawn(event, creature)
  local npcId = creature:GetEntry()
  local originalLevel = npcOrigLevels[npcId]
  local newLevel = math.random(25, 30)
  local levelDifference = originalLevel - newLevel
  creature:SetLevel(newLevel)

  local originalHealth = creature:GetMaxHealth()
  local newHealth = originalHealth - (originalHealth * (levelDifference * 0.03))
  creature:SetMaxHealth(newHealth)
  creature:SetHealth(newHealth)
  creature:CastSpell(creature, 100133, true) --teleport visual. This is a custom spell so change it.
end

-- Register the function to be called on creature spawn event for each NPC ID
for npcId, originalLevel in pairs(npcOrigLevels) do
  RegisterCreatureEvent(npcId, 5, CastSpellOnSpawn)
end