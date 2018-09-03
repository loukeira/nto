function onStepIn(cid, item, position, lastPosition, fromPosition)


	if not isPlayer(cid) then
	 	return false
	 end


-----TILE BAU TIME 1 ------------------

	if (item.actionid == 10082) and (getGlobalStorageValue(chunnin.storage.bau1) == -1) and (chunnin.getTeam(cid) == 1)then
		
		  
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

----- TILE BAU TIME 2 -------------
	elseif (item.actionid == 10083) and (getGlobalStorageValue(chunnin.storage.bau2) == -1) and (chunnin.getTeam(cid) == 2)then
		
		  
					doPlayerSendCancel(cid, "[CHUNNIN] Voces tem que abrir o bau e coletar o pergaminho!") 
					doSendMagicEffect(getCreaturePosition(cid), 2)
					local pos = getCreaturePosition(cid)
					local newPos = {x=pos.x, y=pos.y-1, z=pos.z}
					doTeleportThing(cid, newPos)     
					return true
	elseif (item.actionid == 10083) and (getGlobalStorageValue(chunnin.storage.bau2) == -1) and (chunnin.getTeam(cid) ~= 2) then
					doPlayerSendCancel(cid, "[CHUNNIN] Vaza daqui trouxa!") 
					doSendMagicEffect(getCreaturePosition(cid), 2)
					local pos = getCreaturePosition(cid)
					local newPos = {x=pos.x, y=pos.y+1, z=pos.z}
					doTeleportThing(cid, newPos)    	
				
			

		return true
	elseif (item.actionid == 10083) and (getGlobalStorageValue(chunnin.storage.bau2) ==1) then

					doPlayerSendCancel(cid, "[CHUNNIN] Voces ja obteram o pergaminho!!") 
					doSendMagicEffect(getCreaturePosition(cid), 2)
					local pos = getCreaturePosition(cid)
					local newPos = {x=pos.x, y=pos.y+1, z=pos.z}
					doTeleportThing(cid, newPos)  
		return true

--- TIME 3 TILE ID BAUUUU -------
	elseif (item.actionid == 10084) and (getGlobalStorageValue(chunnin.storage.bau3) == -1) and (chunnin.getTeam(cid) == 3)then
		
		  
					doPlayerSendCancel(cid, "[CHUNNIN] Voces tem que abrir o bau e coletar o pergaminho!") 
					doSendMagicEffect(getCreaturePosition(cid), 2)
					local pos = getCreaturePosition(cid)
					local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
					doTeleportThing(cid, newPos)     
					return true
	elseif (item.actionid == 10084) and (getGlobalStorageValue(chunnin.storage.bau3) == -1) and (chunnin.getTeam(cid) ~= 3) then
					doPlayerSendCancel(cid, "[CHUNNIN] Vaza daqui trouxa!") 
					doSendMagicEffect(getCreaturePosition(cid), 2)
					local pos = getCreaturePosition(cid)
					local newPos = {x=pos.x-1 , y=pos.y, z=pos.z}
					doTeleportThing(cid, newPos)    	
				
			

		return true
	elseif (item.actionid == 10084) and (getGlobalStorageValue(chunnin.storage.bau3) ==1) then

					doPlayerSendCancel(cid, "[CHUNNIN] Voces ja obteram o pergaminho!!") 
					doSendMagicEffect(getCreaturePosition(cid), 2)
					local pos = getCreaturePosition(cid)
					local newPos = {x=pos.x-1 , y=pos.y, z=pos.z}
					doTeleportThing(cid, newPos)  
		return true



	end

	

return true
end