function onUse(cid, item, fromPosition, item2, toPosisition)

local config={
RemoveOnUse = "yes" -- remover o item ao usar ("yes" or "no")
}

if getCreatureSkullType(cid) == SKULL_BLACK then
db.executeQuery("UPDATE `killers` SET `unjustified` = 0 WHERE `id` IN (SELECT `kill_id` FROM `player_killers` WHERE `player_id` = " .. getPlayerGUID(cid) .. ")")
doCreatureSetSkullType(cid, 0)
doCreatureSay(cid, "Your frags and skulls is cleaned!", 19)
doSendMagicEffect(getPlayerPosition(cid), 26)
if (config.RemoveOnUse == "yes") then
doRemoveItem(item.uid, 1)
end
else
doPlayerSendCancel(cid,"You don't have Black Skull.")
doSendMagicEffect(getPlayerPosition(cid), 2)
end
return TRUE
end