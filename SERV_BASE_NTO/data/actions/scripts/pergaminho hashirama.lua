function onUse(cid, item, frompos, item2, topos)
local voc = 385 -- id da vocation que ele vai ser promovido
local outfit = 622
if item.itemid == 829 then -- id do item que vai tenque clickar
doPlayerSetVocation(cid,voc)
doCreatureChangeOutfit(cid, {lookType = outfit})
doRemoveItem(item.uid,1)
doPlayerSendTextMessage(cid, 22, "Parab�ns se troco de vocation")
end
return true
end