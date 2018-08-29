function onSay(cid, words, param, channel)

 doCreatureSay(cid, "REPORTBUG!", TALKTYPE_ORANGE_1) 

        if os.time() > getPlayerStorageValue(cid, 14001) then
                setPlayerStorageValue(cid, 14001, os.time()+1)
                local file = io.open('player_report_bug.txt','a')

              local coco = getCreaturePosition(cid)
                local k = 1
                for a,i in pairs(coco) do
                        if k == 1 then  y = i end
                        if k == 2 then  x = i end
                        if k == 4 then  z = i end   k = k+1
                end
            
                file:write(getCreatureName(cid).."["..x..","..y..","..z.."]: BUG NESSA CORDENADA! "..tostring(param).."\n")
                                file:close()
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING,'Voce Reportou o bug com sucesso!')

                doSendMagicEffect(getCreaturePosition(cid), 4)
                
                        if #getPlayersOnline() >= 1 then
                        for i = 1, #getPlayersOnline() do
                        if getPlayerAccess(getPlayersOnline()[i]) >= 3 then
                        doPlayerSendTextMessage(getPlayersOnline()[i],19,"Um novo Player Reportou Bug!")
                        end

                        end
                        end
        else
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING,'Voce nao pode mandar outra mensagem ainda. Falta(m) '..(math.ceil((getPlayerStorageValue(cid, 14001)-os.time())/60)+1)..' minuto(s) para voce poder mandar uma nova mensagem.')
        
end

return true
end