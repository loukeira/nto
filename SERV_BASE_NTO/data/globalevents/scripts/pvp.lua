function onThink(interval, lastExecution)

local total_players = 0
local storage = 24658 -- ALTERAR storage usado no sistema deixar todos iguais
local item_premio = 2160 -- ALTERAR item dado de premio, caso não queira dar item, coloque 2160
local item_quantidade_premio = 1500 -- ALTERAR quantidade do item ganho, caso não queira dar item , coloque 0
local player_escolhido = 0
local players = getPlayersOnline()
local i = 1
local pos_templo = {x = 1030, y = 913, z = 6} -- ALTERAR coordenada do templo do seu ot server

if getGlobalStorageValue(storage) == 1 then
else
return TRUE
end

while i <= #players do
local pos_player = getPlayerPosition(players[i])
local pos1_arena = {x = 1024, y = 892, z = 12} -- ALTERAR pos do canto superior esquerdo da arena
local pos2_arena = {x = 1224, y = 1085, z = 12} -- ALTERAR pos do canto inferior direito da arena
if pos_player.x >= pos1_arena.x and pos_player.y >= pos1_arena.y and pos_player.x <= pos2_arena.x and pos_player.y <= pos2_arena.y then
total_players = total_players + 1
player_escolhido = players[i]

end
i = i + 1
end

if total_players == 1 then
setGlobalStorageValue(storage, -1)
doTeleportThing(player_escolhido, pos_templo)
doPlayerAddItem(player_escolhido, item_premio, item_quantidade_premio)
doPlayerSendTextMessage(player_escolhido, MESSAGE_STATUS_CONSOLE_BLUE, "Você é o Vencedor do Evento.") -- ALTERAR frase para o vencedor do premio
doBroadcastMessage("O Player "..(getPlayerName(player_escolhido)).." é o Vencedor do Evento.",22) -- ALTERAR frase para todos, do ganhador do premio
return TRUE
else
if total_players <= 0 then
setGlobalStorageValue(storage, -1)
doBroadcastMessage("Todos os Jogadores Se mataram, fim do Evento.",22) -- ALTERAR frase para todos, do ganhador do premio
return TRUE
end
end

return TRUE
end