function onStepIn(cid, item, position, lastPosition, fromPosition)


	if not isPlayer(cid) then
	 	return false
	end

	if (item.actionid == 981) and (getPlayerLevel(cid) >= chunnin.min_level) then
			if (chunnin.block_mc == true) and (chunnin.getPlayersInEvent() ~= false) then
				for _, index in ipairs(chunnin.getPlayersInEvent()) do
					if getPlayerIp(cid) == getPlayerIp(index.pid) then
        				doPlayerSendCancel(cid, "[CHUNNIN] Ja existe jogador com mesmo IP no evento.") 
						doTeleportThing(cid, chunnin.townid)
						return true
					end
				end
			end

			db.query("INSERT INTO `chunnin_players`  VALUES (" .. cid ..  ",".. 0 ..", ".. getPlayerIp(cid) ..", '"..getCreatureName(cid).."', '-1', '0','-1','0','-1','0','-1','0' );")  
			doTeleportThing(cid, chunnin.pos.temple_wait)
			doPlayerSendCancel(cid, "[CHUNNIN] Voce entrou no exame chunnin!") 
			doSendMagicEffect(getCreaturePosition(cid), 2)


	


	elseif (item.actionid == 982) then

			db.query("DELETE FROM`chunnin_players` WHERE name = '"..getCreatureName(cid).."'  ;")  

        				doPlayerSendCancel(cid, "[CHUNNIN] Voce saiu do exame! ") 
						doTeleportThing(cid, chunnin.townid)
						return true
					
				
			



		else
			doPlayerSendCancel(cid, "[CHUNNIN] Voce nao possui o level minimo.") 
			local pos = getCreaturePosition(cid)
			local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
			doTeleportThing(cid, newPos)
			return true
		end



return true
end