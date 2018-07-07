function onUse(cid, item, frompos, item2, topos)
local voc = 142 -- id da vocation que ele vai ser promovido
local outfit = 35
if item.itemid == 316 then -- id do item que vai tenque clickar
doPlayerSetVocation(cid,voc)
doCreatureChangeOutfit(cid, {lookType = outfit})
doRemoveItem(item.uid,1)
doPlayerSendTextMessage(cid, 22, "Parabens Voce Virou Tobi")
end
return true
end