local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 23)
setCombatParam(combat, COMBAT_PARAM_EFFECT1, 161)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 23)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -135.2, -135.2, -135.2, -135.2, 1, 1, 1.1, 1.1)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
