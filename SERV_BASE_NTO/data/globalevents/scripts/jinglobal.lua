function onThink(interval, lastExecution)
for _, ons in pairs(getPlayersOnline()) do
 if getPlayerStorageValue(ons, jin_StorageTime)-os.time() <= 0 and jin.getPlayerBijuu(ons) ~= 0 then
  jin.doPlayerRemoveJinchuuriki(ons)  
  doPlayerSendTextMessage(ons, MESSAGE_STATUS_CONSOLE_RED, "O selo do Jinchuuriki foi desfeito, e você perdeu o bijuu, você sela-lo novamente, ou selar outro.") 
 end
end 
return TRUE
end