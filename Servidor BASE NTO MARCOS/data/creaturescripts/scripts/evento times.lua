function onKill(cid, target, lasthit)
 
if getCreatureName(target) == "Boss" then    -- ALTERAR nome do BOSS
 
local storage = 873456                  -- ALTERAR storage usado no sistema
local players = getPlayersOnline()
local storage_p = getPlayerStorageValue(cid, storage)
local i = 1
local pos_arena1 = {x = 1023, y = 773, z = 12}  -- ALTERAR posição do canto superior esquerdo da sala de arena
local pos_arena2 = {x = 1155, y = 862, z = 12}  -- ALTERAR posição do canto inferior direito da sala de arena
local pos_templo = {x = 1030, y = 913, z = 6}  -- ALTERAR posição do templo
local tempo = 60 * 1000                   -- ALTERAR tempo para o player pegar o premio e vazar da arena antes que ele seja expulso
local pos_teleport =  {x = 1030, y = 913, z = 6} -- ALTERAR posição do teleport para ser retirado mesma do globalevents
 
while i <= #players do
              
      local pos_player = getPlayerPosition(players[i])
      
      if pos_player.x >= pos_arena1.x and pos_player.y >= pos_arena1.y and pos_player.x <= pos_arena2.x and pos_player.y <= pos_arena2.y then
                if getPlayerGroupId(players[i]) <= 1 then
                        if getPlayerStorageValue(players[i], storage) == storage_p then
                                  setPlayerStorageValue(players[i], storage, 4)
                                  doPlayerSendTextMessage(players[i], MESSAGE_STATUS_CONSOLE_BLUE, "Você tem "..(tempo/1000).." segundos para pegar seu premio e sair.")
                                  addEvent(doTeleportThing,tempo,players[i], pos_templo)
                        else
                                  setPlayerStorageValue(players[i], storage, -1)
                                  doTeleportThing(players[i], pos_templo)
                                  doPlayerSendTextMessage(players[i], MESSAGE_STATUS_CONSOLE_BLUE, "Seu time perdeu o Evento, quem sabe em uma proxima.")
                        end
                end     
      end
      doRemoveCondition(players[i], CONDITION_OUTFIT)
      
      i = i + 1
               
end
 
local item5 = getTileItemById(pos_teleport, 1387)
if item5.uid > 0 then
   doRemoveItem(item5.uid, 1)
end
   
end
        
return TRUE
end