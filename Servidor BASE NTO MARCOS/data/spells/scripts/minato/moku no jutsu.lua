local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 36)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 240)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -20.4, 1, -20.5, 1)

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

local waittime = 1 -- Tempo de exhaustion
local storage = 15858

if exhaustion.check(cid, storage) then
return false
end

exhaustion.set(cid, storage, waittime)
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 200, parameters)
doSendMagicEffect(position, 240)
return TRUE
end 