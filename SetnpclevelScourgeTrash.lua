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


-- Function to cast spell ID 41236 on the creature and mask the level up spawning visual. this was really just for an event and can be removed
local function CastSpellOnSpawn(event, creature)
-- Set the creature's level to a random value between 25-30
local level = math.random(25, 30)
local originalLevel = creature:GetLevel()
creature:SetLevel(level)

if level < originalLevel then --modifies health of affected npcs by 3% per level. Adjust it to your liking.
creature:SetMaxHealth(creature:GetMaxHealth() * (1 - (originalLevel - level) * 0.03))
creature:SetHealth(creature:GetMaxHealth())
else
creature:SetMaxHealth(creature:GetMaxHealth() * (1 + (level - originalLevel) * 0.03))
creature:SetHealth(creature:GetMaxHealth())
end

creature:CastSpell(creature, 41236, true) --teleport visual
end

-- Register the function to be called on creature spawn event for each NPC ID
for i = 1, #npcIds do
RegisterCreatureEvent(npcIds[i], 5, CastSpellOnSpawn)
end
