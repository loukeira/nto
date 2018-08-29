function onCastSpell(cid, var)
local jogadorpos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local monsterpos = getCreaturePosition(target)
if target == isMonster or isCreature then
doTeleportThing(cid,monsterpos)
doSendMagicEffect(jogadorpos, 229)
else
doPlayerSendTextMessage(cid,20,'Precisa Selecionar um Alvo')
end
end