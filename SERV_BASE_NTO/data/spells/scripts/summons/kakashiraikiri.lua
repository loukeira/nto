local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 138)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 5, 5, 6, 12)

local area = createCombatArea(AREA_CROSS2X2)
setCombatArea(combat, area)

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end
