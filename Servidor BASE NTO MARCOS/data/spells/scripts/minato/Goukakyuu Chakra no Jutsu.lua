local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 250)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 32)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -60.4, 1, -60.5, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 250)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 32)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -60.4, 1, -60.5, 1)

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

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

local area2 = createCombatArea(arr2)
setCombatArea(combat2, area2)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end
 
function onCastSpell(cid, var)

local waittime = 1 -- Tempo de exhaustion
local storage = 15288

if exhaustion.check(cid, storage) then
return false
end

exhaustion.set(cid, storage, waittime)
local parameters = { cid = cid, var = var}
local position = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
addEvent(onCastSpell1, 200, parameters)
addEvent(onCastSpell2, 400, parameters)
return TRUE
end 