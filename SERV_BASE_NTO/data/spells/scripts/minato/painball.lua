local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 37)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -15.4, 1, -15.5, 1)

arr1 = {
	{0, 0, 0},
	{0, 3, 0},
	{0, 0, 0}
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
function onCastSpell(cid, var)

if isPlayer(cid) and exhaustion.check(cid, 12) then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(playerpos, 2)
return FALSE
end

exhaustion.set(cid, 12, 2)
local parameters = { cid = cid, var = var}
local position = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
addEvent(onCastSpell1, 200, parameters)
return TRUE
end 