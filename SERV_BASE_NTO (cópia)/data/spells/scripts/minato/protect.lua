function onCastSpell(cid, var)
if getCreatureCondition(getCreatureMaster(cid), CONDITION_INFIGHT) == FALSE then
return true
end
local jogadorpos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local pos = getThingPos(target)
pos.x = pos.x + math.random(-1,1)
pos.y = pos.y + math.random(-1,1)



if target == isMonster or isCreature then
doTeleportThing(cid,pos)

doSendMagicEffect(jogadorpos, 211)
doSendMagicEffect(pos, 211)
doCreatureSay(cid,"Evasion", TALKTYPE_ORANGE_1)
else
doPlayerSendTextMessage(cid,20,'You can only use it on creatures')
end
end
