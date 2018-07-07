function onUse(cid, item, frompos, item2, topos)
local voc = 404 -- id da vocation que ele vai ser promovido
local outfit = 735 -- id da vocation que ele vai ser promovido
if item.itemid == 4758 then -- id do item que vai tenque clickar
doCreatureChangeOutfit(cid, {lookType = outfit})
doPlayerSetVocation(cid,voc)
doRemoveItem(item.uid,1)
doPlayerSendTextMessage(cid, 22, "Parabéns se troco de vocation")
end
return true
end