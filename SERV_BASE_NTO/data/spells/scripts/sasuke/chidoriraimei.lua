local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 42)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -100.2, 1, -100.2, 1)

function onCastSpell(cid, var)

if isPlayer(cid) and exhaustion.check(cid, 1) then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(playerpos, 2)
return FALSE
end

exhaustion.set(cid, 1, 1)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
local position2 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
doSendMagicEffect(position1, 20)
doSendMagicEffect(position2, 168)
return doCombat(cid, combat, var)
end
