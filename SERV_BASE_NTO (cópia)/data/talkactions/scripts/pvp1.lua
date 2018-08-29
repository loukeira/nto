function onSay(cid, words, param)

if getGlobalStorageValue(24658) >= 0 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Evento Já esta Online.")
end

doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Evento Acabou de Ser Ativado.") 
local tempo_espera = 60 * 1000 -- ALTERAR tempo de espera na sala, 1 minuto

doBroadcastMessage("Evento PVP foi Ativado.",22) -- ALTERAR frase que aparece para todos quando usar o comando
setGlobalStorageValue(24658, 0) -- ALTERAR storage usado no sistema, deixar todos iguais
addEvent(
function ()


local pos_templo = {x = 1030, y = 913, z = 6} -- ALTERAR coordenada do templo do seu ot server
doBroadcastMessage("Evento Iniciado.",22) -- ALTERAR frase quando todos forem para a arena
setGlobalStorageValue(24658, 1) -- ALTERAR storage usado no sistema, deixar todos iguais
local players = getPlayersOnline()
local i = 1
local total_player = 0

while i <= #players do
local pos_player = getPlayerPosition(players[i])
local pos1_espera = {x = 1002, y = 800, z = 12} -- ALTERAR pos do canto superior esquerdo da sala de espera
local pos2_espera = {x = 1016, y = 809, z = 12} -- ALTERAR pos do canto inferior direito da sala de espera
if pos_player.x >= pos1_espera.x and pos_player.y >= pos1_espera.y and pos_player.x <= pos2_espera.x and pos_player.y <= pos2_espera.y then
total_player = total_player + 1
end

i = i + 1
end

i = 1
if total_player <= 1 then
doBroadcastMessage("Evento Cancelado, Players Insuficientes.",22) -- ALTERAR Frase de evento cancelado por falta de players 
setGlobalStorageValue(24658, -1) -- ALTERAR storage usado no sistema, deixar todos iguais

while i <= #players do
local pos_player = getPlayerPosition(players[i])
local pos1_espera = {x = 1002, y = 800, z = 12} -- ALTERAR pos do canto superior esquerdo da sala de espera
local pos2_espera = {x = 1016, y = 809, z = 12} -- ALTERAR pos do canto inferior direito da sala de espera
if pos_player.x >= pos1_espera.x and pos_player.y >= pos1_espera.y and pos_player.x <= pos2_espera.x and pos_player.y <= pos2_espera.y then
doTeleportThing(players[i], pos_templo)
end

i = i + 1
end

return TRUE
end 

while i <= #players do
local pos_player = getPlayerPosition(players[i])
local pos1_espera = {x = 1002, y = 800, z = 12} -- ALTERAR pos do canto superior esquerdo da sala de espera
local pos2_espera = {x = 1016, y = 809, z = 12} -- ALTERAR pos do canto inferior direito da sala de espera
local pos_arena = {x = 1095, y = 963, z = 12} -- ALTERAR do inicio da arena
if pos_player.x >= pos1_espera.x and pos_player.y >= pos1_espera.y and pos_player.x <= pos2_espera.x and pos_player.y <= pos2_espera.y then
doTeleportThing(players[i], pos_arena)
doPlayerSendTextMessage(players[i], MESSAGE_STATUS_CONSOLE_BLUE, "Batalhe pela sua vida.") -- ALTERAR frase que vai aparecer para o player quando ele entrar na arena
end

i = i + 1
end

end
,tempo_espera)

return true
end