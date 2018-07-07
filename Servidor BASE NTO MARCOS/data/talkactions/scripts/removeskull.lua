local moneyRed = 50000 -- Preço cobrado para remover o frag e red skull
local moneyBlack = 100000 -- Preço cobrado para remover o frag e black skull
local moneySkullNone = 60000 -- Preço cobrado para remover o frag

function onSay(cid, words, param, channel)
          pid = getPlayerGUID(cid)
          if getCreatureSkullType(cid) == 4 then
                    if doPlayerRemoveMoney(cid, moneyRed) then
                              doCreatureSetSkullType(cid, 0)
                              doPlayerSendTextMessage(cid, 19, 'His frags and red skull were removed for '.. doNumberFormat(moneyRed) ..' golds. You will be logged off in 5 seconds.')
                              doSendMagicEffect(getPlayerPosition(cid), 14)
                              doRemoveConditions(cid, CONDITION_INFIGHT)
                              doRemoveCreature(cid)
                              db.executeQuery("UPDATE players SET skulltime = 0 WHERE id = ".. pid ..";")
                              db.executeQuery("UPDATE killers SET unjustified = 0 WHERE id IN (SELECT kill_id FROM player_killers WHERE player_id = " .. pid .. ");")
                    else
                              doPlayerSendTextMessage(cid, 19, 'You don\'t have enough money, it takes '.. doNumberFormat(moneyRed) ..' golds')
                              doSendMagicEffect(getPlayerPosition(cid), 2)
                    end
                    return TRUE
          end
          if getCreatureSkullType(cid) == 5 then
                    if doPlayerRemoveMoney(cid, moneyBlack) then
                              doCreatureSetSkullType(cid, 0)
                              doPlayerSendTextMessage(cid, 19, 'His frags and black skull were removed for '.. doNumberFormat(moneyBlack) ..' golds. You will be logged off in 5 seconds.')
                              doSendMagicEffect(getPlayerPosition(cid), 14)
                              doRemoveConditions(cid, CONDITION_INFIGHT)
                              doRemoveCreature(cid)
                              db.executeQuery("UPDATE players SET skulltime = 0 WHERE id = ".. pid ..";")
                              db.executeQuery("UPDATE killers SET unjustified = 0 WHERE id IN (SELECT kill_id FROM player_killers WHERE player_id = " .. pid .. ");")
                    else
                              doPlayerSendTextMessage(cid, 19, 'You don\'t have enough money, it takes '.. doNumberFormat(moneyBlack) ..' golds')
                              doSendMagicEffect(getPlayerPosition(cid), 2)
                    end
                    return TRUE
          end
          if getCreatureSkullType(cid) <= 3 then
                    if doPlayerRemoveMoney(cid, moneySkullNone) then
                              doCreatureSetSkullType(cid, 0)
                              doPlayerSendTextMessage(cid, 19, 'His frags were removed for '.. doNumberFormat(moneySkullNone) ..' golds. You will be logged off in 5 seconds.')
                              doSendMagicEffect(getPlayerPosition(cid), 14)
                              doRemoveConditions(cid, CONDITION_INFIGHT)
                              doRemoveCreature(cid)
                              db.executeQuery("UPDATE players SET skulltime = 0 WHERE id = ".. pid ..";")
                              db.executeQuery("UPDATE killers SET unjustified = 0 WHERE id IN (SELECT kill_id FROM player_killers WHERE player_id = " .. pid .. ");")
                    else
                              doPlayerSendTextMessage(cid, 19, 'You don\'t have enough money, it takes '.. doNumberFormat(moneySkullNone) ..' golds')
                              doSendMagicEffect(getPlayerPosition(cid), 2)
                    end
                    return TRUE
          end
end