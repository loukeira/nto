local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 134)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -70.2, 1, -70.2, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 134)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.2, 1, -1.2, 1)


arr1 = {
	{1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 3, 1, 1},
	{1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1}
}

arr2 = {
	{1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 2, 0, 0},
	{0, 0, 0, 0, 0},
	{0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var)
local position1 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position2 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
local position3 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position4 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z}
local position5 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y-2, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
doSendMagicEffect(position1, 204)
doSendMagicEffect(position2, 204)
doSendMagicEffect(position3, 204)
doSendMagicEffect(position4, 204)
doSendMagicEffect(position5, 204)
return TRUE
end 