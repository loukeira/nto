-- local pos1 = {x=798,y=1257,z=7}
-- local pos2 = {x=799,y=1257,z=7}
-- local pos3 = {x=998,y=998,z=7}

-- local x = {1000,999, 998}
-- local y = {1000,999, 998}
-- local z = {7}

-- function isInLocal(cid,posx,posy,posz)
-- if(getPlayerPosition(cid).x) == posx and (getPlayerPosition(cid).y) == posy and (getPlayerPosition(cid).z) == posz then
-- return true
-- else
-- return false
-- end
-- end

-- function onStepIn(cid, item, item2, position, fromPosition)
-- local id_card = 7443


--   if not isPlayer(cid) then
--    return true
--   end

-- local pos = getCreaturePosition(cid)


--   if (item.actionid == 4540) then

--   	--local playerpos = getThingfromPos(pos1) -- pega informações da creature da posição

-- 			-- if isInArea(pos, pos1, pos1) and isPlayer(cid) then
-- 			-- 	if isInArea(getCreaturePosition(playerpos.cid),pos2,pos2) and isPlayer(playerpos.cid) then
-- 			-- 	doPlayerSendTextMessage(cid,18,"Ja tem player!")
-- 			-- 	doTeleportThing(cid,fromPosition)	
-- 			-- 	doSendMagicEffect(getCreaturePosition(cid), 3)

-- 			-- 	return true
-- 			-- 	end

-- 			-- elseif isInArea(pos, pos2, pos2) and isPlayer(cid) == true then
-- 			-- doPlayerSendTextMessage(cid,18,"Ja tem player!")
-- 			-- doTeleportThing(cid,fromPosition)	
-- 			-- doSendMagicEffect(getCreaturePosition(cid), 3)
-- 			-- 	return true

-- 			-- elseif isInArea(pos, pos3, pos3) and isPlayer(cid) == true then
-- 			-- doPlayerSendTextMessage(cid,18,"Ja tem player!")
-- 			-- doTeleportThing(cid,fromPosition)	
-- 			-- doSendMagicEffect(getCreaturePosition(cid), 3)
-- 			-- 	return true

-- 			-- else

-- 				if getPlayerItemCount(cid,id_card) >=1 then
-- 				doPlayerSendTextMessage(cid,18,"VOCE TEM O CARD!")
-- 				doSendMagicEffect(getCreaturePosition(cid), 3)
-- 				else
-- 				doPlayerSendTextMessage(cid,18,"VOCE NAO TEM O CARD!")
-- 				doTeleportThing(cid,fromPosition)
-- 				doSendMagicEffect(getCreaturePosition(cid), 3)
-- 				return true
-- 				end
-- 			end
      
--     end
				
-- return true
-- end



-- CARLIN WAR
-- local sto = 93122
-- if getGlobalStorageValue(sto) - os.time() < 0 then
-- 			setGlobalStorageValue(sto,os.time() + 5)
-- 		for _, pid in pairs(getPlayersOnline()) do
--                             if isInRange(getThingPos(pid), pos, pos1) then                            
--  							 doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "TRUE")
--   							break
--                             end
--         end
-- end


function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

soma =0 
for vod,ka in pairs(aid_trainer) do
        soma = soma + 1
end

for i =1, soma do

	if item.actionid == aid_trainer[""..i..""] then  --MUDAR AID

		if (getGlobalStorageValue(sto_global_acc_id[i]) == getPlayerAccountId(cid)) and (getGlobalStorageValue(sto_global_trainer_tempo[i]) > os.time()) then --MUDAR INDICES
			local hora = math.floor( ((getGlobalStorageValue(sto_global_trainer_tempo[i])) - os.time())/60 ) --MUDAR INDICE
			doPlayerSendTextMessage(cid, 25, "Bem vindo ao seu trainer! Voce tem mais "..hora.." min de trainer.")
			doSendMagicEffect(getCreaturePosition(cid), 3)

		else
			local destino = {x = frompos_trainer[""..i..""].x, y = frompos_trainer[""..i..""].y, z = frompos_trainer[""..i..""].z}  --MUDAR INDICE
			doTeleportThing(cid, destino) 
			doSendMagicEffect(getCreaturePosition(cid), 3)
			doPlayerSendCancel(cid, "Voce nao e dono do trainer "..i.."! Para ser dono de um trainer adquira o item no npc!")
		end

		break
	end
end


	-- if item.actionid == 4541 then  --MUDAR AID

	-- 	if (getGlobalStorageValue(sto_global_acc_id[1]) == getPlayerAccountId(cid)) and (getGlobalStorageValue(sto_global_trainer_tempo[1]) > os.time()) then --MUDAR INDICES
	-- 		local hora = math.floor( ((getGlobalStorageValue(sto_global_trainer_tempo[1])) - os.time())/60 ) --MUDAR INDICE
	-- 		doPlayerSendTextMessage(cid, 25, "Bem vindo ao seu trainer! Voce tem mais "..hora.." min de trainer.")
	-- 		doSendMagicEffect(getCreaturePosition(cid), 3)

	-- 	else
	-- 		local destino = {x = frompos_trainer["1"].x, y = frompos_trainer["1"].y, z = frompos_trainer["1"].z}  --MUDAR INDICE
	-- 		doTeleportThing(cid, destino) 
	-- 		doSendMagicEffect(getCreaturePosition(cid, 3)
	-- 		doPlayerSendCancel(cid, "Voce nao e dono desse trainer! Para ser dono de um trainer adquira o item no npc!")
	-- 	end

 --     elseif item.actionid == 4542 then  --MUDAR AID

	-- 	if (getGlobalStorageValue(sto_global_acc_id[2]) == getPlayerAccountId(cid)) and (getGlobalStorageValue(sto_global_trainer_tempo[2]) > os.time()) then --MUDAR INDICES
	-- 		local hora = math.floor( ((getGlobalStorageValue(sto_global_trainer_tempo[2])) - os.time())/60 ) --MUDAR INDICE
	-- 		doPlayerSendTextMessage(cid, 25, "Bem vindo ao seu trainer! Voce tem mais "..hora.." min de trainer.")
	-- 	else
	-- 		destino = {x = frompos_trainer["2"].x, y = frompos_trainer["2"].y, z = frompos_trainer["2"].z}  --MUDAR INDICE
	-- 		doTeleportThing(cid, destino) 
	-- 		doPlayerSendCancel(cid, "Voce nao e dono desse trainer! Para ser dono de um trainer adquira o item no npc!")
	-- 	end

 --     elseif item.actionid == 4543 then  --MUDAR AID

	-- 	if (getGlobalStorageValue(sto_global_acc_id[3]) == getPlayerAccountId(cid)) and (getGlobalStorageValue(sto_global_trainer_tempo[3]) > os.time()) then --MUDAR INDICES
	-- 		local hora = math.floor( ((getGlobalStorageValue(sto_global_trainer_tempo[3])) - os.time())/60 ) --MUDAR INDICE
	-- 		doPlayerSendTextMessage(cid, 25, "Bem vindo ao seu trainer! Voce tem mais "..hora.." min de trainer.")
	-- 	else
	-- 		destino = {x = frompos_trainer["3"].x, y = frompos_trainer["3"].y, z = frompos_trainer["3"].z}  --MUDAR INDICE
	-- 		doTeleportThing(cid, destino) 
	-- 		doPlayerSendCancel(cid, "Voce nao e dono desse trainer! Para ser dono de um trainer adquira o item no npc!")
	-- 	end
	--end

	return true
end
