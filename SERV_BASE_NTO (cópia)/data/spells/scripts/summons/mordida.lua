local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_POISONDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 178)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -7, -70, -7, -75, 10, 10, 5.1, 5.5)

function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end