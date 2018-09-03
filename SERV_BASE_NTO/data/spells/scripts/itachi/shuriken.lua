local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 1)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 199)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -6.4, 1, -6.5, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 33)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 42)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -6.1, 1, -6.6, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 42)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 4)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -6.4, 1, -6.5, 1)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 22)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -6.3, 1, -6.5, 1)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 199)
setCombatParam(combat5, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -6.3, 1, -6.5, 1)

local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat6, COMBAT_PARAM_EFFECT, 214)
setCombatParam(combat6, COMBAT_PARAM_DISTANCEEFFECT, 1)
setCombatFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, -6.3, 1, -6.5, 1)


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

arr5 = {
	{1, 1, 1},
	{1, 3, 1},
	{1, 1, 1}
}

arr6 = {
	{1, 1, 1},
	{1, 3, 1},
	{1, 1, 1}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
local area6 = createCombatArea(arr6)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)
setCombatArea(combat6, area6)
 
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

local function onCastSpell5(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat5, parameters.var)
end

local function onCastSpell6(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat6, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 400, parameters)
addEvent(onCastSpell3, 600, parameters)
addEvent(onCastSpell4, 800, parameters)
addEvent(onCastSpell5, 1000, parameters)
addEvent(onCastSpell6, 1200, parameters)
doSendMagicEffect(position, 213)
return TRUE
end 