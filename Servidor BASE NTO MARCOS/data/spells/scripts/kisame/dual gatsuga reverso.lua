-- By Master Dino

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50.2, 1, -80.2, 1)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -800)
setConditionFormula(condition, -2.9, 0, -2.9, 0)
setCombatCondition(combat, condition)


local arr = {
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{ 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1},
{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)

if isPlayer(cid) and exhaustion.check(cid, 1200) then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(playerpos, 2)
return FALSE
end

exhaustion.set(cid, 1200, 1)
local pos1 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local pos2 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local pos3 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local pos4 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z}
local pos5 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z}
local pos6 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z}
local pos7 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y-2, z=getCreaturePosition(cid).z}
local pos8 = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y-3, z=getCreaturePosition(cid).z}
doSendMagicEffect(pos1, 160)
doSendMagicEffect(pos2, 160)
doSendMagicEffect(pos3, 160)
doSendMagicEffect(pos4, 160)
doSendMagicEffect(pos5, 160)
doSendMagicEffect(pos6, 160)
doSendMagicEffect(pos7, 160)
doSendMagicEffect(pos8, 160)
return doCombat(cid, combat, var)
end