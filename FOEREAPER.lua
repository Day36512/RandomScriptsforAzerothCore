local npcId = 900003

local function CastTrample(eventId, delay, calls, creature)
    creature:CastSpell(creature:GetVictim(), 5568, true)
end

local function OnEnterCombat(event, creature, target)
	    creature:RegisterEvent(CastTrample, 5000, 0)
	end
	
local function OnLeaveCombat(event, creature)
    creature:SendUnitYell("Haha, you lose!", 0)
    creature:RemoveEvents()
end

local function OnDied(event, creature, killer)
    if(killer:GetObjectType() == "Player") then
        killer:SendBroadcastMessage("You killed " ..creature:GetName().."!")
    end
    creature:RemoveEvents()
end

RegisterCreatureEvent(npcId, 1, OnEnterCombat)
RegisterCreatureEvent(npcId, 2, OnLeaveCombat)
RegisterCreatureEvent(npcId, 4, OnDied)