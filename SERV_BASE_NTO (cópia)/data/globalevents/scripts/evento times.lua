function onTime(interval, lastExecution)
 
local players = getPlayersOnline()
local conta_players = 0
local player_time = 9              -- ALTERAR quantidade de players por time
local pos_teleport = {x = 1030, y = 913, z = 4} -- ALTERAR posição em que o teleport vai nascer
local pos_espera = {x = 1009, y = 904, z = 12}   -- ALTERAR posição da sala de espera até iniciar o evento
local storage = 873456                     -- ALTERAR storage usado no sistema
local tempo_espera = 60 * 1000             -- ALTERAR tempo que players vão esperar na sala de espera
local pos_topos = {
{x = 1023, y = 773, z = 12},     -- ALTERAR posição em que o time 1 vai nascer
{x = 1072, y = 858, z = 12},     -- ALTERAR posição em que o time 2 vai nascer
{x = 1148, y = 809, z = 12},     -- ALTERAR posição em que o time 3 vai nascer
}  
local pos_templo = {x = 1030, y = 913, z = 6} -- ALTERAR posição do templo
 
if #players <= (player_time*3) then
   print("[************] >> Evento Cancelado - Menos de "..(player_time*3).." players online.")
   return TRUE
end
 
doCreateTeleport(1387, pos_espera, pos_teleport)
doBroadcastMessage("Evento de Times Aberto Vocês tem "..(tempo_espera/1000).." segundos para entrar no portal.",22)
 
addEvent(
function()
         local i = 1
         local a = 1
         local pos_espera1 = {x = 1002, y = 800, z = 12}  -- ALTERAR posição do canto superior esquerdo da sala de espera
         local pos_espera2 = {x = 1016, y = 809, z = 12}  -- ALTERAR posição do canto inferior direito da sala de espera
         while i <= #players do
              
              local pos_player = getPlayerPosition(players[i])
              if pos_player.x >= pos_espera1.x and pos_player.y >= pos_espera1.y and pos_player.x <= pos_espera2.x and pos_player.y <= pos_espera2.y then
                       if getPlayerGroupId(players[i]) <= 1 then
                                  conta_players = conta_players + 1
                       end
              end
              i = i + 1
               
         end
         
         i = 1
         
         if conta_players < (player_time*3) then
         
                  while i <= #players do
              
                       local pos_player = getPlayerPosition(players[i])
                       if pos_player.x >= pos_espera1.x and pos_player.y >= pos_espera1.y and pos_player.x <= pos_espera2.x and pos_player.y <= pos_espera2.y then
                                if getPlayerGroupId(players[i]) <= 1 then
                                           doTeleportThing(players[i], pos_templo)
                                end
                       end
                       i = i + 1
               
                  end
                  print("[************] >> Evento Cancelado - Menos de "..(player_time*3).." players na sala de espera.")
                  return TRUE         
         else
 
                  while i <= #players do
                  
                  local outfit1 = getCreatureOutfit(players[i]) 
                        outfit1.lookHead = 81 
                        outfit1.lookBody = 81 
                        outfit1.lookLegs = 81 
                        outfit1.lookFeet = 81
 
                  local outfit2 = getCreatureOutfit(players[i]) 
                        outfit2.lookHead = 86 
                        outfit2.lookBody = 86 
                        outfit2.lookLegs = 86 
                        outfit2.lookFeet = 86
 
                  local outfit3 = getCreatureOutfit(players[i]) 
                        outfit3.lookHead = 94 
                        outfit3.lookBody = 94 
                        outfit3.lookLegs = 94 
                        outfit3.lookFeet = 94 
              
                       local pos_player = getPlayerPosition(players[i])
                       if pos_player.x >= pos_espera1.x and pos_player.y >= pos_espera1.y and pos_player.x <= pos_espera2.x and pos_player.y <= pos_espera2.y then
                                if getPlayerGroupId(players[i]) <= 1 then
                                           if a == 1 then
                                              setPlayerStorageValue(players[i], storage, 1)
                                              doTeleportThing(players[i], pos_topos[1])
                                              doSetCreatureOutfit(players[i], outfit1, -1)
                                              a = 2
                                           else
                                               if a == 2 then
                                                  setPlayerStorageValue(players[i], storage, 2)
                                                  doTeleportThing(players[i], pos_topos[2])
                                                  doSetCreatureOutfit(players[i], outfit2, -1)
                                                  a = 3
                                               else
                                                   if a == 3 then
                                                      setPlayerStorageValue(players[i], storage, 3)
                                                      doTeleportThing(players[i], pos_topos[3])
                                                      doSetCreatureOutfit(players[i], outfit3, -1)
                                                      a = 1
                                                   end                                                  
                                               end                                              
                                           end
                                           
                                end
                       end
                       i = i + 1
               
                  end
                  doBroadcastMessage("Evento Iniciado, Bora matar o Boss.",22)      
         end
          
end
,tempo_espera)
return TRUE
end