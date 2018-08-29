local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 221)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 47)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -80.4, 1, -80.5, 1)

arr = {
{0, 0, 0},
{1, 3, 0},
{0, 0, 0}
}

local area = createCombatArea(arr)
setCombatArea(combat, area)


function onCastSpell(cid, var)

local waittime = 1 -- Tempo de exhaustion
local storage = 115824

if isPlayer(cid) and exhaustion.check(cid, storage) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

exhaustion.set(cid, storage, waittime)
return doCombat(cid, combat, var)
end