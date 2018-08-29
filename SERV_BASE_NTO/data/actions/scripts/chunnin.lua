function onUse(cid, item, frompos, item2, topos)


        if (item.actionid == 1081) and (getGlobalStorageValue(chunnin.storage.bau1) == -1) then
        					doPlayerSendTextMessage(cid,18, "[CHUNNIN] Voce obteve o pergaminho!") 
        					--doSendMagicEffect(getCreaturePosition(cid), 2)
        					setGlobalStorageValue(chunnin.storage.bau1,1)
        					doPlayerAddItem(cid, 9930,1)

        					for _, pid in pairs(getPlayersOnline()) do
               				local a = chunnin.floresta.bau.from1
               				local b = chunnin.floresta.bau.to1
               				if isInArea(getThingPos(pid), a, b) then
                  				   doTeleportThing(pid, chunnin.pos.goflorest.team1)
                   				   doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "GOGOGO! va em busca do outro pergaminho!")
              				end
              				end

        elseif (item.actionid == 1082) and (getGlobalStorageValue(chunnin.storage.bau2) == -1) then
                  doPlayerSendTextMessage(cid,18, "[CHUNNIN] Voce obteve o pergaminho!") 
                  --doSendMagicEffect(getCreaturePosition(cid), 2)
                  setGlobalStorageValue(chunnin.storage.bau2,1)
                  doPlayerAddItem(cid, 9931,1)

                  for _, pid in pairs(getPlayersOnline()) do
                      local a = chunnin.floresta.bau.from2
                      local b = chunnin.floresta.bau.to2
                      if isInArea(getThingPos(pid), a, b) then
                             doTeleportThing(pid, chunnin.pos.goflorest.team2)
                             doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "GOGOGO! va em busca do outro pergaminho!")
                      end
                      end

       elseif (item.actionid == 1083) and (getGlobalStorageValue(chunnin.storage.bau3) == -1) then
                  doPlayerSendTextMessage(cid,18, "[CHUNNIN] Voce obteve o pergaminho!") 
                  --doSendMagicEffect(getCreaturePosition(cid), 2)
                  setGlobalStorageValue(chunnin.storage.bau3,1)
                  doPlayerAddItem(cid, 9930,1)

                  for _, pid in pairs(getPlayersOnline()) do
                      local a = chunnin.floresta.bau.from3
                      local b = chunnin.floresta.bau.to3
                      if isInArea(getThingPos(pid), a, b) then
                             doTeleportThing(pid, chunnin.pos.goflorest.team3)
                             doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "GOGOGO! va em busca do outro pergaminho!")
                      end
                      end


        end



return true
end