local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_HEALING)

setCombatParam(combat, COMBAT_PARAM_EFFECT, 13)

setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, false)

setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE)

setHealingFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 1.5, 2)


function onCastSpell(summons, var)
	
return doCombat(summons, combat, var)

end
