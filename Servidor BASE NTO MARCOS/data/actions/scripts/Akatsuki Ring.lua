function onUse(cid, item, frompos, item2, topos)

if item.itemid == 1945 then

player1pos = {x=1885, y=1355, z=7, stackpos=253} -- piso 1 que tem que ter player
player1 = getThingfromPos(player1pos)

player2pos = {x=1884, y=1355, z=7, stackpos=253} -- piso 2 que tem que ter player
player2 = getThingfromPos(player2pos)

player3pos = {x=1883, y=1355, z=7, stackpos=253} -- piso 3 que tem que ter player
player3 = getThingfromPos(player3pos)

player4pos = {x=1882, y=1355, z=7, stackpos=253} -- piso 4 que tem que ter player
player4 = getThingfromPos(player4pos)


if isPlayer(player1.uid) and isPlayer(player2.uid) and isPlayer(player3.uid) and isPlayer(player4.uid) then

nplayer1pos = {x=573, y=764, z=2, stackpos=253} -- piso onde sera levado o player do piso 1
nplayer2pos = {x=647, y=767, z=2, stackpos=253} -- piso onde sera levado o player do piso 2
nplayer3pos = {x=575, y=823, z=2, stackpos=253} -- piso onde sera levado o player do piso 3
nplayer4pos = {x=641, y=830, z=2, stackpos=253} -- piso onde sera levado o player do piso 4

doSendMagicEffect(player1pos,2)
doSendMagicEffect(player2pos,2)
doSendMagicEffect(player3pos,2)
doSendMagicEffect(player4pos,2)

doTeleportThing(player1.uid,nplayer1pos)
doTeleportThing(player2.uid,nplayer2pos)
doTeleportThing(player3.uid,nplayer3pos)
doTeleportThing(player4.uid,nplayer4pos)

doSendMagicEffect(nplayer1pos,4)
doSendMagicEffect(nplayer2pos,4)
doSendMagicEffect(nplayer3pos,4)
doSendMagicEffect(nplayer4pos,4)

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