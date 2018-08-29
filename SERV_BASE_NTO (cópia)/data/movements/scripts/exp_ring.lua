function onEquip(cid, item, slot)
doTransformItem(item.uid, 7859, 1)
doPlayerSendTextMessage(cid, 22, 'Agora ganha 20 por cento mais experiencia!')
doPlayerSetExperienceRate(cid, getConfigValue("rateExperience")*1.2)



return TRUE
end

function onDeEquip(cid, item, slot)
doTransformItem(item.uid, 7859, 1)
doPlayerSendTextMessage(cid, 22, 'Experiencia extra cancelada.')
doPlayerSetExperienceRate(cid, 1)


return TRUE
end