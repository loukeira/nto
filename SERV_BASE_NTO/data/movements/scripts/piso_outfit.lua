function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

if getCreatureName(cid) == "Account Manager" then return true end


  if not isPlayer(cid) then
   return true
  end



  if (item.actionid == 111) 



            doSetCreatureOutfit(cid, {lookType = sagas[getPlayerVocationName(cid)][saga]}, -1)

            doSendMagicEffect(getCreaturePosition(cid), 3)
            
    end
  
 




--// 
 return true
end


