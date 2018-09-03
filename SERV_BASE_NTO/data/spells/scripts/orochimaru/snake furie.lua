local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 89)
setAttackFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 150, 1, 160, 1)

local area = createCombatArea( AREA_CIRCLE3X3, AREA_CIRCLE3X3)
setCombatArea(combat, area)

function onCastSpell(cid, var)
return doCombat(cid, combat, var)
end
