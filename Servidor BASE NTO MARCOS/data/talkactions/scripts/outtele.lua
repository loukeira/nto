function onSay(cid, words, param, channel)
local out1 = {x = 1348, y = 1096, z = 6}
local out2 = {x = 1336, y = 714, z = 6}
local out3 = {x = 1694, y = 936, z = 6}
if getPlayerItemCount(cid, 2141) >= 1 then
if param == "" then
sendMsgToPlayer(cid, 20, "Onde voce deseja ir: [1], [2], [3], [tc]?")
return true
end
if param == "1" or param == "outland 1" then
 sendMsgToPlayer(cid, 20, "Teleport setado para Outland 1.")
 setPlayerStorageValue(cid, 637123, 1)
 doTeleportThing(cid, out1)
end
if param == "2" or param == "outland 2" then
  sendMsgToPlayer(cid, 20, "Teleport setado para Outland 2.")
 setPlayerStorageValue(cid, 637123, 2)
 doTeleportThing(cid, out2)
end
if param == "3" or param == "outland 3" then
  sendMsgToPlayer(cid, 20, "Teleport setado para Outland 3.")
 setPlayerStorageValue(cid, 637123, 3)
 doTeleportThing(cid, out3)
end
if param == "twin city" or param == "tc" then
  sendMsgToPlayer(cid, 20, "Teleport setado para Twin City.")
 setPlayerStorageValue(cid, 637123, 4)
doTeleportThing(cid, getTownTemplePosition(1))
end
else
sendMsgToPlayer(cid, 20, "Você não tem nenhum Outland Falcon.")
end
end