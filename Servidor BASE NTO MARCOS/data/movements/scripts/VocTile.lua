function onStepIn(cid, item, pos)
local voc = 6 -- id da vocation que ira ganhar
local storage = 83101 -- n�o mexa
local pos ={x=1023, y=901, z=7}
if getPlayerStorageValue(cid, storage) == -1 then
doPlayerSendTextMessage(cid, 22, "Voc� ja passou aki pelo tile n�o pode ganhar denovo")
return true
end
if getPlayerPosition(cid,pos) then
doPlayerSetVocation(cid,voc)
setPlayerStorageValue(cid, storage, 1)
doPlayerSendTextMessage(cid, 22, "Parab�ns se troco de vocation")
end
return true
end