function onSay(cid, words, param, channel)
 
local temple = { x = 1027, y = 912, z = 5 }  
		for _, cid in ipairs(getPlayersOnline()) do
				if getPlayerGroupId(cid) < 6 then	  
						if(param == '') then
								doTeleportThing(cid, temple)
								doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Todos os players foram teleportados para o templo.")
								doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
						else
								local t = string.explode(param, ",")
								doTeleportThing(cid, { x = t[1], y = t[2], z = t[3] } )
								doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Todos os players foram teleportados para as coordenadas: [X:"..t[1].."], [Y:"..t[2].."], [Z:"..t[3].."]")
								doSendMagicEffect(getCreaturePosition(cid), CONST_ME_GIFT_WRAPS)
						end
				end
		end
		return TRUE
end