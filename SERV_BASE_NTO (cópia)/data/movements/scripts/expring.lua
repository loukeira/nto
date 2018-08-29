local rate = 1.6
function onEquip(cid, item, slot)
if(item.itemid ~= 3275) then
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Your exp rate + "..((rate - 1)*100).."%.")
doPlayerSetExperienceRate(cid, rate)
doTransformItem(item.uid, 3275 )
return true
end
return true
end
function onDeEquip(cid, item, slot)
if(item.itemid ~= 3275 ) then
return true
end
doPlayerSetExperienceRate(cid, 1.0)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Sua experiência extra terminou.")
doTransformItem(item.uid, 3275)
return true
end