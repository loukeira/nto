function onStepIn(cid, item, position, lastPosition, fromPosition)


	if not isPlayer(cid) then
	 	return false
	 end


	
	if getGlobalStorageValue(chunnin.storage.rola1) == -1 then setGlobalStorageValue(chunnin.storage.rola1,0) end
	if getGlobalStorageValue(chunnin.storage.somatoriotime) == -1 then setGlobalStorageValue(chunnin.storage.somatoriotime,0) end
	if getPlayerStorageValue(cid,chunnin.storage.rola1) == -1 then setPlayerStorageValue(cid,chunnin.storage.rola1,0) end

	if getGlobalStorageValue(chunnin.storage.rola2) == -1 then setGlobalStorageValue(chunnin.storage.rola2,0) end
	if getGlobalStorageValue(chunnin.storage.somatoriotime2) == -1 then setGlobalStorageValue(chunnin.storage.somatoriotime2,0) end
	if getPlayerStorageValue(cid,chunnin.storage.rola2) == -1 then setPlayerStorageValue(cid,chunnin.storage.rola2,0) end


	if getGlobalStorageValue(chunnin.storage.rola3) == -1 then setGlobalStorageValue(chunnin.storage.rola3,0) end
	if getGlobalStorageValue(chunnin.storage.somatoriotime3) == -1 then setGlobalStorageValue(chunnin.storage.somatoriotime3,0) end
	if getPlayerStorageValue(cid,chunnin.storage.rola3) == -1 then setPlayerStorageValue(cid,chunnin.storage.rola3,0) end

-- TIME 1  TILE ID ----------------------------------------

	if (item.actionid == 9802) and (getGlobalStorageValue(chunnin.storage.rola1) <3) and (getPlayerStorageValue(cid,chunnin.storage.rola1)==0) then
		doPlayerSendCancel(cid, "[CHUNNIN] Voce entrou no time 1!") 
		doSendMagicEffect(getCreaturePosition(cid), 2)
		setPlayerStorageValue(cid,chunnin.storage.rola1,1)

		setGlobalStorageValue(chunnin.storage.rola1,getGlobalStorageValue(chunnin.storage.rola1) +1)
		if getGlobalStorageValue(chunnin.storage.rola1) == 3 then setGlobalStorageValue(chunnin.storage.somatoriotime,getGlobalStorageValue(chunnin.storage.somatoriotime)+1) end

		--doPlayerSendTextMessage(cid,18,"global rola: "..getGlobalStorageValue(chunnin.storage.rola1).." ")
		--doPlayerSendTextMessage(cid,18,"storage rola: "..getPlayerStorageValue(cid,chunnin.storage.rola1).." ")
		--doPlayerSendTextMessage(cid,18,"contador time: "..getGlobalStorageValue(chunnin.storage.somatoriotime).." ")

		db.query("UPDATE chunnin_players SET team = 1 WHERE name = '"..getPlayerName(cid).."' ;")

		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x-1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
		return true
	elseif (item.actionid == 9802) and (getGlobalStorageValue(chunnin.storage.rola1) >=3) and (getPlayerStorageValue(cid,chunnin.storage.rola1)==0) then
		doPlayerSendCancel(cid, "[CHUNNIN] JA ESTA CHEIO O TIME 1!") 
		--doPlayerSendTextMessage(cid,18,"storage rola1: "..getGlobalStorageValue(chunnin.storage.rola1).." ")

		doSendMagicEffect(getCreaturePosition(cid), 2)
		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
		return true

	elseif (item.actionid == 9802) and (getPlayerStorageValue(cid,chunnin.storage.rola1)==1)  then
				doPlayerSendCancel(cid, "[CHUNNIN] Voce saiu do time 1!") 
			doSendMagicEffect(getCreaturePosition(cid), 2)		
		if getGlobalStorageValue(chunnin.storage.rola1) == 3 then setGlobalStorageValue(chunnin.storage.somatoriotime,getGlobalStorageValue(chunnin.storage.somatoriotime)-1) end
		setGlobalStorageValue(chunnin.storage.rola1,getGlobalStorageValue(chunnin.storage.rola1)-1)
		setPlayerStorageValue(cid,chunnin.storage.rola1,0)
		db.query("UPDATE chunnin_players SET team = 0 WHERE name = '"..getPlayerName(cid).."' ;")
		--doPlayerSendTextMessage(cid,18,"Global rola1: "..getGlobalStorageValue(chunnin.storage.rola1).." ")
		--doPlayerSendTextMessage(cid,18,"storage rola: "..getPlayerStorageValue(cid,chunnin.storage.rola1).." ")
		--doPlayerSendTextMessage(cid,18,"contador time: "..getGlobalStorageValue(chunnin.storage.somatoriotime).." ")



		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)

	-- TIME 2 TILE ID -------------------------------


	elseif (item.actionid == 9803) and (getGlobalStorageValue(chunnin.storage.rola2) <3) and (getPlayerStorageValue(cid,chunnin.storage.rola2)==0) then
		doPlayerSendCancel(cid, "[CHUNNIN] Voce entrou no time 2!") 
		doSendMagicEffect(getCreaturePosition(cid), 2)
		setPlayerStorageValue(cid,chunnin.storage.rola2,1)

		setGlobalStorageValue(chunnin.storage.rola2,getGlobalStorageValue(chunnin.storage.rola2) +1)
		if getGlobalStorageValue(chunnin.storage.rola2) == 3 then setGlobalStorageValue(chunnin.storage.somatoriotime2,getGlobalStorageValue(chunnin.storage.somatoriotime2)+1) end

		--doPlayerSendTextMessage(cid,18,"global rola: "..getGlobalStorageValue(chunnin.storage.rola2).." ")
		--doPlayerSendTextMessage(cid,18,"storage rola: "..getPlayerStorageValue(cid,chunnin.storage.rola2).." ")
		--doPlayerSendTextMessage(cid,18,"contador time: "..getGlobalStorageValue(chunnin.storage.somatoriotime2).." ")

		db.query("UPDATE chunnin_players SET team = 2 WHERE name = '"..getPlayerName(cid).."' ;")

		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
		return true
	elseif (item.actionid == 9803) and (getGlobalStorageValue(chunnin.storage.rola2) >=3) and (getPlayerStorageValue(cid,chunnin.storage.rola2)==0) then
		doPlayerSendCancel(cid, "[CHUNNIN] JA ESTA CHEIO O TIME 2!") 
		--doPlayerSendTextMessage(cid,18,"storage rola2: "..getGlobalStorageValue(chunnin.storage.rola2).." ")

		doSendMagicEffect(getCreaturePosition(cid), 2)
		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x-1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
		return true

	elseif (item.actionid == 9803) and (getPlayerStorageValue(cid,chunnin.storage.rola2)==1)  then
				doPlayerSendCancel(cid, "[CHUNNIN] Voce saiu do time 2!") 
			doSendMagicEffect(getCreaturePosition(cid), 2)		
		if getGlobalStorageValue(chunnin.storage.rola2) == 3 then setGlobalStorageValue(chunnin.storage.somatoriotime2,getGlobalStorageValue(chunnin.storage.somatoriotime2)-1) end
		setGlobalStorageValue(chunnin.storage.rola2,getGlobalStorageValue(chunnin.storage.rola2)-1)
		setPlayerStorageValue(cid,chunnin.storage.rola2,0)
		db.query("UPDATE chunnin_players SET team = 0 WHERE name = '"..getPlayerName(cid).."' ;")
		--doPlayerSendTextMessage(cid,18,"Global rola2: "..getGlobalStorageValue(chunnin.storage.rola2).." ")
		--doPlayerSendTextMessage(cid,18,"storage rola: "..getPlayerStorageValue(cid,chunnin.storage.rola2).." ")
		--doPlayerSendTextMessage(cid,18,"contador time: "..getGlobalStorageValue(chunnin.storage.somatoriotime2).." ")



		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x-1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)

	return true

