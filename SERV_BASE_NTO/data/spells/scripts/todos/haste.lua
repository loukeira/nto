local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 184)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 33000)
setConditionFormula(condition, 0.3, -24, 0.3, -24)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end