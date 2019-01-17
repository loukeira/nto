

function onThink(cid,think,interval,topos)
		
			
			for j = 1,#sto_global_trainer_tempo do

				if getGlobalStorageValue(sto_global_trainer_tempo[j]) < os.time() and getGlobalStorageValue(sto_cave_ligado[j]) == 1 then 
				 		setGlobalStorageValue(sto_global_acc_id[j],-1) 
						setGlobalStorageValue(sto_cave_ligado[j],0) --desligado trainer 1
				end

			end

	if #getPlayersOnline() >= 1 then
     for i = 1,#getPlayersOnline() do

     		repeat
	     		 if getPlayerStorageValue(getPlayersOnline()[i],sto_player_ligado) ~= 1 then  
	     		 break 
	     		 end

						p = 1
						for p = 1,#sto_global_trainer_tempo do

							local area = {x = trainer[""..p..""].x, y = trainer[""..p..""].y, z = trainer[""..p..""].z}  --MUDAR INDICE
                            if isInArea(getPlayerPosition(getPlayersOnline()[i]), area, area) and getGlobalStorageValue(sto_global_trainer_tempo[p]) < os.time() then  
								doPlayerPopupFYI(getPlayersOnline()[i], "Seu tempo como dono do trainer "..p.." expirou. ")
	 							 doPlayerSendTextMessage(getPlayersOnline()[i], MESSAGE_STATUS_CONSOLE_BLUE, "Seu tempo como dono do trainer "..p.." expirou.")
	 							--doTeleportThing(getPlayersOnline()[i], getTownTemplePosition(getPlayerTown(pid)))
	 							local destino = {x = frompos_trainer[""..p..""].x, y = frompos_trainer[""..p..""].y, z = frompos_trainer[""..p..""].z}  --MUDAR INDICE
	 							doTeleportThing(getPlayersOnline()[i], destino)
	 							doSendMagicEffect(getCreaturePosition(getPlayersOnline()[i]), 3)
	 							--setGlobalStorageValue(sto_global_acc_id[p],-1)
	 							setPlayerStorageValue(getPlayersOnline()[i],sto_player_ligado,  0) --player sto off -- ALTERAR INDICE

                            end


						end
		
		    until true
        end
     end


return true
end