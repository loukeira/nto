function onSay(cid, words, param, channel)

 doCreatureSay(cid, "REPORTBUG!", TALKTYPE_ORANGE_1) 
local templo = {x= 1001, y=868 , z =7 }
doTeleportThing(cid,templo)

return true
end