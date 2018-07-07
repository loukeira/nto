local combat_lv1 = createCombatObject()
setCombatParam(combat_lv1, COMBAT_PARAM_EFFECT, 197)
setCombatParam(combat_lv1, COMBAT_PARAM_CREATEITEM, 1497)

local combat_lv2 = createCombatObject()
setCombatParam(combat_lv2, COMBAT_PARAM_EFFECT, 197)
setCombatParam(combat_lv2, COMBAT_PARAM_CREATEITEM, 1497)

local combat_lv3 = createCombatObject()
setCombatParam(combat_lv3, COMBAT_PARAM_EFFECT, 197)
setCombatParam(combat_lv3, COMBAT_PARAM_CREATEITEM, 1497)

local area_lv1 = createCombatArea({
{1, 0, 1},
{0, 1, 0},
{0, 2, 0}
})

local area_lv2 = createCombatArea({
{0, 1, 0},
{1, 1, 1},
{0, 1, 0},
{0, 2, 0}
})

local area_lv3 = createCombatArea({
{1, 1, 1, 1, 1},
{0, 1, 1, 1, 0},
{0, 0, 1, 0, 0},
{0, 0, 2, 0, 0}
})

setCombatArea(combat_lv1, area_lv1)
setCombatArea(combat_lv2, area_lv2)
setCombatArea(combat_lv3, area_lv3)

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat_lv1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat_lv2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat_lv3, parameters.var)
end

function onCastSpell(cid, var)
local position = getCreaturePosition(cid)
local t = {
[0] = {x = position.x, y = position.y - 3, z = position.z},
[1] = {x = position.x + 3, y = position.y, z = position.z},
[2] = {x = position.x, y = position.y + 3, z = position.z},
[3] = {x = position.x - 3, y = position.y, z = position.z}
}
doSendDistanceShoot(position, t[getCreatureLookDirection(cid)], 37)

local parameters = { cid = cid, var = var}
local spell_storage = 42552

if getPlayerStorageValue(cid, spell_storage) < 50 then
addEvent(onCastSpell1, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 50 then
addEvent(onCastSpell2, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "Its barrier kindling progressed to level 2")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Spell UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 50 and getPlayerStorageValue(cid, spell_storage) < 150 then
addEvent(onCastSpell2, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 150 then
addEvent(onCastSpell3, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "Its barrier kindling progressed to level 3")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Spell UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 150 then
addEvent(onCastSpell3, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
end
return TRUE
end