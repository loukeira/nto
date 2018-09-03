local combat = createCombatObject()

local isattacking (trap)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 26)

setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -80.2, 1, -80.2, 1)


function onCastSpell(cid, var)


if getPlayerStorageValue(cid, 13255) < 0 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao possui o poder da nibi.")
return FALSE
end

local position1 = {x=getThingPosition(getCreatureTarget(cid)).x+1, y=getThingPosition(getCreatureTarget(cid)).y+1, z=getThingPosition(getCreatureTarget(cid)).z}

doSendMagicEffect(position1, 76)

return doCombat(cid, combat, var), setCooldown(cid, "Katon Bijuu Rasengan", 10)

end
