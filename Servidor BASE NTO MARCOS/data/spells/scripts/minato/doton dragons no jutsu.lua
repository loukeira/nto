local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 92)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 92)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 92)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 92)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -100.3, 1, -162.3, 1)


arr1 = {
{0, 0, 1},
{0, 2, 0},
{1, 0, 1},
}

arr2 = {
{1, 0, 0},
{1, 2, 0},
{0, 1, 0},
}

arr3 = {
{0, 1, 1},
{0, 2, 1},
{0, 0, 0},
}

arr4 = {
{1, 0, 0},
{0, 2, 0},
{1, 1, 0},
}

arr5 = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1},
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
return isCreature(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat4, parameters.var)
end

local function onCastSpell5(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat5, parameters.var)
end

function onCastSpell(cid, var)
local waittime = 1 -- Tempo de exhaustion
local storage = 15858

if exhaustion.check(cid, storage) then
return false
end

exhaustion.set(cid, storage, waittime)
local parameters = {cid = cid, var = var}
addEvent(onCastSpell5, 10, parameters)
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 400, parameters)
addEvent(onCastSpell3, 600, parameters)
addEvent(onCastSpell4, 900, parameters)
return TRUE
end