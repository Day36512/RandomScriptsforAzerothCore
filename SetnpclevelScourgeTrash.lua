-- Table to store NPC IDs
local npcIds = {
  -- Add NPC IDs here
  8541,
  10417,
  4475,
  11873,
  8531,
  11551,
  10488,
  10487,
  1788,
  10414,
  10407
}


local function CastSpellOnSpawn(event, creature)
  if not creature then
    print("Error: creature was not set!")
    return
  end

  local originalLevel = creature:GetLevel()
  local randomLevel = math.random(25, 30)
  local levelDiff = originalLevel - randomLevel

  creature:SetLevel(randomLevel)
  creature:SetMaxHealth(creature:GetMaxHealth() * (1 - levelDiff * 0.03))
  creature:SetHealth(creature:GetMaxHealth())
  creature:CastSpell(creature, 41236, true) --teleport visual
end

for _, npcId in ipairs(npcIds) do
  RegisterCreatureEvent(npcId, 5, CastSpellOnSpawn)
end
-- Register the function to be called on creature spawn event for each NPC ID
for i = 1, #npcIds do
RegisterCreatureEvent(npcIds[i], 5, CastSpellOnSpawn)
end
