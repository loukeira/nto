function onTimer(cid, interval, lastExecution) 

doBroadcastMessage("Golden Arena will begin in 10 minutes! Go prepare yourself!")
addEvent(doBroadcastMessage, 300000, "Golden Arena will begin in 5 minutes!\nWe hope that participants are already prepared!") 
addEvent(puxaParticipantes, 480000)  	
addEvent(doWave, 600000, true) --alterado v1.8       --480000 / 600000

return true
end