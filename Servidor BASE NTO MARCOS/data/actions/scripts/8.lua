function onUse(cid, item, frompos, item2, topos)
local voc = 200 -- id da vocation que ele vai ser promovido
local outfit = 691
if item.itemid == 3293 then -- id do item que vai tenque clickar
doPlayerSetVocation(cid,voc)
doCreatureChangeOutfit(cid, {lookType = outfit})
doRemoveItem(item.uid,1)
doPlayerSendTextMessage(cid, 22, "Parabens Voce Virou Nagato")
end
return true
end