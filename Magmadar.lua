local Magmadar = {}

local EMOTE_FRENZY = 0

local SPELL_FRENZY = 19451
local SPELL_MAGMA_SPIT = 19449
local SPELL_PANIC = 19408
local SPELL_LAVA_BOMB = 19411
local SPELL_LAVA_BOMB_EFFECT = 20494
local SPELL_LAVA_BOMB_RANGED = 20474
local SPELL_LAVA_BOMB_RANGED_EFFECT = 20495
local SPELL_SUMMON_CORE_HOUND = 364726

local EVENT_FRENZY = 1
local EVENT_PANIC = 2
local EVENT_LAVA_BOMB = 3
local EVENT_LAVA_BOMB_RANGED = 4
local EVENT_SUMMON_CORE_HOUND = 5

local MELEE_TARGET_LOOKUP_DIST = 10.0

function Magmadar.OnEnterCombat(event, creature, target)
creature:RegisterEvent(Magmadar.Frenzy, 8500, 0)
creature:RegisterEvent(Magmadar.Panic, 9500, 0)
creature:RegisterEvent(Magmadar.LavaBomb, 12000, 0)
creature:RegisterEvent(Magmadar.LavaBombRanged, 15000, 0)
end

function Magmadar.OnLeaveCombat(event, creature)
creature:RemoveEvents()
end

function Magmadar.OnDied(event, creature, killer)
creature:RemoveEvents()
end

function Magmadar.Frenzy(event, delay, calls, creature)
creature:CastSpell(creature, SPELL_FRENZY, true)
creature:PerformEmote(EMOTE_FRENZY)
creature:RegisterEvent(Magmadar.Frenzy, math.random(15000, 20000), 0)
end

function Magmadar.Panic(event, delay, calls, creature)
creature:CastSpell(creature:GetVictim(), SPELL_PANIC, true)
creature:RegisterEvent(Magmadar.Panic, math.random(31000, 38000), 0)
end

function Magmadar.LavaBomb(event, delay, calls, creature)
local targets = creature:GetAITargets()
local targetCount = creature:GetAITargetsCount()
if targetCount > 0 then
local targetIndex = math.random(1, targetCount)
local target = targets[targetIndex]
if target:GetDistance(creature) <= MELEE_TARGET_LOOKUP_DIST then
creature:CastSpell(target, SPELL_LAVA_BOMB, true)
end
end
creature:RegisterEvent(Magmadar.LavaBomb, math.random(12000, 15000), 0)
end

function Magmadar.LavaBombRanged(event, delay, calls, creature)
local targets = creature:GetPlayersInRange(100.0)
for _, target in pairs(targets) do
if target:GetDistance(creature) > MELEE_TARGET_LOOKUP_DIST then
creature:CastSpell(target, SPELL_LAVA_BOMB_RANGED, true)
break
end
end
creature:RegisterEvent(Magmadar.LavaBombRanged, math.random(12000, 15000), 0)
end

function Magmadar.CastSummonCoreHound(event, delay, calls, creature)
creature:CastSpell(creature, SPELL_SUMMON_CORE_HOUND, true)
creature:RegisterEvent(Magmadar.CastSummonCoreHound, 45000, 0)
end


function Magmadar.OnEnterCombat(event, creature, target)
creature:RegisterEvent(Magmadar.Frenzy, math.random(15000, 20000), 0)
creature:RegisterEvent(Magmadar.Panic, math.random(31000, 38000), 0)
creature:RegisterEvent(Magmadar.LavaBomb, math.random(12000, 15000), 0)
creature:RegisterEvent(Magmadar.LavaBombRanged, math.random(12000, 15000), 0)
creature:RegisterEvent(Magmadar.CastSummonCoreHound, 45000, 0)
end

function Magmadar.OnLeaveCombat(event, creature)
creature:RemoveEvents()
end

function Magmadar.OnDied(event, creature, killer)
creature:RemoveEvents()
end

RegisterCreatureEvent(11982, 1, Magmadar.OnEnterCombat)
RegisterCreatureEvent(11982, 2, Magmadar.OnLeaveCombat)
RegisterCreatureEvent(11982, 4, Magmadar.OnDied)