function onUse(cid, item, frompos, item2, topos)
if getGlobalStorageValue(chunnin.storage.bau1) == -1 then
					--doPlayerSendCancel(cid, "[CHUNNIN] Voce obteve o pergaminho!") 
					--doSendMagicEffect(getCreaturePosition(cid), 2)
					--setGlobalStorageValue(liberar_floresta_1,1)
					setGlobalStorageValue(chunnin.storage.bau1,1)
					doPlayerAddItem(cid, 9930,1)

					for _, pid in pairs(getPlayersOnline()) do
       				--if isInArea(getThingPos(pid), chunnin.pos.zona.from1, chunnin.pos.zona.to1) then
       				local a = {x=1097,y=373,z=7}
       				local b = {x= 1099,y=375,z=7}
       				if isInArea(getThingPos(pid), a, b) then
          				   doTeleportThing(pid, chunnin.pos.goflorest.from1)
           				   doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "GOGOGO! va em busca do outro pergaminho!")
      				end
      				end


end



return true
end