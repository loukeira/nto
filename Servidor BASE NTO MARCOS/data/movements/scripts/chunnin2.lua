function onStepIn(cid, item, position, lastPosition, fromPosition)


	if not isPlayer(cid) then
	 	return false
	 end


local u = 15900
	
	if getGlobalStorageValue(rola1) == -1 then setGlobalStorageValue(rola1,0) end
	if getGlobalStorageValue(rola2) == -1 then setGlobalStorageValue(rola2,0) end
	if getGlobalStorageValue(rola3) == -1 then setGlobalStorageValue(rola3,0) end
	if getGlobalStorageValue(u) == -1 then setGlobalStorageValue(u,0) end
	if getPlayerStorageValue(cid,rola1) == -1 then setPlayerStorageValue(cid,rola1,0) end

	if (item.actionid == 9802) and (getGlobalStorageValue(rola1) <3) and (getPlayerStorageValue(cid,rola1)==0) then
		doPlayerSendCancel(cid, "[CHUNNIN] Voce entrou no time 1!") 
		doSendMagicEffect(getCreaturePosition(cid), 2)
		setPlayerStorageValue(cid,rola1,1)

		setGlobalStorageValue(rola1,getGlobalStorageValue(rola1) +1)
		if getGlobalStorageValue(rola1) == 3 then setGlobalStorageValue(u,getGlobalStorageValue(u)+1) end

		doPlayerSendTextMessage(cid,18,"global rola: "..getGlobalStorageValue(rola1).." ")
		doPlayerSendTextMessage(cid,18,"storage rola: "..getPlayerStorageValue(cid,rola1).." ")
		doPlayerSendTextMessage(cid,18,"contador time: "..getGlobalStorageValue(u).." ")

		db.query("UPDATE players SET team = 1 WHERE name = "..getPlayerName(cid).." ;")

		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x-1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
		return true
	elseif (item.actionid == 9802) and (getGlobalStorageValue(rola1) >=3) and (getPlayerStorageValue(cid,rola1)==0) then
		doPlayerSendCancel(cid, "[CHUNNIN] JA ESTA CHEIO O TIME 1!") 
		doPlayerSendTextMessage(cid,18,""..getGlobalStorageValue(rola1).." ")

		doSendMagicEffect(getCreaturePosition(cid), 2)
		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
		return true

	elseif (item.actionid == 9802) and (getPlayerStorageValue(cid,rola1)==1)  then
				doPlayerSendCancel(cid, "[CHUNNIN] Voce saiu do time 1!") 
			doSendMagicEffect(getCreaturePosition(cid), 2)		
		if getGlobalStorageValue(rola1) == 3 then setGlobalStorageValue(u,getGlobalStorageValue(u)-1) end
		setGlobalStorageValue(rola1,getGlobalStorageValue(rola1)-1)
		setPlayerStorageValue(cid,rola1,0)
		db.query("UPDATE players SET team = 0 WHERE name = "..getPlayerName(cid).." ;")
		doPlayerSendTextMessage(cid,18,"Global rola1: "..getGlobalStorageValue(rola1).." ")
		doPlayerSendTextMessage(cid,18,"storage rola: "..getPlayerStorageValue(cid,rola1).." ")
		doPlayerSendTextMessage(cid,18,"contador time: "..getGlobalStorageValue(u).." ")



		local pos = getCreaturePosition(cid)
		local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
		doTeleportThing(cid, newPos)
	return true
	end

	-- if (item.aid == 9803) and (getGlobalStorageValue(rola2) <3) then
	-- 	local pos = getCreaturePosition(cid)
	-- 	local newPos = {x=pos.x-1, y=pos.y, z=pos.z}
	-- 	doTeleportThing(cid, newPos)
	-- 	return true
	-- end

	-- if (item.aid == 9804) and (getGlobalStorageValue(rola3) <3) then
	-- 	db.query("DELETE FROM dtt_players WHERE pid = "..cid..";")  
 --        doTeleportThing(cid, getTownTemplePosition(chunnin.townid.init))
	-- end

return true
end