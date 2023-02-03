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
-- Table to store NPC IDs for CastSpellOnSpawn1
local npcIds1 = {
-- Add NPC IDs that will use CastSpellOnSpawn1 function here
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

-- Function to handle NPC spawn event for CastSpellOnSpawn1
local function CastSpellOnSpawn1(event, creature)
-- Check if the creature was set
if not creature then
print("Error: creature was not set!")
return
end

-- Get the original level of the creature
local originalLevel = creature:GetLevel()
-- Generate a random level between 25 and 30
local randomLevel = math.random(25, 30)
-- Calculate the level difference between original and random levels
local levelDiff = originalLevel - randomLevel

-- Set the level of the creature to the random level
creature:SetLevel(randomLevel)
-- Reduce the creature's max health by the level difference multiplied by 0.03
creature:SetMaxHealth(creature:GetMaxHealth() * (1 - levelDiff * 0.03))
-- Set the creature's health to its max health
creature:SetHealth(creature:GetMaxHealth())
-- Cast spell 41236 (teleport visual) on the creature
creature:CastSpell(creature, 41236, true)
end

-- Register CastSpellOnSpawn1 function to be called when an NPC with the specified NPC IDs is spawned
for _, npcId in ipairs(npcIds1) do
RegisterCreatureEvent(npcId, 5, CastSpellOnSpawn1)
end

-- Table to store NPC IDs for CastSpellOnSpawn2
local npcIds2 = {
-- Add NPC IDs that will use CastSpellOnSpawn2 function here
400013,
400014,
68,
1976,
466,
}

-- Function to handle NPC spawn event for CastSpellOnSpawn2
local function CastSpellOnSpawn2(event, creature)
-- Check if the creature was set
if not creature then
print("Error: creature was not set!")
return
end

-- Get the original level of the creature
local originalLevel = creature:GetLevel()
-- Generate a random level between 25 and 30
local randomLevel = math.random(25, 30)
-- Calculate the level difference between original and random levels
local levelDiff = originalLevel - randomLevel

-- Set the level of the creature to the random level
creature:SetLevel(randomLevel)
-- Reduce the creature's max health by the level difference multiplied by 0.03
creature:SetMaxHealth(creature:GetMaxHealth() * (1 - levelDiff * 0.03))
-- Set the creature's health to its max health
creature:SetHealth(creature:GetMaxHealth())
-- Cast spell 100133 (teleport visual) on the creature
creature:CastSpell(creature, 100133, true)
end

-- Register CastSpellOnSpawn2 function to be called when an NPC with the specified NPC IDs
