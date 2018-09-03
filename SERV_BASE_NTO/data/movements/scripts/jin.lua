local config = {
-- ID dos items dos jinchurikis
Item_1 = 3255,
Item_2 = 3256,
Item_3 = 3257,
Item_4 = 3258,
Item_5 = 3259,
Item_6 = 3260,
Item_7 = 3261,
Item_8 = 3262,
Item_9 = 3266,
-- Outfit dos jinchurikis
Jinchuriki_1 = 53,
Jinchuriki_2 = 514,
Jinchuriki_3 = 519,
Jinchuriki_4 = 518,
Jinchuriki_5 = 515,
Jinchuriki_6 = 516,
Jinchuriki_7 = 517,
Jinchuriki_8 = 373,
Jinchuriki_9 = 77,
-- Nome dos jinchurikis
Name_1 = "Shukaku",
Name_2 = "Nibi",
Name_3 = "Sambi",
Name_4 = "Yonbi",
Name_5 = "Gobi",
Name_6 = "Rokubi",
Name_7 = "Shichibi",
Name_8 = "Hachibi",
Name_9 = "Kyuubi"
}

local blockDoubleExecution = {}

function onEquip(cid, item, slot)

if blockDoubleExecution[cid] then
blockDoubleExecution[cid] = nil
return TRUE
else
blockDoubleExecution[cid] = TRUE
end

if item.itemid == config.Item_1 then
doPlayerLearnInstantSpell(cid, "Shukaku Furie")
doPlayerLearnInstantSpell(cid, "Bijuu Mode")
doPlayerLearnInstantSpell(cid, "Biju Dama")
doPlayerLearnInstantSpell(cid, "Bijuu Punch")
setPlayerStorageValue(cid, 13280, getCreatureOutfit(cid).lookType)
doCreatureChangeOutfit(cid, {lookType = config.Jinchuriki_1})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora possui as abilidades de "..config.Name_1..".")
return TRUE
end

if item.itemid == config.Item_2 then
doPlayerLearnInstantSpell(cid, "Bijuu Furie")
doPlayerLearnInstantSpell(cid, "Bijuu Mode")
doPlayerLearnInstantSpell(cid, "Biju Dama")
doPlayerLearnInstantSpell(cid, "Bijuu Punch")
setPlayerStorageValue(cid, 13280, getCreatureOutfit(cid).lookType)
doCreatureChangeOutfit(cid, {lookType = config.Jinchuriki_2})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora possui as abilidades de "..config.Name_2..".")
return TRUE
end

if item.itemid == config.Item_3 then
doPlayerLearnInstantSpell(cid, "Sambi Furie")
doPlayerLearnInstantSpell(cid, "Bijuu Mode")
doPlayerLearnInstantSpell(cid, "Biju Dama")
doPlayerLearnInstantSpell(cid, "Bijuu Punch")
setPlayerStorageValue(cid, 13280, getCreatureOutfit(cid).lookType)
doCreatureChangeOutfit(cid, {lookType = config.Jinchuriki_3})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora possui as abilidades de "..config.Name_3..".")
return TRUE
end

if item.itemid == config.Item_4 then
doPlayerLearnInstantSpell(cid, "Yonbi Furie")
doPlayerLearnInstantSpell(cid, "Bijuu Mode")
doPlayerLearnInstantSpell(cid, "Biju Dama")
doPlayerLearnInstantSpell(cid, "Bijuu Punch")
setPlayerStorageValue(cid, 13280, getCreatureOutfit(cid).lookType)
doCreatureChangeOutfit(cid, {lookType = config.Jinchuriki_4})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora possui as abilidades de "..config.Name_4..".")
return TRUE
end

if item.itemid == config.Item_5 then
doPlayerLearnInstantSpell(cid, "Gobi Furie")
doPlayerLearnInstantSpell(cid, "Bijuu Mode")
doPlayerLearnInstantSpell(cid, "Biju Dama")
doPlayerLearnInstantSpell(cid, "Bijuu Punch")
setPlayerStorageValue(cid, 13280, getCreatureOutfit(cid).lookType)
doCreatureChangeOutfit(cid, {lookType = config.Jinchuriki_5})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora possui as abilidades de "..config.Name_5..".")
return TRUE
end

if item.itemid == config.Item_6 then
doPlayerLearnInstantSpell(cid, "Rokubi Furie")
doPlayerLearnInstantSpell(cid, "Bijuu Mode")
doPlayerLearnInstantSpell(cid, "Biju Dama")
doPlayerLearnInstantSpell(cid, "Bijuu Punch")
setPlayerStorageValue(cid, 13280, getCreatureOutfit(cid).lookType)
doCreatureChangeOutfit(cid, {lookType = config.Jinchuriki_6})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora possui as abilidades de "..config.Name_6..".")
return TRUE
end

if item.itemid == config.Item_7 then
doPlayerLearnInstantSpell(cid, "Shichibi Furie")
doPlayerLearnInstantSpell(cid, "Bijuu Mode")
doPlayerLearnInstantSpell(cid, "Biju Dama")
doPlayerLearnInstantSpell(cid, "Bijuu Punch")
setPlayerStorageValue(cid, 13280, getCreatureOutfit(cid).lookType)
doCreatureChangeOutfit(cid, {lookType = config.Jinchuriki_7})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora possui as abilidades de "..config.Name_7..".")
return TRUE
end

