function onUse(cid, item, frompos, item2, topos)

if item.itemid == 1945 then

player1pos = {x=556, y=699, z=2, stackpos=253} -- piso 1 que tem que ter player
player1 = getThingfromPos(player1pos)

player2pos = {x=556, y=684, z=2, stackpos=253} -- piso 2 que tem que ter player
player2 = getThingfromPos(player2pos)


if isPlayer(player1.uid) and isPlayer(player2.uid) then

nplayer1pos = {x=553, y=691, z=2, stackpos=253} -- piso onde sera levado o player do piso 1
nplayer2pos = {x=558, y=691, z=2, stackpos=253} -- piso onde sera levado o player do piso 2

doSendMagicEffect(player1pos,2)
doSendMagicEffect(player2pos,2)

doTeleportThing(player1.uid,nplayer1pos)
doTeleportThing(player2.uid,nplayer2pos)

doSendMagicEffect(nplayer1pos,4)
doSendMagicEffect(nplayer2pos,4)

doTransformItem(item.uid,1946)

else
doPlayerSendCancel(cid,"Voce prescisa de 4 pessoas para fazer essa quest.")
return TRUE
end

elseif item.itemid == 1946 then
doTransformItem(item.uid,1945)
end
return TRUE
end