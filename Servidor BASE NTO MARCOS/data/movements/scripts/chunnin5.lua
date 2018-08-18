function onStepIn(cid, item, position, lastPosition, fromPosition)

	if not isPlayer(cid) then
	 	return false
	 end

--posicao do centro da torre
local xxx,yyy,zzz = 1116, 375,7 

local quantplayer = chunnin.storage.quant_player_tem_para_arena

if getGlobalStorageValue(quantplayer) == -1 then 
	setGlobalStorageValue(quantplayer,0)
end

if getPlayerStorageValue(cid,quantplayer) == -1 then 
	setPlayerStorageValue(cid,quantplayer,0)
end


	if (item.actionid == 11180) and (getPlayerStorageValue(cid,chunnin.storage.pergaminho) == -1) and (chunnin.getTeam(cid) > 0) and ((getPlayerItemCount(cid,id_item_pergaminho_ar)>=1) and (getPlayerItemCount(cid,id_item_pergaminho_terra)>=1)) then
		
		local meu_time = chunnin.getTeam(cid)
		setGlobalStorageValue(quantplayer,getGlobalStorageValue(quantplayer)+1)
		setPlayerStorageValue(cid,quantplayer,getPlayerStorageValue(cid,quantplayer)+1)

		for _, index in ipairs(chunnin.getPlayersInEvent()) do
			 doPlayerSendTextMessage(index.pid,18,"[CHUNNIN] Ja possui/possuem "..getGlobalStorageValue(quantplayer).." player(s) para a etapa final! ")
	        if (tonumber(index.team) == tonumber(meu_time)) then
		            if ((getPlayerItemCount(index.pid, id_item_pergaminho_ar) >=1))  then
		                perg_ar = getPlayerItemCount(index.pid,id_item_pergaminho_ar)
		                doPlayerRemoveItem(index.pid, id_item_pergaminho_ar, perg_ar)
		            end
		            if (getPlayerItemCount(index.pid,id_item_pergaminho_terra) >= 1)) then
		                perg_terra = getPlayerItemCount(index.pid,id_item_pergaminho_terra)
		                doPlayerRemoveItem(index.pid, id_item_pergaminho_terra, perg_terra)
		            end

		        doPlayerSendTextMessage(index.pid,18,"[CHUNNIN] Seu time apresentou os 2 pergaminhos e conseguiu acesso para a proxima etapa!")
	            doPlayerSetStorageValue(index.pid, chunnin.storage.pergaminho, 1)
	        end
   		end



					doSendMagicEffect(getCreaturePosition(cid), 2)
					local newPos = {x= xxx, y=yyy, z= zzz}
					doTeleportThing(cid, newPos) 

					return true

	elseif (item.actionid == 11180) and (getPlayerStorageValue(cid,chunnin.storage.pergaminho) == 1) and (chunnin.getTeam(cid) > 0) then
					doPlayerSendTextMessage(cid,18, "[CHUNNIN] Voce esta na proxima etapa!") 


					doSendMagicEffect(getCreaturePosition(cid), 2)

					if ((getPlayerItemCount(cid, id_item_pergaminho_ar) >=1))  then
		                perg_ar = getPlayerItemCount(cid,id_item_pergaminho_ar)
		                doPlayerRemoveItem(cid, id_item_pergaminho_ar, perg_ar)
		            end
		            if (getPlayerItemCount(cid,id_item_pergaminho_terra) >= 1)) then
		                perg_terra = getPlayerItemCount(cid,id_item_pergaminho_terra)
		                doPlayerRemoveItem(cid, id_item_pergaminho_terra, perg_terra)
		            end

					local newPos = {x= xxx, y=yyy, z= zzz}
					doTeleportThing(cid, newPos) 

					setGlobalStorageValue(quantplayer,getGlobalStorageValue(quantplayer)+1)
					setPlayerStorageValue(cid,quantplayer,getPlayerStorageValue(cid,quantplayer)+1)
					
					for _, index in ipairs(chunnin.getPlayersInEvent()) do
						doPlayerSendTextMessage(index.pid,18,"[CHUNNIN] Ja possui/possuem "..getGlobalStorageValue(quantplayer).." player(s) para a etapa final! ")
					end
			

		return 

	elseif (item.actionid == 11181) and (getPlayerStorageValue(cid,chunnin.storage.pergaminho) == 1) and (chunnin.getTeam(cid) > 0) then
					doPlayerSendTextMessage(cid,18, "[CHUNNIN] Voce nao pode voltar para a floresta!!") 
					doSendMagicEffect(getCreaturePosition(cid), 2)


					local newPos = {x= xxx, y=yyy, z= zzz}
					doTeleportThing(cid, newPos) 

				
			

		return true



	else
							doPlayerSendTextMessage(cid,18, "[CHUNNIN] Seu time nao possui o pergaminho do ar E terra para avancar! Conquiste, passe por aqui, e seu time tera permissao para proxima etapa!") 
							doTeleportThing(cid, fromPosition)  
							doSendMagicEffect(getCreaturePosition(cid), 2)
  	

					--local pos = getCreaturePosition(cid)
					--local newPos = {x=pos.x+1, y=pos.y, z=pos.z}
					--doTeleportThing(cid, newPos)  
		return true

	end

	

return true
end