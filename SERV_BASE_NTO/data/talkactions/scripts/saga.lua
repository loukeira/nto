function onSay(cid, words, param, channel)


local saga, my_saga_max = get_saga(cid) -- PEGA AS SAGAS DA DATABASE.


local waittime = 0.5
local storage_exhaust = 611432
if (getPlayerStorageValue(cid,storage_exhaust) >= os.time()) then
         doPlayerSendCancel(cid,"Voce so pode usar esse comando a cada "..waittime.." segundos!" ) 
return true
end


 if(param == '') then
		  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite {!saga up} para subir de saga, ou {!saga down} para descer de saga!\nA sua saga atual e a: [ "..saga.." / "..my_saga_max.." ] da vocation "..getPlayerVocationName(cid).." (MAX: "..#sagas[getPlayerVocationName(cid)]..")")
		  setPlayerStorageValue(cid,storage_exhaust, os.time() + waittime)
		 return true
 

 elseif(param == 'up') then

		 if saga >= #sagas[getPlayerVocationName(cid)] then
		 	 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce ja esta na maior saga da vocation "..getPlayerVocationName(cid).."\n[ "..saga.." / "..my_saga_max.." ]! ")
		return true
		end

		 if saga == my_saga_max then
		 	 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[SAGA UP]: Voce ja esta na maior das sagas conquistadas por voce da vocation "..getPlayerVocationName(cid).." [ "..saga.." / "..my_saga_max.." ] (MAX: "..#sagas[getPlayerVocationName(cid)]..")")
		return true
		end

storage_anbu = 674911
storage_akatsuki = 674921
		if saga == (#sagas[getPlayerVocationName(cid)] - 2 ) then
			if getPlayerStorageValue(cid,)
		end
		db.query("UPDATE `players` SET `saga` = `saga`+1 WHERE id = "..getPlayerGUID(cid).." ;")
		 setPlayerStorageValue(cid,storage_exhaust, os.time() + waittime)
		local saga, my_saga_max = get_saga(cid) -- PEGA AS SAGAS DA DATABASE.

		doSetCreatureOutfit(cid, {lookType = sagas[getPlayerVocationName(cid)][saga]}, -1)
		doSendMagicEffect(getThingPos(cid), 3)

		 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce esta na saga [ "..saga.."/ "..my_saga_max.." ] da vocation "..getPlayerVocationName(cid).." (MAX: "..#sagas[getPlayerVocationName(cid)]..")!")

		return true 


elseif(param == 'down') then

		if saga == tonumber(1) then
		 	 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "[SAGA DOWN]: Voce ja esta na primeira saga da vocation "..getPlayerVocationName(cid).." [ "..saga.." / "..my_saga_max.." ] (MAX: "..#sagas[getPlayerVocationName(cid)]..")! ")
		return true
		end


	 	db.query("UPDATE `players` SET `saga` = `saga`-1 WHERE id = "..getPlayerGUID(cid).." ;")
	    setPlayerStorageValue(cid,storage_exhaust, os.time() + waittime)

		local saga, my_saga_max = get_saga(cid) -- PEGA AS SAGAS DA DATABASE.

		doSetCreatureOutfit(cid, {lookType = sagas[getPlayerVocationName(cid)][saga]}, -1)
		doSendMagicEffect(getThingPos(cid), 3)
	    doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce esta na saga [ "..saga.." / "..my_saga_max.." ] da vocation "..getPlayerVocationName(cid).."! (MAX: "..#sagas[getPlayerVocationName(cid)]..")")
	 
		return true
else
			 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite {!saga up} para subir de saga, ou {!saga down} para descer de saga!")
		  setPlayerStorageValue(cid,storage_exhaust, os.time() + waittime)
		 return true
end


return true
end