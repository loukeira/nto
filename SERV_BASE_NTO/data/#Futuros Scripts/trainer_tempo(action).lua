function onUse(cid, item, fromPosition, itemEx, toPosition)
	    if getPlayerStorageValue(cid,sto_player_tempo) - os.time() > 0  then 
	     	doPlayerSendTextMessage(cid, 25, "Voce ja possui trainer!")
	     	return true 
	    --elseif ....
		end
		if item.id == 1481 or item.id == 1484 then
for i =1, #sto_global_trainer_tempo do

    	if getGlobalStorageValue(sto_global_trainer_tempo[i]) < os.time() then  -- ALTERAR INDICE
    		
				setPlayerStorageValue(cid,sto_player_tempo, 0) --ZERAR -- ALTERAR INDICE
				setGlobalStorageValue(sto_global_trainer_tempo[i], 0) --ZERAR -- ALTERAR INDICE

						local file = io.open('data/log_trainers_owners.txt','a')
		                file:write(getCreatureName(cid)..": INICIOU EM:  "..tostring(os.date()).."   NO TRAINER "..i.." \n") --ALTERAR TRAINER
		                file:close()

				setGlobalStorageValue(sto_global_trainer_tempo[i],1)  --cave 1 ligado -- ALTERAR INDICE
				setPlayerStorageValue(cid,sto_player_tempo,  os.time() + tempo_de_trainer) --player sto time -- ALTERAR INDICE
				setPlayerStorageValue(cid,sto_player_ligado,  1) --player sto ligado -- ALTERAR INDICE
				setGlobalStorageValue(sto_global_acc_id[i],getPlayerAccountId(cid)) -- accid == global storage -- ALTERAR INDICE
				setGlobalStorageValue(sto_global_trainer_tempo[i],  os.time() + tempo_de_trainer) -- global sto time -- ALTERAR INDICE

				doRemoveItem(item.uid)
				local min = tempo_de_trainer/60
				doPlayerSendTextMessage(cid, 25, "Agora voce e o dono do trainer "..i.." e pode ficar la por "..min.." min") -- ALTERAR TRAINER
				doSendMagicEffect(getCreaturePosition(cid), 3)
				break
		end
end
end



				-- if getGlobalStorageValue(sto_global_trainer_tempo[1]) < os.time() then  -- ALTERAR INDICE
    		
				-- setPlayerStorageValue(cid,sto_player_tempo[1], 0) --ZERAR -- ALTERAR INDICE
				-- setGlobalStorageValue(sto_global_trainer_tempo[1], 0) --ZERAR -- ALTERAR INDICE

				-- 		local file = io.open('data/log_trainers_owners.txt','a')
		  --               file:write(getCreatureName(cid)..": INICIOU EM:  "..tostring(os.date()).."   NO TRAINER 1 \n") --ALTERAR TRAINER
		  --               file:close()

				-- setGlobalStorageValue(sto_global_trainer_tempo[1],1)  --cave 1 ligado -- ALTERAR INDICE
				-- setPlayerStorageValue(cid,sto_player_tempo[1],  os.time() + tempo_de_trainer) --player sto time -- ALTERAR INDICE
				-- setGlobalStorageValue(sto_global_acc_id[1],getPlayerAccountId(cid)) -- accid == global storage -- ALTERAR INDICE
				-- setGlobalStorageValue(sto_global_trainer_tempo[1],  os.time() + tempo_de_trainer) -- global sto time -- ALTERAR INDICE

				-- doRemoveItem(item.uid)
				-- local min = tempo_de_trainer/60
				-- doPlayerSendTextMessage(cid, 25, "Agora voce e o dono do trainer 1 e pode ficar la por "..min.." min") -- ALTERAR TRAINER


				--return true

	-- elseif getGlobalStorageValue(sto_global_trainer_tempo[1]) < os.time() then

				-- setPlayerStorageValue(cid,sto_player_tempo[1], 0) --ZERAR -- ALTERAR INDICE
				-- setGlobalStorageValue(sto_global_trainer_tempo[1], 0) --ZERAR -- ALTERAR INDICE

				-- 		local file = io.open('data/log_trainers_owners.txt','a')
		  --               file:write(getCreatureName(cid)..": INICIOU EM:  "..tostring(os.date()).."   NO TRAINER 1 \n") --ALTERAR TRAINER
		  --               file:close()

				-- setGlobalStorageValue(sto_global_trainer_tempo[1],1)  --cave 1 ligado -- ALTERAR INDICE
				-- setPlayerStorageValue(cid,sto_player_tempo[1],  os.time() + tempo_de_trainer) --player sto time -- ALTERAR INDICE
				-- setGlobalStorageValue(sto_global_acc_id[1],getPlayerAccountId(cid)) -- accid == global storage -- ALTERAR INDICE
				-- setGlobalStorageValue(sto_global_trainer_tempo[1],  os.time() + tempo_de_trainer) -- global sto time -- ALTERAR INDICE

				-- doRemoveItem(item.uid)
				-- doPlayerSendTextMessage(cid, 25, "Agora voce e o dono do trainer 1 e pode ficar la por "..tempo_de_trainer/60.." min") -- ALTERAR TRAINER
				-- return true	

	if getPlayerStorageValue(cid,sto_player_tempo) - os.time() > 0  then 
		doPlayerSendCancel(cid, "Aproveite Seu trainer!!!")
		doSendMagicEffect(getCreaturePosition(cid), 3)
		return true
	else
		doPlayerSendCancel(cid, "Todos os trainers desta sala ja estao ocupados! Tente mais tarde.")
		doSendMagicEffect(getCreaturePosition(cid), 3)

	end
	return true
end