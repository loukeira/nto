function onSay(cid, words, param)
if getCreatureName(item2.uid) == "madara" and isMonster(item2.uid) == TRUE and getCreatureName(getCreatureSummons(cid)[1]) == "madara" then 
doCreatureSay(cid, "Ditto, reverse transformation!", 1) 
xd = doSummonCreature(getCreatureName(item2.uid), topos) 
doCreatureAddHealth(xd, -getCreatureHealth(xd)+getCreatureHealth(getCreatureSummons(cid)[1])) 
doTeleportThing(xd, getCreaturePosition(getCreatureSummons(cid)[1]), false) 
doRemoveCreature(item2.uid) 
doConvinceCreature(cid, xd) 
return TRUE 
end 
 
if isMonster(item2.uid) == TRUE and getCreatureName(getCreatureSummons(cid)[1]) == "madara" then 
doCreatureSay(cid, "Ditto, transform in ".. getCreatureName(item2.uid) .."!", 1) 
doSetCreatureOutfit(getCreatureSummons(cid)[1], getCreatureOutfit(item2.uid), 18000) 
return TRUE 
else 
doPlayerSendCancel(cid,"Apenas para ditto é possivel usar.") 
return TRUE 
end 
end


