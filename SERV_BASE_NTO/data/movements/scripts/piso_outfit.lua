function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

if getCreatureName(cid) == "Account Manager" then return true end


  if not isPlayer(cid) then
   return true
  end


  local id_acc = getPlayerAccountId(cid)

  if (item.actionid == 111) 

      local lastLogin = getPlayerLastLoginSaved(cid)

 --MARCOS--
if getPlayerGUID(cid) > 20600 then
local saga, my_saga_max = get_saga(cid) -- PEGA AS SAGAS DA DATABASE.
local maximo = (#sagas[getPlayerVocationName(cid)]) -1
    if (getPlayerStorageValue(cid,storage_akatsuki) == 1) and (saga >= maximo) then
    doSetCreatureOutfit(cid, {lookType = sagas[getPlayerVocationName(cid)][saga+1]}, -1)
    return true
    end

doSetCreatureOutfit(cid, {lookType = sagas[getPlayerVocationName(cid)][saga]}, -1)

            doSendMagicEffect(getCreaturePosition(cid), 3)
            
    end
  
 




--// 
 return true
end


