local npcId = 400012 

local function OnSpawn(event, creature) 
	local function OnSpawn(event, creature) 
	creature:SendUnitYell("Patchqwerk make Lich King proud! You die now!",0)  
	creature:SetMaxHealth(46664000)
end
end

local function PoisonBoltVolley(eventId, delay, calls, creature) 
    creature:CastSpell(creature:GetVictim(), 40095, true)
end

local function CastHatefulStrike(eventId, delay, calls, creature) 
    creature:CastSpell(creature:GetVictim(), 28308, true)
end

local function CastGore(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 48130, true)
end

local function OnEnterCombat(event, creature, target) 
	local yellOptions = { "Patchqwerk huuuuungry!", "Time for a snack!", "You're mine now!", "You look delicious. Patchqwerk eat you now!", "I not eat in days, time to feast!", "Me smash and eat you now!", "Me so hungry, me eat anything... even you!" }
	local randomIndex = math.random(1, 7) 
	local selectedYell = yellOptions[randomIndex] --script pulls one dialogue option from above upon entering combat.
	creature:SendUnitYell(selectedYell, 0)
	creature:RegisterEvent(PoisonBoltVolley, 10000, 0) --The 0 in creature:RegisterEvent(PoisonBoltVolley, 10000, 0) is the number of times the event will be called. In this case, 0 means the event will be called an unlimited number of times until the creature is killed or leaves combat. If you set it to 1, for example, the event will only be called once and then stop.
	creature:RegisterEvent(CastHatefulStrike, 15000, 0)
	creature:RegisterEvent(CastGore, 20000, 0)
end
	
local function OnLeaveCombat(event, creature) --Stuff the creature will do upon leaving combat, in this case yell
	local yellOptions = { "You not so tasty afterall...", "I'll be back for seconds!", "No more play? Too bad...", "Maybe next time you'll taste better!","Me still hungry, come back later!","You not enough food, me go find more!" }
	local randomIndex = math.random(1, 6)
	local selectedYell = yellOptions[randomIndex]
	creature:SendUnitYell(selectedYell, 0)
	creature:RemoveEvents()
end

local function OnDied(event, creature, killer) --OnDied is a function that is triggered when the creature dies. Creature sends Yell and broadcast message. If the killer is a player, it sends a broadcast message to the player with the text "You killed <creature name>!". The function also removes all registered events.
    creature:SendUnitYell("Patchqwerk forget to chew...", 0)
	if(killer:GetObjectType() == "Player") then
        killer:SendBroadcastMessage("You killed " ..creature:GetName().."!")
    end
    creature:RemoveEvents()
end

RegisterCreatureEvent(npcId, 1, OnEnterCombat) 
RegisterCreatureEvent(npcId, 2, OnLeaveCombat)
RegisterCreatureEvent(npcId, 4, OnDied)
RegisterCreatureEvent(npcId, 5, OnSpawn)

