local SWG_IDS = {68, 400033, 4034}
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
caster:KilledMonsterCredit(target:GetEntry())
end
end
end

RegisterPlayerEvent(5, OnSpellCast)