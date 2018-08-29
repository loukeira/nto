function onStepIn(cid, item, position, lastPosition, fromPosition)


	if not isPlayer(cid) then
	 	return false
	 end



	if (item.actionid == 11180) and (getPlayerStorageValue(chunnin.storage.pergaminho) == -1) and (chunnin.getTeam(cid) > 0) and () then
		
		  
					doPlayerSendCancel(cid, "[CHUNNIN] Voces tem que abrir o bau e coletar o pergaminho!") 
					doSendMagicEffect(getCreaturePosition(cid), 2)
					local pos = getCreaturePosition(cid)
					local newPos = {x=pos.x-1, y=pos.y, z=pos.z}
					doTeleportThing(cid, newPos)     
					return true
	elseif (item.actionid == 10082) and (getGlobalStorageValue(chunnin.storage.bau1) == -1) and (chunnin.getTeam(cid) ~= 1) then
					doPlayerSendCancel(cid, "[CHUNNIN] Vaza daqui trouxa!") 
					doSendMagicEffect(getCreaturePosition(cid), 2)
					local pos = getCreaturePosition(cid)
					local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
					doTeleportThing(cid, newPos)    	
				
			

		return true
	elseif (item.actionid == 10082) and (getGlobalStorageValue(chunnin.storage.bau1) ==1) then

					doPlayerSendCancel(cid, "[CHUNNIN] Voces ja obteram o pergaminho!!") 
					doSendMagicEffect(getCreaturePosition(cid), 2)
					local pos = getCreaturePosition(cid)
					local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
					doTeleportThing(cid, newPos)  
		return true

	end

	

return true
end