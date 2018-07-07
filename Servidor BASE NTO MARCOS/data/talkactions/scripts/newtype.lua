function onSay(cid, words, param, channel)
 if(param == '') then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
  return true
 end

 local t = string.explode(param, ",")
 t[1] = tonumber(t[1])
 if(not t[1]) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires numeric param.")
  return true
 end

 local pid = cid
 if(t[2]) then
  pid = getPlayerByNameWildcard(t[2])
  if(not pid or (isPlayerGhost(pid) and getPlayerGhostAccess(pid) > getPlayerGhostAccess(cid))) then
   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player " .. t[2] .. " not found.")
   return true
  end
 end

 if(t[1] <= 1 or t[1] == 200 or (t[1] > 400 and t[1] < 500) or t[1] > 950) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Such outfit does not exist.")
  return true
 end

 local tmp = getCreatureOutfit(pid)
 tmp.lookType = t[1]

 doCreatureChangeOutfit(pid, tmp)
 return true
end
