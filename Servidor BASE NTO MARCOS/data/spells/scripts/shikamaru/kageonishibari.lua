local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 206)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -120.2, 1, -120.2, 1)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
--setConditionParam(condition, CONDITION_PARAM_SPEED, -200)
setConditionFormula(condition, -0.9, 0, -0.9, 0)
setCombatCondition(combat1, condition)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 206)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -120.2, 1, -120.2, 1)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
--setConditionParam(condition, CONDITION_PARAM_SPEED, -200)
setConditionFormula(condition, -0.9, 0, -0.9, 0)
setCombatCondition(combat2, condition)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 206)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -120.2, 1, -120.2, 1)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
--setConditionParam(condition, CONDITION_PARAM_SPEED, -200)
setConditionFormula(condition, -0.9, 0, -0.9, 0)
setCombatCondition(combat3, condition)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 206)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -120.2, 1, -120.2, 1)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
--setConditionParam(condition, CONDITION_PARAM_SPEED, -200)
setConditionFormula(condition, -0.9, 0, -0.9, 0)
setCombatCondition(combat4, condition)


arr1 = {
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{1, 1, 0, 0, 0, 2, 0, 0, 0, 1, 1},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}

arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 2, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
}

arr4 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 3, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
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
local waittime = 1 -- Tempo de exhaustion
local storage = 158585

if exhaustion.check(cid, storage) then
return false
end

exhaustion.set(cid, storage, waittime)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 400, parameters)
addEvent(onCastSpell3, 600, parameters)
addEvent(onCastSpell4, 900, parameters)
return TRUE
end