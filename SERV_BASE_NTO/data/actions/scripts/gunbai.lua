function onUse(cid, item, frompos, item2, topos)
local cost = 80000
if getPlayerStorageValue(cid, 23254) > -3000 then
		local mymoney = getPlayerStorageValue(cid, 23254)
		setPlayerStorageValue(cid, 23254, mymoney - cost)
		doPlayerSetNoMove(cid, true)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You pushed the machine lever (-10 coins), now you have "..mymoney - cost.." coins left.")
local bag = doPlayerAddItem(cid, 1999, 1)
doAddContainerItem(bag, 855, 1)
doPlayerSendTextMessage(cid,22,"Voce acabou de conseguir o Item da Quest!")
else
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce ja pegou os Item da Quest.")
end

return TRUE
end