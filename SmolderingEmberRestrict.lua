local ALLOWED_MAPS = {
0,
1,
}

local ALLOWED_SPELLS = {100150, 100160}

function table.indexOf(t, value)
for k, v in ipairs(t) do
if v == value then
return k
end
end
return -1
end

function OnPlayerCastSpell(event, player, spell)
local spellId = spell:GetEntry()
local mapId = player:GetMapId()

if table.indexOf(ALLOWED_SPELLS, spellId) ~= -1 then
    if table.indexOf(ALLOWED_MAPS, mapId) == -1 then
        spell:Cancel()
        player:SendBroadcastMessage("You cannot use that mount here.")
    else
        if spellId == 100150 then
            player:PlayDirectSound(20428)
        end
    end
end
end

RegisterPlayerEvent(5, OnPlayerCastSpell)