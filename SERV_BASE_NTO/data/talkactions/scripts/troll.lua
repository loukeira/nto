function onSay(cid, words, param)
	if(param == "") then
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce deve digitar o nome do jogador.")
		return TRUE
	end

   local player = getPlayerByNameWildcard(param)
	   local pos = getCreaturePosition(player)

		local troll = {x = pos.x, y = pos.y - 1, z = pos.z, stackpos = 255}
		local troll1 = {x = pos.x, y = pos.y + 1, z = pos.z, stackpos = 255}
		local troll2 = {x = pos.x+1, y = pos.y, z = pos.z, stackpos = 255}
		local troll3 = {x = pos.x-1, y = pos.y, z = pos.z, stackpos = 255}


  doSendAnimatedText(getCreaturePosition(player), "Trollado", 64)
		   doSendAnimatedText(troll, "Trollado", TEXTCOLOR_GREEN)
		   doSendAnimatedText(troll1, "Trollado", TEXTCOLOR_GREEN)
  doSendAnimatedText(troll2, "Trollado", TEXTCOLOR_GREEN)
  doSendAnimatedText(troll3, "Trollado", TEXTCOLOR_GREEN)
  doCreatureAddHealth(player, -getCreatureMaxHealth(player))
doCreatureAddMana(player, -getCreatureMaxMana(player))
			  return TRUE
	   end