local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 66)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -80.9, 1, -100.0, 1)

function onCastSpell(cid, var)
local position2 = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
doSendMagicEffect(position2, 193)
return doCombat(cid, combat1, var)
end