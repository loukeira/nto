local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 178)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -99999, 59999, -999996, 199992)

function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end