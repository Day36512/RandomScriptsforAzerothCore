local Patchqwerk = {}

-- This function is called when Patchqwerk is spawned.
function Patchqwerk.OnSpawn(event, creature)
-- Sends a yell message ("Patchqwerk make Lich King proud! You die now!")
creature:SendUnitYell("Patchqwerk make Lich King proud! You die now!",0)
-- Casts spell 41924 on itself
creature:CastSpell(creature, 41924, true)
end

-- This function is called repeatedly every 7 seconds when Patchqwerk is in combat.
function Patchqwerk.PoisonBoltVolley(eventId, delay, calls, creature)
-- Casts spell 40095 on its current target
creature:CastSpell(creature:GetVictim(), 40095, true)
end

-- This function is called repeatedly every 15 seconds when Patchqwerk is in combat.
function Patchqwerk.CastHatefulStrike(eventId, delay, calls, creature)
-- Casts spell 28308 on its current target
creature:CastSpell(creature:GetVictim(), 28308, true)
end

-- This function is called repeatedly every 20 seconds when Patchqwerk is in combat.
function Patchqwerk.CastGore(eventId, delay, calls, creature)
-- Casts spell 48130 on its current target
creature:CastSpell(creature:GetVictim(), 48130, true)
end

-- This function is called when Patchqwerk enters combat.
function Patchqwerk.OnEnterCombat(event, creature, target)
-- Array of yell options
local yellOptions = { "Patchqwerk huuuuungry!", "Time for a snack!", "You're mine now!", "You look delicious. Patchqwerk eat you now!", "I not eat in days, time to feast!", "Me smash and eat you now!", "Me so hungry, me eat anything... even you!" }
-- Selects a random yell option
local randomIndex = math.random(1, 7)
local selectedYell = yellOptions[randomIndex]
-- Sends the selected yell message
creature:SendUnitYell(selectedYell, 0)
-- Registers the PoisonBoltVolley, CastHatefulStrike, and CastGore functions to be called repeatedly
creature:RegisterEvent(Patchqwerk.PoisonBoltVolley, 7000, 0)
creature:RegisterEvent(Patchqwerk.CastHatefulStrike, 15000, 0)
creature:RegisterEvent(Patchqwerk.CastGore, 20000, 0)
end

-- This function is called when Patchqwerk leaves combat.
function Patchqwerk.OnLeaveCombat(event, creature)
-- Array of yell options
local yellOptions = { "You not so tasty afterall...", "I be back for seconds!", "No more play? Too bad...", "Maybe next time you taste better!","Me still hungry, come back later!","You not enough food, me go find more!", "Aww...You no stay for dinner? You make Patchqwerk sad." }
-- Selects a random yell option
local randomIndex = math.random(1, 7)
local selectedYell = yellOptions[randomIndex]
-- Sends the selected yell message
creature:SendUnitYell(selectedYell, 0)
-- Removes any registered events
creature:RemoveEvents()
end

-- This function is called when Patchqwerk dies.
function Patchqwerk.OnDied(event, creature, killer)
-- Sends a yell message ("Patchqwerk forget to chew...")
creature:SendUnitYell("Patchqwerk forget to chew...", 0)
-- Sends a broadcast message to the player who killed Patchqwerk
if(killer:GetObjectType() == "Player") then
killer:SendBroadcastMessage("You killed " ..creature:GetName().."!")
end
-- Removes any registered events
creature:RemoveEvents()
end

-- This function is called repeatedly when Patchqwerk's health changes.
function Patchqwerk.CheckHealth(event, creature)
-- If its health drops below 20%,
if (creature:HealthBelowPct(20)) then
-- Sends a yell message ("Patchqwerk go berserk!")
creature:SendUnitYell("Patchqwerk go berserk!", 0)
-- Casts spell 41305
creature:CastSpell(creature, 41305, true)
-- If its health rises above 95%,
elseif (creature:HealthAbovePct(95)) then
-- Casts spell 41924
creature:CastSpell(creature, 41924, true)
end
end

-- Registers the functions to be called for various events
RegisterCreatureEvent(400012, 1, Patchqwerk.OnEnterCombat)
RegisterCreatureEvent(400012, 2, Patchqwerk.OnLeaveCombat)
RegisterCreatureEvent(400012, 4, Patchqwerk.OnDied)
RegisterCreatureEvent(400012, 5, Patchqwerk.OnSpawn)
RegisterCreatureEvent(400012, 6, Patchqwerk.CheckHealth)