
function onLogin(cid)
        registerCreatureEvent(cid, "ChunninStats")
           registerCreatureEvent(cid, "ChunninLogout")
           registerCreatureEvent(cid, "ChunninKill")
        registerCreatureEvent(cid, "ChunninThink")
        registerCreatureEvent(cid, "ChunninThink2")
        registerCreatureEvent(cid, "ChunninThink3")


           
   return true
end



function onStatsChange(cid, attacker, _type, combat, value)
 

local nome = getCreatureName(cid)

for _, index in ipairs(chunnin.getPlayersInEvent()) do
if (tostring(index.name) ~= tostring(nome)) then
return true
end
end 

    if isPlayer(cid) and _type == STATSCHANGE_HEALTHLOSS then
        if value >= getCreatureHealth(cid) then
            local killer = attacker

            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            doCreatureAddMana(cid, getCreatureMaxMana(cid))

            if ((getPlayerItemCount(cid, id_item_pergaminho_ar) >=1))  then
                perg_ar = getPlayerItemCount(cid,id_item_pergaminho_ar)
                doPlayerRemoveItem(cid, id_item_pergaminho_ar, perg_ar)
                doCreateItem(id_item_pergaminho_ar, perg_ar, getCreaturePosition(cid))  
            end
            if (getPlayerItemCount(cid,id_item_pergaminho_terra) >= 1)) then
                perg_terra = getPlayerItemCount(cid,id_item_pergaminho_terra)
                doPlayerRemoveItem(cid, id_item_pergaminho_terra, perg_terra)
                doCreateItem(id_item_pergaminho_terra, perg_terra, getCreaturePosition(cid))  
            end

            doPlayerSendTextMessage(cid, 18, "[CHUNNIN]: Voce morreu no exame!")
            db.query("DELETE FROM`chunnin_players` WHERE name = '"..getCreatureName(cid).."'  ;")  

            doRemoveCondition(cid, CONDITION_INFIGHT)
            doPlayerSendTextMessage(killer, 18, "[CHUNNIN]: Voce matou o player "..getCreatureName(cid).." no exame CHUNNIN! ")
            doTeleportThing(cid, chunnin.townid)
            doSendMagicEffect(getCreaturePosition(cid), 2)

                if isInArea(getThingPos(cid), chunnin.pos.luta_oitavas.from1, chunnin.pos.luta_oitavas.to1) then
                   setGlobalStorageValue(chunnin.storage.arena_aux_4,0)
                   doTeleportThing(killer, chunnin.arenaid2)
                   setPlayerStorageValue(cid,chunnin.pvp.oitavas,-1)
                   setPlayerStorageValue(killer,chunnin.pvp.oitavas,-1)
                   setPlayerStorageValue(killer,chunnin.pvp.quartas,0)
                   doPlayerSendTextMessage(killer, 18, "[CHUNNIN]: Voce matou o player "..getCreatureName(cid).." e avancou de fase! ")

                elseif isInArea(getThingPos(cid), chunnin.pos.luta_quartas.from1, chunnin.pos.luta_quartas.to1) then
                   setGlobalStorageValue(chunnin.storage.arena_aux_6,0)
                   doTeleportThing(killer, chunnin.arenaid3)
                   setPlayerStorageValue(cid,chunnin.pvp.quartas,-1)
                   setPlayerStorageValue(killer,chunnin.pvp.quartas,-1)
                   setPlayerStorageValue(killer,chunnin.pvp.semi,0)
                   doPlayerSendTextMessage(killer, 18, "[CHUNNIN]: Voce matou o player "..getCreatureName(cid).." e avancou de fase! ")

                elseif isInArea(getThingPos(cid), chunnin.pos.luta_semi.from1, chunnin.pos.luta_semi.to1) then
                   setGlobalStorageValue(chunnin.storage.arena_aux_8,0)
                   doTeleportThing(killer, chunnin.arenaid4)
                   setPlayerStorageValue(cid,chunnin.pvp.semi,-1)
                   setPlayerStorageValue(killer,chunnin.pvp.semi,-1)
                   setPlayerStorageValue(killer,chunnin.pvp.final,0)
                   doPlayerSendTextMessage(killer, 18, "[CHUNNIN]: Voce matou o player "..getCreatureName(cid).." e avancou de fase! ")

                 elseif isInArea(getThingPos(cid), chunnin.pos.luta_final.from1, chunnin.pos.luta_final.to1) then
                   setGlobalStorageValue(chunnin.storage.arena_aux_10,0)
                   doTeleportThing(killer, chunnin.arenaid5)
                   setPlayerStorageValue(cid,chunnin.pvp.final,-1)
                   setPlayerStorageValue(killer,chunnin.pvp.final,-1)
                   setPlayerStorageValue(killer,chunnin.pvp.campeao,1)
                   doPlayerSendTextMessage(killer, 18, "[CHUNNIN]: Voce matou o player "..getCreatureName(cid).." e ganhou! ")
                end
                
            return false
        
        end
    end

    return true
end
