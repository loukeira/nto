local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -20.4, 1, -20.5, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -20.1, 1, -20.6, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -20.4, 1, -20.5, 1)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -20.3, 1, -20.5, 1)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -20.3, 1, -20.5, 1)

local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat6, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, -20.3, 1, -20.5, 1)

local combat7 = createCombatObject()
setCombatParam(combat7, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat7, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat7, COMBAT_FORMULA_LEVELMAGIC, -20.3, 1, -20.5, 1)

local combat8 = createCombatObject()
setCombatParam(combat8, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat8, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat8, COMBAT_FORMULA_LEVELMAGIC, -20.3, 1, -20.5, 1)

local combat9 = createCombatObject()
setCombatParam(combat9, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat9, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat9, COMBAT_FORMULA_LEVELMAGIC, -20.3, 1, -20.5, 1)

local combat10 = createCombatObject()
setCombatParam(combat10, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat10, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat10, COMBAT_FORMULA_LEVELMAGIC, -20.3, 1, -20.5, 1)

local combat11 = createCombatObject()
setCombatParam(combat11, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat11, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat11, COMBAT_FORMULA_LEVELMAGIC, -20.3, 1, -20.5, 1)

local combat12 = createCombatObject()
setCombatParam(combat12, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat12, COMBAT_PARAM_DISTANCEEFFECT, 15)
setCombatFormula(combat12, COMBAT_FORMULA_LEVELMAGIC, -20.3, 1, -20.5, 1)

arr1 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}

arr2 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}

arr3 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}

arr4 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}
arr5 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}
arr6 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}
arr7 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}
arr8 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}
arr9 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}
arr10 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}
arr11 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}
arr12 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
local area6 = createCombatArea(arr6)
local area7 = createCombatArea(arr7)
local area8 = createCombatArea(arr8)
local area9 = createCombatArea(arr9)
local area10 = createCombatArea(arr10)
local area11 = createCombatArea(arr11)
local area12 = createCombatArea(arr12)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)
setCombatArea(combat6, area6)
setCombatArea(combat7, area7)
setCombatArea(combat8, area8)
setCombatArea(combat9, area9)
setCombatArea(combat10, area10)
setCombatArea(combat11, area11)
setCombatArea(combat12, area12)
 
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

local function onCastSpell7(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat7, parameters.var)
end

local function onCastSpell8(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat8, parameters.var)
end

local function onCastSpell9(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat9, parameters.var)
end

local function onCastSpell10(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat10, parameters.var)
end

local function onCastSpell11(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat11, parameters.var)
end

local function onCastSpell12(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat12, parameters.var)
end
 
function onCastSpell(cid, var)

local waittime = 2 -- Tempo de exhaustion
local storage = 115819

if isPlayer(cid) and exhaustion.check(cid, storage) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

local parameters = { cid = cid, var = var}
local position = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 400, parameters)
addEvent(onCastSpell3, 600, parameters)
addEvent(onCastSpell4, 800, parameters)
addEvent(onCastSpell5, 1200, parameters)
addEvent(onCastSpell6, 1500, parameters)
addEvent(onCastSpell7, 1800, parameters)
addEvent(onCastSpell8, 2100, parameters)
addEvent(onCastSpell9, 2400, parameters)
addEvent(onCastSpell10, 2700, parameters)
addEvent(onCastSpell11, 3000, parameters)
addEvent(onCastSpell12, 3300, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 