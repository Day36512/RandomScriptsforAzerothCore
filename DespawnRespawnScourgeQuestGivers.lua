local GAME_EVENT_ID = 17 -- Set the game event ID
local npcIds = {344, 12480, 1284, 400064, 234} -- Add your NPC entries here

local function DespawnAndRespawnNpcs(event, gameEventId)
    if gameEventId == GAME_EVENT_ID then
        local players = GetPlayersInWorld() -- Get all players in the world
        for _, player in ipairs(players) do
            for _, npcId in ipairs(npcIds) do
                local npcs = player:GetCreaturesInRange(1000, npcId) -- Get creatures within a radius of 1000 units from the player
                for _, npc in ipairs(npcs) do
                    npc:DespawnOrUnsummon()
                    npc:Respawn()
                end
            end
        end
    end
end

RegisterServerEvent(34, DespawnAndRespawnNpcs) -- Game Event Start
RegisterServerEvent(35, DespawnAndRespawnNpcs) -- Game Event End
