local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 197)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 47)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -20.4, 1, -20.5, 1)

arr1 = {
	{0, 0, 0},
	{1, 3, 1},
	{0, 0, 0}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
function onCastSpell(cid, var)
local parameters = { cid = cid, var = var}
local position = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, 95)
addEvent(onCastSpell1, 200, parameters)
return TRUE
end 