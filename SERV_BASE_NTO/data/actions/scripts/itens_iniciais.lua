function onUse(cid, item, frompos, item2, topos)


local itens_inicio = 8293021

        if (item.actionid == 35600) and (getPlayerStorageValue(cid, itens_inicio) == -1) then

        					doPlayerSendTextMessage(cid,18, "[Nto Gran] Voce obteve os itens iniciais!") 
        					doSendMagicEffect(getCreaturePosition(cid), 2)
        					setPlayerStorageValue(cid, itens_inicio,1)

        					doPlayerAddItem(cid, 11434,1)
                  doPlayerAddItem(cid, 11724,1)
                  doPlayerAddItem(cid, 4446,1)
                  doPlayerAddItem(cid, 4445,1)
                  doPlayerAddItem(cid, 6091,1)
                  doPlayerAddItem(cid, 2379,1)
                  doPlayerAddItem(cid, 2545,1)
                  doPlayerAddItem(cid, 2260,1)
                  doPlayerAddItem(cid, 11760,1)
                  doPlayerAddItem(cid, 11772,1)
                  doPlayerAddItem(cid, 11773,1)
                  doPlayerAddItem(cid, 11774,1)
                  doPlayerAddItem(cid, 2160,10)




        elseif (item.actionid == 35600) and (getPlayerStorageValue(cid, itens_inicio) == -1) then
                   doPlayerSendTextMessage(cid,18, "[Nto Gran] Voce ja pegou os itens iniciais! Bom game!") 


        end



return true
end