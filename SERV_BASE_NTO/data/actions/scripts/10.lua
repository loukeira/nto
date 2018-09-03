function onUse(cid, item, frompos, item2, topos)
local voc = 223 -- id da vocation que ele vai ser promovido
local outfit = 421
if item.itemid == 116 then -- id do item que vai tenque clickar
doPlayerSetVocation(cid,voc)
doCreatureChangeOutfit(cid, {lookType = outfit})
doRemoveItem(item.uid,1)
doPlayerSendTextMessage(cid, 22, "Parabens Voce Virou Kisame")
end
return true
end