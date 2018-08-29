local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 24)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 251)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -8.3, 1, -58.3, 1)

local condition = createConditionObject(COMBAT_FORMULA_LEVELMAGIC, -8.3, 1, -58.3, 1)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 234)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 17)
setConditionParam(condition, CONDITION_PARAM_TICKS, 200000)
setCombatCondition(combat1, condition)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end