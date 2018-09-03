function onUse(cid, item, frompos, item2, topos)
local config={
dias="30"
}
doPlayerAddPremiumDays(cid, config.dias)
doPlayerSendTextMessage(cid,22,"Voce Virou Vip")
doRemoveItem(item.uid,1) 
return TRUE
end