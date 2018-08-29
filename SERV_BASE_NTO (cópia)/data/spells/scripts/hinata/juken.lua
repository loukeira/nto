local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 1)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -3.3, 1, -3.2, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 1)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -5.9, 1, -5.8, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 1)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -2.9, 1, -2.2, 1)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 1)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -3.9, 1, -3.8, 1)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_DROWNDAMAGE)
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 42)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -2.1, 1, -3.2, 1)


arr1 = {
	{3}
}

arr2 = {
	{3}
}

arr3 = {
	{3}
}

arr4 = {
	{3}
}

arr5 = {
	{3}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
local area5 = createCombatArea(arr5)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
setCombatArea(combat5, area5)
 
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

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 400, parameters)
addEvent(onCastSpell3, 600, parameters)
addEvent(onCastSpell4, 800, parameters)
addEvent(onCastSpell5, 1000, parameters)
return TRUE
end 