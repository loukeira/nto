

function onThink(cid,think,interval,topos)
		
soma =0 
for vod,ka in pairs(trainer) do
        soma = soma + 1
end


	if #getPlayersOnline() >= 1 then
     for i = 1,#getPlayersOnline() do
							--doPlayerSendTextMessage(getPlayersOnline()[i], 18, ""..soma.."")
							--setPlayerStorageValue(getPlayersOnline()[i], sto_player_time, getPlayerStorageValue(getPlayersOnline()[i], sto_player_time) + os.time() )
							local tempo = (getPlayerStorageValue(getPlayersOnline()[i],sto_player_time) - os.time()) 
							if tempo < 0 then tempo = 0 end

	     		-- doPlayerSendTextMessage(getPlayersOnline()[i],18,""..tempo.." :           CONTADOR DE SEGUNDOS ATIVOS RESTANTE")

	     		 --doPlayerSendTextMessage(getPlayersOnline()[i],18,""..trainer_tempo(getPlayersOnline()[i])..":           QUANTO DE TRAINER TEMPO RESTA EM seg restantes")

	     		 	     		-- doPlayerSendTextMessage(getPlayersOnline()[i],18,""..getPlayerStorageValue(getPlayersOnline()[i],trainer_auxiliar).." storage")


     		repeat
	     		 if getPlayerStorageValue(getPlayersOnline()[i],trainer_player_power) == 0 then  
	     		 --doPlayerSendTextMessage(getPlayersOnline()[i],18,"TRUE")

	     		 --doPlayerSendTextMessage(getPlayersOnline()[i],18,"desligado")
	     		 break 
	     		 end


							--setPlayerStorageValue(cid,sto_player_time,os.time()+trainer_tempo(cid))
							local tempo = (getPlayerStorageValue(getPlayersOnline()[i],sto_player_time) - os.time()) 

						for p = 1,soma do

							local area = {x = trainer[""..p..""].x, y = trainer[""..p..""].y, z = trainer[""..p..""].z}  --MUDAR INDICE
                            if (isInArea(getPlayerPosition(getPlayersOnline()[i]), area, area)) and tempo <= 0  then

								doPlayerPopupFYI(getPlayersOnline()[i], "Seu tempo de trainer  expirou. ")
	 							 doPlayerSendTextMessage(getPlayersOnline()[i], MESSAGE_STATUS_CONSOLE_BLUE, "Seu tempo de trainer  expirou. ")
	 							--doTeleportThing(getPlayersOnline()[i], getTownTemplePosition(getPlayerTown(pid)))	 							
	 							doTeleportThing(getPlayersOnline()[i], townpos)

	 							doSendMagicEffect(getCreaturePosition(getPlayersOnline()[i]), 3)
								db.query("UPDATE players SET trainer_tempo = 0 WHERE id = "..getPlayerGUID(getPlayersOnline()[i]).." ;")

					   			setPlayerStorageValue(getPlayersOnline()[i],sto_player_time,0)
								setPlayerStorageValue(getPlayersOnline()[i],trainer_player_power,0)
								setPlayerStorageValue(getPlayersOnline()[i],trainer_auxiliar,-1)
								
                            end





						end
		
		    until true
        end
     end


return true
end