-- Account VIP System criado por Vitor Bertolucci - Killua


function onSay(cid, words, param, channel)


      if param == "" then
            return doPlayerSendCancel(cid, "Utilize os parametros corretos.")
      end


      local t = string.explode(param, ',')


      if t[1] ~= "days" and getPlayerGroupId(cid) < 4 then
            return doPlayerSendCancel(cid, "Comandos disponiveis apenas para gods. Player podem usar /vip days")
      end


      if t[1] == "days" then
            if isVip(cid) then
                  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce tem "..getPlayerVipDays(cid).." dias de VIP.")
            else
                  doPlayerSendCancel(cid, "Voce nao tem VIP.")
            end
      elseif t[1] == "add" then
            if getPlayerByName(t[2]) and tonumber(t[3]) and tonumber(t[3]) > 0 then
                  doPlayerSetVipDays(getPlayerByName(t[2]), getPlayerVipDays(getPlayerByName(t[2])) + tonumber(t[3]))
                  doPlayerSendTextMessage(getPlayerByName(t[2]), 25, "Voce recebeu "..t[3].." dias de VIP.")
                  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, t[3].." dias de VIP adicionados para "..t[2])
            else
                  doPlayerSendCancel(cid, "Voce fez algo errado! Utilize /vip add, PLAYERNAME, dias.")
            end
      elseif t[1] == "remove" then
            if getPlayerByName(t[2]) and tonumber(t[3]) and tonumber(t[3]) > 0 then
                  if isVip(getPlayerByName(t[2])) then
                        if getPlayerVipDays(getPlayerByName(t[2])) > tonumber(t[3]) then
                              doPlayerSetVipDays(getPlayerByName(t[2]), getPlayerVipDays(getPlayerByName(t[2])) - tonumber(t[3]))
                              doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, t[3].." dias de vip removidos de "..t[2])
                              doPlayerSendTextMessage(getPlayerByName(t[2]), MESSAGE_STATUS_WARNING, "Fora retirados "..t[3].." dias de VIP da sua account.")
                        else
                              doPlayerSetVipDays(getPlayerByName(t[2]), 0)
                              doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, t[2].." tinha menos que "..t[3].." dias de VIP. A VIP dele foi removida.")
                              doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING, "Sua VIP acabou.")
                        end
                  else
                        doPlayerSendCancel(cid, t[2].." nao eh VIP.")
                  end
            else
                  doPlayerSendCancel(cid, "Voce fez algo errado! Utilize /vip remove, PLAYERNAME, dias.")
            end
      elseif t[1] == "check" then
            if getPlayerByName(t[2]) then
                  if isVip(getPlayerByName(t[2])) then
                      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, t[2].." tem "..getPlayerVipDays(getPlayerByName(t[2])).." dias de VIP Account.")
                  else
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, t[2].." nao eh VIP.")
                  end
           else
                doPlayerSendCancel(t[2].." Nao esta online ou nao existe!")
           end
      elseif t[1] == "install" then
            if installVipSystem() then
                  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O sistema foi instalado com sucesso.")
            else
                  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "O sistema ja esta instalado.")
            end
      end
      return true
end