function onUse(cid, item, fromPosition, itemEx, toPosition)


						local file = io.open('data/log_trainers_owners.txt','a')
		                file:write(getCreatureName(cid)..": INICIOU EM:  "..tostring(os.date()).."   NO TRAINER, tempo_de_trainer2 \n") --ALTERAR TRAINER
		                file:close()


				db.query("UPDATE players SET trainer_tempo = "..tempo_de_trainer2.." WHERE id = "..getPlayerGUID(cid).." ;")

				setPlayerStorageValue(cid,trainer_player_power,1)
				setPlayerStorageValue(cid,sto_player_time,0)

				doRemoveItem(item.uid)
				--local min = tempo_de_trainer/60
				doPlayerSendTextMessage(cid, 25, "Agora voce pode acessar aos trainers! Voce possui: "..tempo_de_trainer2.." seg") -- ALTERAR TRAINER
				doSendMagicEffect(getCreaturePosition(cid), 3)
		
	return true
end

