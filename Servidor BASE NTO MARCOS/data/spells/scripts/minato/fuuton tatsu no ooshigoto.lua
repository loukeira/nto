local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 2)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 200)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -40.4, 1, -40.5, 1)

arr1 = {
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 3, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1},
	{1, 1, 1, 1, 1, 1, 1}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
function onCastSpell(cid, var)

local waittime = 1 -- Tempo de exhaustion
local storage = 15288

if exhaustion.check(cid, storage) then
return false
end

local parameters = { cid = cid, var = var}
local position = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
addEvent(onCastSpell1, 200, parameters)
exhaustion.set(cid, storage, waittime)
return TRUE
end 