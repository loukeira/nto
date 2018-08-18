

function onThink(cid, interval)
	if(not isCreature(cid)) then
		return true
	end


--if (getGlobalStorageValue(chunnin.storage.ativo) == -1 ) then return true end


local id_item_pergaminho_ar = 9930
local id_item_pergaminho_terra = 9931
local storage_inicio_arena = 342230


--5 minutos
local minutos = 2
local tempo_arena = 60*minutos

local quantplayer = chunnin.storage.quant_player_tem_para_arena



	if getGlobalStorageValue(quantplayer) > 0 then 

					if getGlobalStorageValue(chunnin.storage.msg_unica) == -1 then
						for _, index in ipairs(chunnin.getPlayersInEvent()) do
							 doPlayerSendTextMessage(index.pid,18,"[CHUNNIN] iniciou o contador regressivo de "..minutos.." min para o inicio das batalhas na arena! Corra e passe, senao voce sera eliminado! ")
					    end
					    setGlobalStorageValue(chunnin.storage.msg_unica,1)
					end

					if getGlobalStorageValue(chunnin.storage.arena_on) == -1 then
						setGlobalStorageValue(storage_inicio_arena, os.time() + tempo_arena)
						setGlobalStorageValue(chunnin.storage.arena_on,1)
					end


			if ( getGlobalStorageValue(storage_inicio_arena) < os.time() ) or (getGlobalStorageValue(quantplayer) > 15) then
						if getGlobalStorageValue(chunnin.storage.arena_aux_1) == -1 then

							if (getGlobalStorageValue(quantplayer) > 8) then
					            for _, pid in pairs(getPlayersOnline()) do
					                if isInArea(getThingPos(pid), chunnin.pos.wait_arena.from1, chunnin.pos.wait_arena.to1) then
					                        doTeleportThing(pid, chunnin.pos.wait_arena2.from1)
					                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "[CHUNNIN] Espere a arena comecar!")
					                        setPlayerStorageValue(pid,chunnin.pvp.oitavas,0)


					                        	if getGlobalStorageValue(quantplayer)<=15 then
					                        		if (getGlobalStorageValue(quantplayer) == 15) and (getGlobalStorageValue(arena_aux_2) ==-1) then
						                        			local num_sorteado = math.random(1,getGlobalStorageValue(quantplayer))
							                        		if num_sorteado == getPlayerStorageValue(pid,quantplayer) then
								                        		   setPlayerStorageValue(pid,chunnin.pvp.oitavas,-1)
								                        		   setPlayerStorageValue(pid,chunnin.pvp.quartas,0)
							                      				   doTeleportThing(pid,chunnin.pos.wait_arena3.from1)
							                      				   setGlobalStorageValue(arena_aux_2,1)
							                      				   doBroadcastMessage("o player "..getCreatureName(pid).." foi sorteado para avancar para prox fase! ")

							                        		end

						                        	elseif (getGlobalStorageValue(quantplayer)==14) and (getGlobalStorageValue(arena_aux_2) < 2) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,0) end
							                        		
							                        		while(getGlobalStorageValue(arena_aux_2) <2) do
							                        			local num_sorteado = math.random(1,(getGlobalStorageValue(quantplayer)-getGlobalStorageValue(arena_aux_2)))
							                        			   setPlayerStorageValue(pid,chunnin.pvp.oitavas,-1)
								                        		   setPlayerStorageValue(pid,chunnin.pvp.quartas,0)
							                      				   doTeleportThing(pid, chunnin.pos.wait_arena3.from1)
							                      				   setGlobalStorageValue(arena_aux_2,1)
							                      				   doBroadcastMessage("o player "..getCreatureName(pid).." foi sorteado para avancar para prox fase! ")
							                        			   setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)

							                        		end

							                        elseif (getGlobalStorageValue(quantplayer)==13) and (getGlobalStorageValue(arena_aux_2) < 3) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,0) end
							                        		
							                        		while(getGlobalStorageValue(arena_aux_2) <3) do
							                        			local num_sorteado = math.random(1,(getGlobalStorageValue(quantplayer)-getGlobalStorageValue(arena_aux_2)))
							                        			   setPlayerStorageValue(pid,chunnin.pvp.oitavas,-1)
								                        		   setPlayerStorageValue(pid,chunnin.pvp.quartas,0)
							                      				   doTeleportThing(pid, chunnin.pos.wait_arena3.from1)
							                      				   setGlobalStorageValue(arena_aux_2,1)
							                      				   doBroadcastMessage("o player "..getCreatureName(pid).." foi sorteado para avancar para prox fase! ")
							                        			   setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)

							                        		end
							                        elseif (getGlobalStorageValue(quantplayer)==12) and (getGlobalStorageValue(arena_aux_2) < 4) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,0) end
							                        		
							                        		while(getGlobalStorageValue(arena_aux_2) <4) do
							                        			local num_sorteado = math.random(1,(getGlobalStorageValue(quantplayer)-getGlobalStorageValue(arena_aux_2)))
							                        			   setPlayerStorageValue(pid,chunnin.pvp.oitavas,-1)
								                        		   setPlayerStorageValue(pid,chunnin.pvp.quartas,0)
							                      				   doTeleportThing(pid,chunnin.pos.wait_arena3.from1)
							                      				   setGlobalStorageValue(arena_aux_2,1)
							                      				   doBroadcastMessage("o player "..getCreatureName(pid).." foi sorteado para avancar para prox fase! ")
							                        			   setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)

							                        		end


							                        elseif (getGlobalStorageValue(quantplayer)==11) and (getGlobalStorageValue(arena_aux_2) < 5) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,0) end
							                        		
							                        		while(getGlobalStorageValue(arena_aux_2) <5) do
							                        			local num_sorteado = math.random(1,(getGlobalStorageValue(quantplayer)-getGlobalStorageValue(arena_aux_2)))
							                        			   setPlayerStorageValue(pid,chunnin.pvp.oitavas,-1)
								                        		   setPlayerStorageValue(pid,chunnin.pvp.quartas,0)
							                      				   doTeleportThing(pid, chunnin.pos.wait_arena3.from1)
							                      				   setGlobalStorageValue(arena_aux_2,1)
							                      				   doBroadcastMessage("o player "..getCreatureName(pid).." foi sorteado para avancar para prox fase! ")
							                        			   setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)

							                        		end
							                        elseif (getGlobalStorageValue(quantplayer)==10) and (getGlobalStorageValue(arena_aux_2) < 6) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,0) end
							                        		
							                        		while(getGlobalStorageValue(arena_aux_2) <6) do
							                        			local num_sorteado = math.random(1,(getGlobalStorageValue(quantplayer)-getGlobalStorageValue(arena_aux_2)))
							                        			   setPlayerStorageValue(pid,chunnin.pvp.oitavas,-1)
								                        		   setPlayerStorageValue(pid,chunnin.pvp.quartas,0)
							                      				   doTeleportThing(pid, chunnin.pos.wait_arena3.from1)
							                      				   setGlobalStorageValue(arena_aux_2,1)
							                      				   doBroadcastMessage("o player "..getCreatureName(pid).." foi sorteado para avancar para prox fase! ")
							                        			   setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)

							                        		end
							                        elseif (getGlobalStorageValue(quantplayer)==9) and (getGlobalStorageValue(arena_aux_2) < 7) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,0) end
							                        		
							                        		while(getGlobalStorageValue(arena_aux_2) <7) do
							                        			local num_sorteado = math.random(1,(getGlobalStorageValue(quantplayer)-getGlobalStorageValue(arena_aux_2)))
							                        			   setPlayerStorageValue(pid,chunnin.pvp.oitavas,-1)
								                        		   setPlayerStorageValue(pid,chunnin.pvp.quartas,0)
							                      				   doTeleportThing(pid, chunnin.pos.wait_arena3.from1)
							                      				   setGlobalStorageValue(arena_aux_2,1)
							                      				   doBroadcastMessage("o player "..getCreatureName(pid).." foi sorteado para avancar para prox fase! ")
							                        			   setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)

							                        		end


					                        		end

					                        	end
					                end
					            end
				            end




				            setGlobalStorageValue(chunnin.storage.arena_aux_1,1)
				        end
			end


	end


	
	return true
end


