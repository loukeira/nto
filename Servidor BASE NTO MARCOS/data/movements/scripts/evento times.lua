function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
 
local storage = 873456                -- ALTERAR storage usado no sistema
if getPlayerStorageValue(cid, storage) ~= 4 then
          doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você não ganhou o Evento.")
          doTeleportThing(cid, fromPosition, true)
          return TRUE
end
 
return true
end