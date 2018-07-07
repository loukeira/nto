local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 77)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -90.2, 1, -90.2, 1)

function onCastSpell(cid, var)
return doCombat(cid, combat, var), setCooldown(cid, "rasen shuriken", 10)
end