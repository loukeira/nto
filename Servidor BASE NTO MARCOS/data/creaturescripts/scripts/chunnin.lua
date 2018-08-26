
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



local pvp1 = {x= 1096, y= 354, z=7}
local pvp2 = {x=1146, y=401, z=7}



    if isPlayer(cid) and (tonumber(chunnin.getTeam(cid)) > 0) and _type == STATSCHANGE_HEALTHLOSS then
        if value >= getCreatureHealth(cid) then
            local killer = attacker

           -- for _, pid in pairs(getPlayersOnline()) do

                --if isInArea(getThingPos(cid), pvp1, pvp2) then

            doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
            doCreatureAddMana(cid, getCreatureMaxMana(cid))



            if (getPlayerItemCount(cid, id_item_pergaminho_ar) >=1)  then
                perg_ar = getPlayerItemCount(cid,id_item_pergaminho_ar)
                doPlayerRemoveItem(cid, id_item_pergaminho_ar, perg_ar)
                doCreateItem(id_item_pergaminho_ar, perg_ar, getCreaturePosition(cid))  
            end
            if (getPlayerItemCount(cid,id_item_pergaminho_terra) >= 1) then
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

local oit,qua,semi,final = chunnin.getFight(cid)
local oit2,qua2,semi2,final2 = chunnin.getFight(killer)
                if (isInArea(getThingPos(cid), chunnin.pos.luta_oitavas.from1, chunnin.pos.luta_oitavas.to1) ) and ((oit==1) and (oit2==1)) then
                   setGlobalStorageValue(chunnin.storage.arena_aux_4,0)
                    doTeleportThing(killer, chunnin.pos.wait_arena3.from1)
                          db.query("UPDATE chunnin_players SET oitavas = -1 WHERE name = '"..getPlayerName(cid).."' ;")
                          db.query("UPDATE chunnin_players SET oitavas = -1 WHERE name = '"..getPlayerName(killer).."' ;")
                          db.query("UPDATE chunnin_players SET quartas = 0 WHERE name = '"..getPlayerName(killer).."' ;")
                   doPlayerSendTextMessage(killer, 18, "[CHUNNIN]: Voce matou o player "..getCreatureName(cid).." e avancou de fase! ")

                elseif isInArea(getThingPos(cid), chunnin.pos.luta_quartas.from1, chunnin.pos.luta_quartas.to1) and ((qua==1) and (qua2==1)) then
                   setGlobalStorageValue(chunnin.storage.arena_aux_6,0)
                    doTeleportThing(pid, chunnin.pos.wait_arena4.from1)
                          db.query("UPDATE chunnin_players SET quartas = -1 WHERE name = '"..getPlayerName(cid).."' ;")
                          db.query("UPDATE chunnin_players SET quartas = -1 WHERE name = '"..getPlayerName(killer).."' ;")
                          db.query("UPDATE chunnin_players SET semi = 0 WHERE name = '"..getPlayerName(killer).."' ;")
                   doPlayerSendTextMessage(killer, 18, "[CHUNNIN]: Voce matou o player "..getCreatureName(cid).." e avancou de fase! ")

                elseif isInArea(getThingPos(cid), chunnin.pos.luta_semi.from1, chunnin.pos.luta_semi.to1) and ((semi==1) and (semi2==1)) then
                   setGlobalStorageValue(chunnin.storage.arena_aux_8,0)
                    doTeleportThing(pid, chunnin.pos.wait_arena5.from1)
                          db.query("UPDATE chunnin_players SET semi = -1 WHERE name = '"..getPlayerName(cid).."' ;")
                          db.query("UPDATE chunnin_players SET semi = -1 WHERE name = '"..getPlayerName(killer).."' ;")
                          db.query("UPDATE chunnin_players SET final = 0 WHERE name = '"..getPlayerName(killer).."' ;")
                   doPlayerSendTextMessage(killer, 18, "[CHUNNIN]: Voce matou o player "..getCreatureName(cid).." e avancou de fase! ")

                 elseif isInArea(getThingPos(cid), chunnin.pos.luta_final.from1, chunnin.pos.luta_final.to1) and ((final==1) and (final2==1)) then
                   setGlobalStorageValue(chunnin.storage.arena_aux_10,0)
                   doTeleportThing(killer, chunnin.townid)
                          db.query("UPDATE chunnin_players SET final = -1 WHERE name = '"..getPlayerName(cid).."' ;")
                          db.query("UPDATE chunnin_players SET pos_final = 1 WHERE name = '"..getPlayerName(killer).."' ;")
                   doPlayerSendTextMessage(killer, 18, "[CHUNNIN]: Voce matou o player "..getCreatureName(cid).." e ganhou! ")
                end
                

            return false
        
        end
    end

  


    return true
end
