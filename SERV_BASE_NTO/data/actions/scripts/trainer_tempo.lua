function onUse(cid, item, fromPosition, itemEx, toPosition)


						local file = io.open('data/log_trainers_owners.txt','a')
		                file:write(getCreatureName(cid)..": INICIOU EM:  "..tostring(os.date()).."   NO TRAINER , trainer_tempo 1 \n") --ALTERAR TRAINER
		                file:close()


				db.query("UPDATE players SET trainer_tempo = "..tempo_de_trainer.." WHERE id = "..getPlayerGUID(cid).." ;")

				setPlayerStorageValue(cid,trainer_player_power,1)
				setPlayerStorageValue(cid,sto_player_time,0)

				doRemoveItem(item.uid)
				--local min = tempo_de_trainer/60
				doPlayerSendTextMessage(cid, 25, "Agora voce pode acessar aos trainers! Voce possui: "..tempo_de_trainer.." seg") -- ALTERAR TRAINER
				doSendMagicEffect(getCreaturePosition(cid), 3)
		
	return true
end

