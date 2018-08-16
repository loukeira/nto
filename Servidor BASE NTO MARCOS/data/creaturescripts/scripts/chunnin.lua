function onKill(cid, target)
local sto_team = 123456
if isPlayer(cid) and isPlayer(target) then
if isInArea(getThingPos(target), zona_wait_team.from1, zona_wait_team.to1) then
 			  doPlayerSetStorageValue(target, sto_team, 0)
 			    doPlayerSetStorageValue(target, sto_team, 0)
 			      doPlayerSetStorageValue(target, sto_team, 0)
 			        doPlayerSetStorageValue(target, sto_team, 0)
 			          doPlayerSetStorageValue(target, sto_team, 0)
 			            doPlayerSetStorageValue(target, sto_team, 0)
 			            	doPlayerSetStorageValue(target, sto_team, 0)
             local cont = getPlayerStorageValue(sto_team)
             db.query("UPDATE dtt_players SET team = "0" WHERE id = "..getPlayerGUID(target).." ;")
             addEvent(doRemoveCorpse, 500, getCreaturePosition(target))
 end
end
return true
end


function onLogin(cid)
	local HPFix = 158920
    if getPlayerStorageValue(cid, HPFix) == 1 then
       doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
       setPlayerStorageValue(cid, HPFix, -1)
    end
   return true
end

function onStatsChange(cid, attacker, _type, combat, value)
  saida = {x = 1103, y = 1056, z = 4}


    if isPlayer(cid) and getPlayerStorageValue(cid, yok) == 1 and _type == STATSCHANGE_HEALTHLOSS then
        if value >= getCreatureHealth(cid) then
            local killer = attacker

            if getPlayerStorageValue(killer,arenalivre) == -1 then
                setPlayerStorageValue(killer,arenalivre,0)
            end
             db.query("UPDATE `players` SET `arenalivre` = `arenalivre` + 1 WHERE id = "..getPlayerGUID(killer).." ;")
            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            doCreatureAddMana(cid, getCreatureMaxMana(cid))
            doPlayerSendTextMessage(cid, 18, "[Arena Livre]: Voce perdeu todo hp!")
            doRemoveCondition(cid, CONDITION_INFIGHT)
            doPlayerSendTextMessage(killer, 18, "[Arena Livre]: Voce Massacrou  "..getPlayerStorageValue(killer,arenalivre).." NOOBs No Total HJ")
            doTeleportThing(cid, saida)
            doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
            --doSendMagicEffect(getThingPos(killer), CONST_ME_POFF)
            setPlayerStorageValue(cid, yok, -1)
            return false
        
    end
    end
    return true
end

function onLogout(cid)
--LISTA--
			--ver nome na lista
				function nomenalista(cid)

			 local player = db.getResult("SELECT `fila` FROM `players` WHERE id = "..getPlayerGUID(cid)..";")    
			            if(player:getID() ~= -1) then
			 
			                while (true) do

			                    fila = player:getDataString("fila")

			                    if not(player:next()) then
			                        break
			                    end
								
			                end
			            
						 player:free()
			            end
			  	return fila

			end
			--FIM Vernomenalista

			local fila= nomenalista(cid)

					if tonumber(nomenalista(cid)) > 0 then
						local zero = 0
						db.query("UPDATE `players` SET `fila` = "..zero.." WHERE `id` = "..getPlayerGUID(cid).." ;")
						return true
					end
--FIM LISTA--
    return true
end