local times = 1
local storage = 92857
local xixistorage = 92858

local naopodeporenquanto = 92859

function onSay(cid,target, words, param, channel)
		local meulevel = 7
	
if isPlayer(cid) and (getPlayerLevel(cid) > meulevel)then
	
	

if getPlayerStorageValue(cid, storage) <= os.time() then
		
			setPlayerStorageValue(cid, storage, os.time() + times)

local pos = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z, stackpos=1}
if getCreatureLookDirection(cid) == SOUTH then
pos = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z, stackpos=255}

elseif getCreatureLookDirection(cid) == NORTH then
pos = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z, stackpos=255}

elseif getCreatureLookDirection(cid) == EAST then
pos = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z, stackpos=255}

elseif getCreatureLookDirection(cid) == WEST then
pos = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z, stackpos=255}

end



doCreatureSay(cid,"xiiii",19)
local getThing = getThingFromPos(pos)
doSendMagicEffect(pos, 1)  

-- SUL -- 
	if getCreatureLookDirection(cid) == SOUTH then
	doCreateItem(5662, 1, pos)

		local positionns = getCreaturePosition(cid)
		positionns.y = positionns.y + 1
		local levelalvo= 7
	
		if isInRange(pos, pos, pos)then
		if isPlayer(getThingFromPos(pos).uid) then
		if(getPlayerLevel(getThingFromPos(pos).uid) >= levelalvo) then

		setPlayerStorageValue(cid,xixistorage, getPlayerStorageValue(cid,xixistorage) + 1 )
		doPlayerSendTextMessage(cid,19,"Voce ja mijou em "..getPlayerStorageValue(cid, xixistorage).." Pessoas!" )
		else
		doPlayerSendTextMessage(cid,27,"Voce so pode mijar em player de level "..levelalvo.." ou maior!")
		end
		else
		doPlayerSendTextMessage(cid,27,"Voce deve mijar em um player!")
		end
		end
	
	
	addEvent (
		function (cid)
		if getTileItemById(pos,5662).uid > 0 then
		
doRemoveItem(getTileItemById(pos,5662).uid > 0 and getTileItemById(pos ,5662).uid )
end
		end, 500
	) 
	end
	
-- NORTE --

	if getCreatureLookDirection(cid) == NORTH then

		local positionn = getCreaturePosition(cid)
		positionn.y = positionn.y - 1
		local levelalvo= 7
	
		if isInRange(pos, pos, pos)then
		if isPlayer(getThingFromPos(pos).uid) then
		if(getPlayerLevel(getThingFromPos(pos).uid) >= levelalvo) then

		setPlayerStorageValue(cid,xixistorage, getPlayerStorageValue(cid,xixistorage) + 1 )
		doPlayerSendTextMessage(cid,19,"Voce ja mijou em "..getPlayerStorageValue(cid, xixistorage).." Pessoas!" )
		else
		doPlayerSendTextMessage(cid,27,"Voce so pode mijar em player de level "..levelalvo.." ou maior!")
		end
		else
		doPlayerSendTextMessage(cid,27,"Voce deve mijar em um player!")
		end
		end
		end

	
-- LESTE -- 	
		if getCreatureLookDirection(cid) == EAST then
	doCreateItem(5665, 1, pos)

		local positionne = getCreaturePosition(cid)
		positionne.x = positionne.x + 1
		local levelalvo= 7
	
		if isInRange(pos, pos, pos)then
		if isPlayer(getThingFromPos(pos).uid) then
		if(getPlayerLevel(getThingFromPos(pos).uid) >= levelalvo) then

		setPlayerStorageValue(cid,xixistorage, getPlayerStorageValue(cid,xixistorage) + 1 )
		doPlayerSendTextMessage(cid,19,"Voce ja mijou em "..getPlayerStorageValue(cid, xixistorage).." Pessoas!" )
		else
		doPlayerSendTextMessage(cid,27,"Voce so pode mijar em player de level "..levelalvo.." ou maior!")
		end
		else
		doPlayerSendTextMessage(cid,27,"Voce deve mijar em um player!")
		end
		end
		
			addEvent (
		function (cid)
		if getTileItemById(pos,5665).uid > 0 then
		
doRemoveItem(getTileItemById(pos,5665).uid > 0 and getTileItemById(pos ,5665).uid )
end
		end, 500
	) 
	end
-- OESTE -- 

		if getCreatureLookDirection(cid) == WEST then

		local positionnw = getCreaturePosition(cid)
		positionnw.x = positionnw.x -1
		local levelalvo= 7
	
		if isInRange(pos, pos, pos)then
		if isPlayer(getThingFromPos(pos).uid) then
		if(getPlayerLevel(getThingFromPos(pos).uid) >= levelalvo) then

		setPlayerStorageValue(cid,xixistorage, getPlayerStorageValue(cid,xixistorage) + 1 )
		doPlayerSendTextMessage(cid,19,"Voce ja mijou em "..getPlayerStorageValue(cid, xixistorage).." Pessoas!" )
		else
		doPlayerSendTextMessage(cid,27,"Voce so pode mijar em player de level "..levelalvo.." ou maior!")
		end
		else
		doPlayerSendTextMessage(cid,27,"Voce deve mijar em um player!")
		end
		end
		end

-- FIM OESTE -- 
	
	


	
	
	addEvent (
		function (cid)
		local a = doCreateItem(2030, 13, pos)
		doDecayItem(a)
		end, 120
	) 
	addEvent (
		function (cid)
		local a = doCreateItem(2029, 13, pos)
		doDecayItem(a)
		end, 150
	) 
	addEvent (
		function (cid)
		local a = doCreateItem(2028, 13, pos)
		doDecayItem(a) 
		end, 200
	) 
	addEvent (
		function (cid)
		local a = doCreateItem(2027, 13, pos)
		doDecayItem(a)
		end, 250
		) 
	addEvent (
		function (cid)
		local a = doCreateItem(2026, 13, pos)
		doDecayItem(a)
		end, 300
	)
	addEvent (
		function (cid)
		local a = doCreateItem(2025, 13, pos)
		doDecayItem(a)
		end, 400
	)
	
	else
		doPlayerSendCancel(cid, 'You have to wait '.. times ..' seconds.')
		doSendMagicEffect(getThingPos(cid), 2)
	end
			else
		doPlayerSendTextMessage(cid,27,"Voce so pode mijar a partir do level "..meulevel.." ! ")
		end
	return true
end