

function onThink(cid, interval)
	if(not isCreature(cid)) then
		return true
	end


--if (getGlobalStorageValue(chunnin.storage.ativo) == -1 ) then return true end


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
						setGlobalStorageValue(chunnin.storage.inicio_arena, os.time() + tempo_arena)
						setGlobalStorageValue(chunnin.storage.arena_on,1)
					end



					local boi = 2312
					if getGlobalStorageValue(boi) == -1 then setGlobalStorageValue(boi, os.time() + 10) doPlayerSendTextMessage(cid,18,"deu") end

			if ( getGlobalStorageValue(boi) < os.time() ) or (getGlobalStorageValue(quantplayer) > 15) then

			--if ( getGlobalStorageValue(chunnin.storage_inicio_arena) < os.time() ) or (getGlobalStorageValue(quantplayer) > 15) then


						if getGlobalStorageValue(chunnin.storage.arena_aux_1) == -1 then

							if (getGlobalStorageValue(quantplayer) > 8) then
					            for _, pid in pairs(getPlayersOnline()) do
					                if isInArea(getThingPos(pid), chunnin.pos.wait_arena.from1, chunnin.pos.wait_arena.to1) then
					                        doTeleportThing(pid, chunnin.pos.wait_arena2.from1)
					                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "[CHUNNIN] Espere a arena comecar!")
        									db.query("UPDATE chunnin_players SET oitavas = 0 WHERE name = '"..getPlayerName(pid).."' ;")


					                        	    if getGlobalStorageValue(quantplayer)<=15 then
							                        		if (getGlobalStorageValue(quantplayer) == 15) and (getGlobalStorageValue(arena_aux_2) ==-1) then
								                        			 for _, index in ipairs(chunnin.getPlayersInEvent()) do
		        																if (index.pos_oitavas == 1) then
		        																	db.query("UPDATE chunnin_players SET oitavas = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
													        						db.query("UPDATE chunnin_players SET quartas = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
											                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
											                      				    setGlobalStorageValue(arena_aux_2,1)
												                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

		        																end
		        													 end

										                        	

									                        end

						                        	elseif (getGlobalStorageValue(quantplayer)==14) and (getGlobalStorageValue(arena_aux_2) <=2) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,1) end
							                        		
					                       							while getGlobalStorageValue(arena_aux_2) <=  2 do
							                       					for _, index in ipairs(chunnin.getPlayersInEvent()) do
	    																if (index.pos_oitavas == getGlobalStorageValue(arena_aux_2)) then
	    																	db.query("UPDATE chunnin_players SET oitavas = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
											        						db.query("UPDATE chunnin_players SET quartas = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
									                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
									                      				    setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)
										                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

	    																end
	    															end

	    													 end
				

							                        elseif (getGlobalStorageValue(quantplayer)==13) and (getGlobalStorageValue(arena_aux_2) <= 3) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,1) end
							                        		
					                       							while getGlobalStorageValue(arena_aux_2) <=  3 do
							                       					for _, index in ipairs(chunnin.getPlayersInEvent()) do
	    																if (index.pos_oitavas == getGlobalStorageValue(arena_aux_2)) then
	    																	db.query("UPDATE chunnin_players SET oitavas = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
											        						db.query("UPDATE chunnin_players SET quartas = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
									                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
									                      				    setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)
										                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

	    																end
	    															end

	    													 end

							                        elseif (getGlobalStorageValue(quantplayer)==12) and (getGlobalStorageValue(arena_aux_2) <= 4) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,1) end
							                        		
					                       						while getGlobalStorageValue(arena_aux_2) <=  4 do
							                       					for _, index in ipairs(chunnin.getPlayersInEvent()) do
	    																if (index.pos_oitavas == getGlobalStorageValue(arena_aux_2)) then
	    																	db.query("UPDATE chunnin_players SET oitavas = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
											        						db.query("UPDATE chunnin_players SET quartas = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
									                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
									                      				    setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)
										                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

	    																end
	    															end

	    													 end


							                        elseif (getGlobalStorageValue(quantplayer)==11) and (getGlobalStorageValue(arena_aux_2) <= 5) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,1) end
							                        		
				                       							while getGlobalStorageValue(arena_aux_2) <=  5 do
							                       					for _, index in ipairs(chunnin.getPlayersInEvent()) do
	    																if (index.pos_oitavas == getGlobalStorageValue(arena_aux_2)) then
	    																	db.query("UPDATE chunnin_players SET oitavas = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
											        						db.query("UPDATE chunnin_players SET quartas = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
									                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
									                      				    setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)
										                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

	    																end
	    															end

	    													 end
							                        elseif (getGlobalStorageValue(quantplayer)==10) and (getGlobalStorageValue(arena_aux_2) <= 6) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,1) end
							                        		
				                       							while getGlobalStorageValue(arena_aux_2) <=  6 do 
							                       					for _, index in ipairs(chunnin.getPlayersInEvent()) do
	    																if (index.pos_oitavas == getGlobalStorageValue(arena_aux_2)) then
	    																	db.query("UPDATE chunnin_players SET oitavas = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
											        						db.query("UPDATE chunnin_players SET quartas = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
									                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
									                      				    setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)
										                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

	    																end
	    															end

	    													 end
							                        elseif (getGlobalStorageValue(quantplayer)==9) and (getGlobalStorageValue(arena_aux_2) <= 7) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,1) end
							                        		
							                        		while getGlobalStorageValue(arena_aux_2) <=  7 do 
							                       					for _, index in ipairs(chunnin.getPlayersInEvent()) do
	    																if (index.pos_oitavas == getGlobalStorageValue(arena_aux_2)) then
	    																	db.query("UPDATE chunnin_players SET oitavas = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
											        						db.query("UPDATE chunnin_players SET quartas = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
									                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
									                      				    setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)
										                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

	    																end
	    															end

	    													 end


					                        		end

					                        	end
					                end
					            
					        elseif (getGlobalStorageValue(quantplayer) <= 8) and (getGlobalStorageValue(quantplayer)> 4)then
					            for _, pid in pairs(getPlayersOnline()) do
					                if isInArea(getThingPos(pid), chunnin.pos.wait_arena.from1, chunnin.pos.wait_arena.to1) then
					                        doTeleportThing(pid, chunnin.pos.wait_arena3.from1)
					                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "[CHUNNIN] Espere a arena comecar!")
											db.query("UPDATE chunnin_players SET quartas = 0 WHERE name = '"..getPlayerName(pid).."' ;")
				            				setGlobalStorageValue(chunnin.storage.arena_aux_1,1) --OBSERVAR
				            				setGlobalStorageValue(chunnin.storage.arena_aux_3,1) --OBSERVAR

					                        	if getGlobalStorageValue(quantplayer)<=7 then
					                        		if (getGlobalStorageValue(quantplayer) == 7) and (getGlobalStorageValue(arena_aux_2) ==-1) then

			                        					     for _, index in ipairs(chunnin.getPlayersInEvent()) do
        																if (index.pos_oitavas == 1) then
        																	db.query("UPDATE chunnin_players SET quartas = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
											        						db.query("UPDATE chunnin_players SET semi = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
									                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
									                      				    setGlobalStorageValue(arena_aux_2,1)
										                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

        																end
        													 end

						                        			
							                        elseif (getGlobalStorageValue(quantplayer) ==6) and (getGlobalStorageValue(arena_aux_2) <= 2) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,1) end
							                        		
							                       				while getGlobalStorageValue(arena_aux_2) <=  2 do 
							                       					for _, index in ipairs(chunnin.getPlayersInEvent()) do
	    																if (index.pos_oitavas == getGlobalStorageValue(arena_aux_2)) then
	    																	db.query("UPDATE chunnin_players SET quartas = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
											        						db.query("UPDATE chunnin_players SET semi = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
									                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
									                      				    setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)
										                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

	    																end
	    															end

	    													 	end
	    											elseif (getGlobalStorageValue(quantplayer) ==5) and (getGlobalStorageValue(arena_aux_2) <= 3) then
							                        		if getGlobalStorageValue(arena_aux_2) == -1 then setGlobalStorageValue(arena_aux_2,1) end
							                        		
							                       				while getGlobalStorageValue(arena_aux_2) <=  3 do 
							                       					for _, index in ipairs(chunnin.getPlayersInEvent()) do
	    																if (index.pos_oitavas == getGlobalStorageValue(arena_aux_2)) then
	    																	db.query("UPDATE chunnin_players SET quartas = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
											        						db.query("UPDATE chunnin_players SET semi = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
									                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
									                      				    setGlobalStorageValue(arena_aux_2,getGlobalStorageValue(arena_aux_2)+1)
										                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

	    																end
	    															end

	    													 	end


			


							                        end


							                    end
							        end
							    end

							elseif (getGlobalStorageValue(quantplayer) <= 4) and (getGlobalStorageValue(quantplayer)>2) then
					            for _, pid in pairs(getPlayersOnline()) do
					                if isInArea(getThingPos(pid), chunnin.pos.wait_arena.from1, chunnin.pos.wait_arena.to1) then
					                        doTeleportThing(pid, chunnin.pos.wait_arena4.from1)
					                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "[CHUNNIN] Espere a arena comecar!")
											db.query("UPDATE chunnin_players SET semi = 0 WHERE name = '"..getPlayerName(pid).."' ;")
				            				setGlobalStorageValue(chunnin.storage.arena_aux_1,1) --OBSERVAR
				            				setGlobalStorageValue(chunnin.storage.arena_aux_3,1) --OBSERVAR
				            				setGlobalStorageValue(chunnin.storage.arena_aux_5,1) --OBSERVAR

					                        	if getGlobalStorageValue(quantplayer)<=3 then
					                        		if (getGlobalStorageValue(quantplayer) == 3) and (getGlobalStorageValue(arena_aux_2) ==-1) then

			                        					     for _, index in ipairs(chunnin.getPlayersInEvent()) do
        																if (index.pos_oitavas == 1) then
        																	db.query("UPDATE chunnin_players SET semi = -1 WHERE name = '"..getPlayerName(index.pid).."' ;")
											        						db.query("UPDATE chunnin_players SET final = 0 WHERE name = '"..getPlayerName(index.pid).."' ;")
									                      				    doTeleportThing(index.pid,chunnin.pos.wait_arena3.from1)
									                      				    setGlobalStorageValue(arena_aux_2,1)
										                      				doBroadcastMessage("o player "..getCreatureName(index.pid).." foi sorteado para avancar para prox fase! ")

        																end
        													 end

						                        	
							                        		


			


							                        end


							                    end
							        end
							    end


							elseif (getGlobalStorageValue(quantplayer) <= 2) and (getGlobalStorageValue(quantplayer)>0) then
					            for _, pid in pairs(getPlayersOnline()) do
					                if isInArea(getThingPos(pid), chunnin.pos.wait_arena.from1, chunnin.pos.wait_arena.to1) then
					                        	if getGlobalStorageValue(quantplayer)==1 then
					                        		setGlobalStorageValue(chunnin.storage.arena_aux_9,1) --OBSERVAR
			                      				    doTeleportThing(pid,chunnin.townid)
										            chunnin.resetPlayerStorages()
										            chunnin.resetGlobalStorages()
										            chunnin.trucatePlayersInEvent()			
										            doBroadcastMessage("o player "..getCreatureName(pid).." foi o unico sobrevivente do chunnin! parabens!! ")
										            break
							                    end
					                        doTeleportThing(pid, chunnin.pos.wait_arena5.from1)
					                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "[CHUNNIN] Espere a arena comecar!")
											db.query("UPDATE chunnin_players SET final = 0 WHERE name = '"..getCreatureName(pid).."' ;")
				            				setGlobalStorageValue(chunnin.storage.arena_aux_1,1) --OBSERVAR
				            				setGlobalStorageValue(chunnin.storage.arena_aux_3,1) --OBSERVAR
				            				setGlobalStorageValue(chunnin.storage.arena_aux_5,1) --OBSERVAR
				            				setGlobalStorageValue(chunnin.storage.arena_aux_7,1) --OBSERVAR

							        end
							    end








				            end


							if getGlobalStorageValue(chunnin.storage.arena_aux_11) == -1 then 
									for _, pid in pairs(getPlayersOnline()) do
						            	local pos = {  from = {x =1096 , y =353 , z = 7 },   to = { x =1146 , y =402 , z =7 }  }
									    if isInArea(getThingPos(pid), pos.from, pos.to) then
					    					doTeleportThing(pid, chunnin.townid)
					                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "[CHUNNIN] Voce foi retirado do exame!")
											db.query("DELETE FROM`chunnin_players` WHERE name = '"..getCreatureName(pid).."'  ;")  
										end
									end
								setGlobalStorageValue(chunnin.storage.arena_aux_11,1) 
							end


				            setGlobalStorageValue(chunnin.storage.arena_aux_1,1)
				        end
			end


	end


	
	return true
end


