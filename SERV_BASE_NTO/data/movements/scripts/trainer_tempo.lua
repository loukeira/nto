function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

-- soma =0 
-- for vod,ka in pairs(aid_trainer) do
--         soma = soma + 1
-- end

-- for i =1, soma do

-- 	if item.actionid == aid_trainer[""..i..""] then  --MUDAR AID

		if (trainer_tempo(cid) > 0) then --MUDAR INDICES

					if getPlayerStorageValue(cid,trainer_auxiliar) == -1 then

						  if item.actionid == 4541 then
						           local pos = {x= getCreaturePosition(cid).x-1,y = getCreaturePosition(cid).y,z=getCreaturePosition(cid).z}
						           doTeleportThing(cid, pos)
						  elseif item.actionid == 4542 then
						           local pos = {x= getCreaturePosition(cid).x+1,y = getCreaturePosition(cid).y,z=getCreaturePosition(cid).z}
						          doTeleportThing(cid, pos)

						  end

					   				setPlayerStorageValue(cid,sto_player_time,os.time()+trainer_tempo(cid))

									local tempo = math.floor( (getPlayerStorageValue(cid,sto_player_time) - os.time()) ) --MUDAR INDICE
									doPlayerSendTextMessage(cid, 25, "Bem vindo ao seu trainer! Voce tem mais "..tempo.." seg de trainer.")
									doSendMagicEffect(getCreaturePosition(cid), 3)
									setPlayerStorageValue(cid,trainer_auxiliar,1)

					elseif getPlayerStorageValue(cid,trainer_auxiliar) == 1 then
								
									local tempo = math.floor( (getPlayerStorageValue(cid,sto_player_time) - os.time()) ) --MUDAR INDICE

									db.query("UPDATE players SET trainer_tempo = "..tempo.." WHERE id = "..getPlayerGUID(cid).." ;")
									if trainer_tempo(cid) <= 0 then 
									doPlayerSendTextMessage(cid, 25, "Ate mais! Voce nao possui mais tempo de trainer.")
									db.query("UPDATE players SET trainer_tempo = 0 WHERE id = "..getPlayerGUID(cid).." ;")

									else
									doPlayerSendTextMessage(cid, 25, "Ate mais! Voce ainda possui "..tempo.." seg de trainer.")
									end
									--setPlayerStorageValue(cid,sto_player_time,trainer_tempo(cid)) -- aloca na sto o quanto tempo resta
		
						  if item.actionid == 4541 then
						           local pos = {x= getCreaturePosition(cid).x+1,y = getCreaturePosition(cid).y,z=getCreaturePosition(cid).z}
						           doTeleportThing(cid, pos)
						  elseif item.actionid == 4542 then
						           local pos = {x= getCreaturePosition(cid).x-1,y = getCreaturePosition(cid).y,z=getCreaturePosition(cid).z}
						          doTeleportThing(cid, pos)
						  end

									setPlayerStorageValue(cid,trainer_auxiliar,-1)
					end
	


		else
			--local destino = {x = frompos_trainer[""..i..""].x, y = frompos_trainer[""..i..""].y, z = frompos_trainer[""..i..""].z}  --MUDAR INDICE
			doTeleportThing(cid, fromPosition) 
			doSendMagicEffect(getCreaturePosition(cid), 3)
			doPlayerSendCancel(cid, "Para acessar o trainer adquira o item no npc!")
		end

-- 		break
-- 	end
-- end

	return true
end
