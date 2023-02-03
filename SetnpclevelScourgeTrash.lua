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

-- Function to cast spell ID 28234 on the creature and mask the level up spawning visual. this was really just for an event and can be removed
local function CastSpellOnSpawn(event, creature)
  -- Set the creature's level to a random value between whatever, in this case 25-30
  local level = math.random(25, 30)
  creature:SetLevel(level)
  
  creature:SetMaxHealth(creature:GetMaxHealth() * level / creature:GetLevel())
  creature:SetHealth(creature:GetMaxHealth())
  creature:CastSpell(creature, 28234, true)
end

-- Register the function to be called on creature spawn event for each NPC ID
for _, npcId in ipairs(npcIds) do
  RegisterCreatureEvent(npcId, 5, CastSpellOnSpawn)
end
