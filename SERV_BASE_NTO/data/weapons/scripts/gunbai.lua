local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 17)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 17)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -10.3, 1, -68.3, 1)

function onUseWeapon(cid, var)
return doCombat(cid, combat, var)
end