function onDeath(cid,attacker)
--SCRIPT PARA ONDEATH
local loss = getConfigValue('deathLostPercent')
 if(loss ~= nil) then
  doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
 end




   return true
end
