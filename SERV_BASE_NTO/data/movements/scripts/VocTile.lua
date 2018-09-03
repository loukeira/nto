function onStepIn(cid, item, pos)
local voc = 6 -- id da vocation que ira ganhar
local storage = 83101 -- não mexa
local pos ={x=1023, y=901, z=7}
if getPlayerStorageValue(cid, storage) == -1 then
doPlayerSendTextMessage(cid, 22, "Você ja passou aki pelo tile não pode ganhar denovo")
return true
end
if getPlayerPosition(cid,pos) then
doPlayerSetVocation(cid,voc)
setPlayerStorageValue(cid, storage, 1)
doPlayerSendTextMessage(cid, 22, "Parabéns se troco de vocation")
end
return true
end