if item.itemid == config.Item_8 then
doPlayerLearnInstantSpell(cid, "Hachibi Furie")
doPlayerLearnInstantSpell(cid, "Bijuu Mode")
doPlayerLearnInstantSpell(cid, "Biju Dama")
doPlayerLearnInstantSpell(cid, "Bijuu Punch")
setPlayerStorageValue(cid, 13280, getCreatureOutfit(cid).lookType)
doCreatureChangeOutfit(cid, {lookType = config.Jinchuriki_8})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora possui as abilidades de "..config.Name_8..".")
return TRUE
end

if item.itemid == config.Item_9 then
doPlayerLearnInstantSpell(cid, "Kyuubi Bijuu Furie")
doPlayerLearnInstantSpell(cid, "Bijuu Mode")
doPlayerLearnInstantSpell(cid, "Biju Dama")
doPlayerLearnInstantSpell(cid, "Bijuu Punch")
setPlayerStorageValue(cid, 13280, getCreatureOutfit(cid).lookType)
doCreatureChangeOutfit(cid, {lookType = config.Jinchuriki_9})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce agora possui as abilidades de "..config.Name_9..".")
end
return TRUE
end


function onDeEquip(cid, item, slot)
local outfit_back = getPlayerStorageValue(cid, 13280)

if item.itemid == config.Item_1 then
doPlayerUnlearnInstantSpell(cid, "Shukaku Furie")
doPlayerUnlearnInstantSpell(cid, "Bijuu Mode")
doPlayerUnlearnInstantSpell(cid, "Biju Dama")
doPlayerUnlearnInstantSpell(cid, "Bijuu Punch")
doCreatureChangeOutfit(cid, {lookType = outfit_back})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce desativo as abilidades de "..config.Name_1..".")
return TRUE
end

if item.itemid == config.Item_2 then
doPlayerUnlearnInstantSpell(cid, "Bijuu Furie")
doPlayerUnlearnInstantSpell(cid, "Bijuu Mode")
doPlayerUnlearnInstantSpell(cid, "Biju Dama")
doPlayerUnlearnInstantSpell(cid, "Bijuu Punch")
doCreatureChangeOutfit(cid, {lookType = outfit_back})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce desativo as abilidades de "..config.Name_2..".")
return TRUE
end

if item.itemid == config.Item_3 then
doPlayerUnlearnInstantSpell(cid, "Sambi Furie")
doPlayerUnlearnInstantSpell(cid, "Bijuu Mode")
doPlayerUnlearnInstantSpell(cid, "Biju Dama")
doPlayerUnlearnInstantSpell(cid, "Bijuu Punch")
doCreatureChangeOutfit(cid, {lookType = outfit_back})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce desativo as abilidades de "..config.Name_3..".")
return TRUE
end

if item.itemid == config.Item_4 then
doPlayerUnlearnInstantSpell(cid, "Yonbi Furie")
doPlayerUnlearnInstantSpell(cid, "Bijuu Mode")
doPlayerUnlearnInstantSpell(cid, "Biju Dama")
doPlayerUnlearnInstantSpell(cid, "Bijuu Punch")
doCreatureChangeOutfit(cid, {lookType = outfit_back})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce desativo as abilidades de "..config.Name_4..".")
return TRUE
end

if item.itemid == config.Item_5 then
doPlayerUnlearnInstantSpell(cid, "Gobi Furie")
doPlayerUnlearnInstantSpell(cid, "Bijuu Mode")
doPlayerUnlearnInstantSpell(cid, "Biju Dama")
doPlayerUnlearnInstantSpell(cid, "Bijuu Punch")
doCreatureChangeOutfit(cid, {lookType = outfit_back})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce desativo as abilidades de "..config.Name_5..".")
return TRUE
end

if item.itemid == config.Item_6 then
doPlayerUnlearnInstantSpell(cid, "Rokubi Furie")
doPlayerUnlearnInstantSpell(cid, "Bijuu Mode")
doPlayerUnlearnInstantSpell(cid, "Biju Dama")
doPlayerUnlearnInstantSpell(cid, "Bijuu Punch")
doCreatureChangeOutfit(cid, {lookType = outfit_back})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce desativo as abilidades de "..config.Name_6..".")
return TRUE
end

if item.itemid == config.Item_7 then
doPlayerUnlearnInstantSpell(cid, "Shichibi Furie")
doPlayerUnlearnInstantSpell(cid, "Bijuu Mode")
doPlayerUnlearnInstantSpell(cid, "Biju Dama")
doPlayerUnlearnInstantSpell(cid, "Bijuu Punch")
doCreatureChangeOutfit(cid, {lookType = outfit_back})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce desativo as abilidades de "..config.Name_7..".")
return TRUE
end

if item.itemid == config.Item_8 then
doPlayerUnlearnInstantSpell(cid, "Hachibi Furie")
doPlayerUnlearnInstantSpell(cid, "Bijuu Mode")
doPlayerUnlearnInstantSpell(cid, "Biju Dama")
doPlayerUnlearnInstantSpell(cid, "Bijuu Punch")
doCreatureChangeOutfit(cid, {lookType = outfit_back})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce desativo as abilidades de "..config.Name_8..".")
return TRUE
end

if item.itemid == config.Item_9 then
doPlayerUnlearnInstantSpell(cid, "Kyuubi Bijuu Furie")
doPlayerUnlearnInstantSpell(cid, "Bijuu Mode")
doPlayerUnlearnInstantSpell(cid, "Biju Dama")
doPlayerUnlearnInstantSpell(cid, "Bijuu Punch")
doCreatureChangeOutfit(cid, {lookType = outfit_back})
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce desativo as abilidades de "..config.Name_9..".")
end
return TRUE
end