-- Sexy System(Funny) by Cobraa.
 
function prepareToSexy(ela, ele)
	doCreatureSetLookDir(ela, 3)
	pos = getThingPos(ela)
	doTeleportThing(ele, {x=pos.x+3, y=pos.y, z=pos.z})
	doCreatureSetLookDir(ele, 3)
	mayNotMove(ele, true)
	mayNotMove(ela, true)
end
 
function Sexy(ela, ele, rounds)
	if rounds < 1 then
		mayNotMove(ele, false)
		mayNotMove(ela, false)
		setPlayerStorageValue(ele, 8958, -1)
		setPlayerStorageValue(ela, 8958, -1)
		return true
	end
	msg = {"me come!", "Me fode", "vai mais", "mais forte"}
	pos = getThingPos(ela)
	doTeleportThing(ele, {x=pos.x+1, y=pos.y, z=pos.z})
	addEvent(doTeleportThing, 500, ele, {x=pos.x+3, y=pos.y, z=pos.z})
	doSendAnimatedText(pos, msg[math.random(#msg)], math.random(255))
	setPlayerStorageValue(ele, 8958, 1)
	setPlayerStorageValue(ela, 8958, 1)
	addEvent(Sexy, 1000, ela, ele, rounds-1)
end
 
function onSay(cid, words, param)
	if words == "!sex" then
		x = getPlayerByName(param)
		if x then
			--if getPlayerSex(cid) == 0 then
			--	return doPlayerSendTextMessage(cid, 27, "Uma garota tem que ser convidada.")
			--end
			if param == getCreatureName(cid) then
				return doPlayerSendTextMessage(cid, 27, "Isto n&#227;o &#233; possivel")
			end
			if getDistanceBetween(getThingPos(cid), getThingPos(x)) > 4 then
				return doPlayerSendTextMessage(cid, 27, "Este player est&#225; muito longe para tranzar.")
			end
			if getPlayerStorageValue(x, 8958) == 1 or getPlayerStorageValue(cid, 8958) == 1 then
				return doPlayerSendTextMessage(cid, 27, "Voc&#234; ou a pessoa que convidou est&#225; tranzando neste momento.")
			end
			setPlayerStorageValue(x, 8956, cid)
			setPlayerStorageValue(x, 8957, 1)
			doPlayerSendTextMessage(x, 19, getCreatureName(cid)..", te convidou para tranzar, diga !aceitar ou !recusar")
			doPlayerSendTextMessage(cid, 19, getCreatureName(x)..", foi convidado(a) para tranzar aguarde sua resposta.")
		else
			doPlayerSendTextMessage(x, 27, "Player Not Found.")
		end
	elseif words == "!aceitar" then
		if getPlayerStorageValue(cid, 8957) == 1 then
			if getDistanceBetween(getThingPos(cid), getThingPos(getPlayerStorageValue(cid, 8956))) > 4 then
				return doPlayerSendTextMessage(cid, 27, "Este player est&#225; muito longe para dar uma resposta.")
			end
			doPlayerSendTextMessage(cid, 19, "Voc&#234; aceitou o convite de "..getCreatureName(getPlayerStorageValue(cid, 8956))..".")
			doPlayerSendTextMessage(getPlayerStorageValue(cid, 8956), 19, "Seu convite foi aceito.")
			setPlayerStorageValue(cid, 8957, -1)
			prepareToSexy(cid, getPlayerStorageValue(cid, 8956))
			addEvent(Sexy, 800, cid, getPlayerStorageValue(cid, 8956), 20)
		else
			doPlayerSendTextMessage(cid, 27, "Voc&#234; n&#227;o tem nenhum convite de tranza para aceitar.")
		end
	elseif words == "!recusar" then
		if getPlayerStorageValue(cid, 8957) == 1 then
			if getDistanceBetween(getThingPos(cid), getThingPos(getPlayerStorageValue(cid, 8956))) > 4 then
				return doPlayerSendTextMessage(cid, 27, "Este player est&#225; muito longe para dar uma resposta.")
			end
			doPlayerSendTextMessage(cid, 19, "Voc&#234; recusou o convite de "..getCreatureName(getPlayerStorageValue(cid, 8956))..".")
			doPlayerSendTextMessage(getPlayerStorageValue(cid, 8956), 19, "Seu convite foi recusado.")
			setPlayerStorageValue(cid, 8957, -1)
		else
			doPlayerSendTextMessage(cid, 27, "Voc&#234; n&#227;o tem nenhum convite de tranza para recusar.")
		end
	end
	return true
end
 