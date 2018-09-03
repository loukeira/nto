local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 83)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50.2, 1, -80.2, 1)

function onCastSpell(cid, var)
return doCombat(cid, combat, var), setCooldown(cid, "rasen shuriken", 10)
end