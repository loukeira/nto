-- By Master Dino

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -40.2, 1, -40.2, 1)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 5000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -1000)
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

local waittime = 5 -- Tempo de exhaustion
local storage = 115819

local pos = {
[1] = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z},
[2] = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z},
[3] = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z},
[4] = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z},
[5] = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z},
[6] = {x=getCreaturePosition(cid).x+7, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z}
}

if isPlayer(cid) and exhaustion.check(cid, storage) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

for i = 1, #pos do
doSendMagicEffect(pos[i], 160)
end

exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end