local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 21)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 134)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -12.4, 1, -13.5, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 22)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 134)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -11.1, 1, -12.6, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 214)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -11.4, 1, -13.5, 1)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 214)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -12.3, 1, -12.5, 1)


arr1 = {
	{3}
}

arr2 = {
	{3}
}

arr3 = {
	{1, 1, 1},
	{1, 3, 1},
	{1, 1, 1}
}

arr4 = {
	{3}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat4, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 600, parameters)
addEvent(onCastSpell3, 1000, parameters)
addEvent(onCastSpell4, 1400, parameters)
doSendMagicEffect(position, 213)
return TRUE
end 