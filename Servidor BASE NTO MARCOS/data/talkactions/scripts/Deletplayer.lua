function onSay(cid, words, param, channel)
local p = string.explode(param, ',')
if(param == "") then
doPlayerSendCancel(cid, "Command requires param.")
return true
end
if(words == "/del") then
if(db.getResult("DELETE FROM `X`.`players` WHERE `players`.`name` = " .. db.escapeString(p[1]) .. ";"):getID() == -1) then
return doPlayerSendCancel(cid, "You Have Deleted [" .. p[1] .. "] .")
end
return db.executeQuery("UPDATE `players`" .. p[1] .. "' WHERE players = '" .. p[1] .. "';") and doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have Deleted " .. p[1] .. "'s name")
end
end