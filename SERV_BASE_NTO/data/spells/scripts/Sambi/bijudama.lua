local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 47)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -80.2, 1, -80.2, 1)

function onCastSpell(cid, var)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 82)
return doCombat(cid, combat, var), setCooldown(cid, "Sanbi Ikaku Mizutama", 10)
end
