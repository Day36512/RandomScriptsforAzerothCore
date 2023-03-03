local SWG_IDS = {68, 400013, 400033, 400014, 1976}
local SPELL_ID = 100141

function OnSpellCast(event, caster, spell)
    local target = spell:GetTarget()
    if target and spell:GetEntry() == SPELL_ID then
        local isValidTarget = false
        for _, swgID in ipairs(SWG_IDS) do
            if target:GetEntry() == swgID then
                isValidTarget = true
                break
            end
        end
        if not isValidTarget then
            caster:SendBroadcastMessage("Invalid target for this spell.")
            spell:Cancel()
        else
            -- give kill credit to NPC ID 68
            caster:KilledMonsterCredit(68)
        end
    end
end

RegisterPlayerEvent(5, OnSpellCast)
