function onUse(cid, item, frompos, item2, topos)
if item.uid == 3255 then --primeiro bau--
queststatus = getPlayerStorageValue(cid,3000)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Você Virou 1 Jinchuriki")
item_uid = doPlayerAddItem(cid,3255,1)
setPlayerStorageValue(cid,3000,1)

else
doPlayerSendTextMessage(cid,22,"Voce Ja Virou Jinchuriki")
end

elseif item.uid == 3256 then --segundo bau--
queststatus = getPlayerStorageValue(cid,3000)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voce Virou 1 Jinchuriki")
item_uid = doPlayerAddItem(cid,3256,1)
setPlayerStorageValue(cid,3000,1)

else
doPlayerSendTextMessage(cid,22,"Voce Ja Virou Jinchuriki")
end

elseif item.uid == 3257 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,3000)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voce Virou 1 Jinchuriki")
item_uid = doPlayerAddItem(cid,3257,1)
setPlayerStorageValue(cid,3000,1)

else
doPlayerSendTextMessage(cid,22,"Voce Ja Virou Jinchuriki")
end

elseif item.uid == 3258 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,3000)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voce Virou Um Jinchuriki")
item_uid = doPlayerAddItem(cid,3258,1)
setPlayerStorageValue(cid,3000,1)

else
doPlayerSendTextMessage(cid,22,"Voce Ja Virou Jinchuriki")
end


elseif item.uid == 3259 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,3000)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voce Virou Um Jinchuriki")
item_uid = doPlayerAddItem(cid,3259,1)
setPlayerStorageValue(cid,3000,1)

else
doPlayerSendTextMessage(cid,22,"Voce Ja Virou Jinchuriki")
end


elseif item.uid == 3260 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,3000)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voce Virou Um Jinchuriki")
item_uid = doPlayerAddItem(cid,3260,1)
setPlayerStorageValue(cid,3000,1)

else
doPlayerSendTextMessage(cid,22,"Voce Ja Virou Jinchuriki")
end


elseif item.uid == 3261 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,3000)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voce Virou Um Jinchuriki")
item_uid = doPlayerAddItem(cid,3261,1)
setPlayerStorageValue(cid,3000,1)

else
doPlayerSendTextMessage(cid,22,"Voce Ja Virou Jinchuriki")
end


elseif item.uid == 3262 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,3000)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voce Virou Um Jinchuriki")
item_uid = doPlayerAddItem(cid,3262,1)
setPlayerStorageValue(cid,3000,1)

else
doPlayerSendTextMessage(cid,22,"Voce Ja Virou Jinchuriki")
end


elseif item.uid == 3266 then --terceiro bau--
queststatus = getPlayerStorageValue(cid,3000)
if queststatus == -1 or queststatus == 0 then
doPlayerSendTextMessage(cid,22,"Voce Virou Um Jinchuriki")
item_uid = doPlayerAddItem(cid,3266,1)
setPlayerStorageValue(cid,3000,1)

else
doPlayerSendTextMessage(cid,22,"Voce Ja Virou Jinchuriki")
end



else
return 0
end
return 1
end