------ TILE ID TIME 3 ---------------------------------------------
 	elseif (item.actionid == 9804) and (getGlobalStorageValue(chunnin.storage.rola3) <3) and (getPlayerStorageValue(cid,chunnin.storage.rola3)==0) then
		doPlayerSendCancel(cid, "[CHUNNIN] Voce entrou no time 3!") 
		doSendMagicEffect(getCreaturePosition(cid), 2)
		setPlayerStorageValue(cid,chunnin.storage.rola3,1)

		setGlobalStorageValue(chunnin.storage.rola3,getGlobalStorageValue(chunnin.storage.rola3) +1)
		if getGlobalStorageValue(chunnin.storage.rola3) == 3 then setGlobalStorageValue(chunnin.storage.somatoriotime3,getGlobalStorageValue(chunnin.storage.somatoriotime3)+1) end

		--doPlayerSendTextMessage(cid,18,"global rola: "..getGlobalStorageValue(chunnin.storage.rola3).." ")
		--doPlayerSendTextMessage(cid,18,"storage rola: "..getPlayerStorageValue(cid,chunnin.storage.rola3).." ")
		--doPlayerSendTextMessage(cid,18,"contador time: "..getGlobalStorageValue(chunnin.storage.somatoriotime3).." ")

		db.query("UPDATE chunnin_players SET team = 3 WHERE name = '"..getPlayerName(cid).."' ;")

		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
		return true
	elseif (item.actionid == 9804) and (getGlobalStorageValue(chunnin.storage.rola3) >=3) and (getPlayerStorageValue(cid,chunnin.storage.rola3)==0) then
		doPlayerSendCancel(cid, "[CHUNNIN] JA ESTA CHEIO O TIME 3!") 
		--doPlayerSendTextMessage(cid,18,"storage rola3: "..getGlobalStorageValue(chunnin.storage.rola3).." ")

		doSendMagicEffect(getCreaturePosition(cid), 2)
		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x-1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
		return true

	elseif (item.actionid == 9804) and (getPlayerStorageValue(cid,chunnin.storage.rola3)==1)  then
				doPlayerSendCancel(cid, "[CHUNNIN] Voce saiu do time 3!") 
			doSendMagicEffect(getCreaturePosition(cid), 2)		
		if getGlobalStorageValue(chunnin.storage.rola3) == 3 then setGlobalStorageValue(chunnin.storage.somatoriotime3,getGlobalStorageValue(chunnin.storage.somatoriotime3)-1) end
		setGlobalStorageValue(chunnin.storage.rola3,getGlobalStorageValue(chunnin.storage.rola3)-1)
		setPlayerStorageValue(cid,chunnin.storage.rola3,0)
		db.query("UPDATE chunnin_players SET team = 0 WHERE name = '"..getPlayerName(cid).."' ;")
		--doPlayerSendTextMessage(cid,18,"Global rola3: "..getGlobalStorageValue(chunnin.storage.rola3).." ")
		--doPlayerSendTextMessage(cid,18,"storage rola: "..getPlayerStorageValue(cid,chunnin.storage.rola3).." ")
		--doPlayerSendTextMessage(cid,18,"contador time: "..getGlobalStorageValue(chunnin.storage.somatoriotime3).." ")



		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x-1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)

	return true


	end













return true
end