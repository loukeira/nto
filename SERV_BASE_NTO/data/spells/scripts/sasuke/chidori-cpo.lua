local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 138)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2, -17, -2, -30, 6, 6, 2.2, 2.8)

function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end
