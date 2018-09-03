local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function oracle(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end

if getGlobalStorageValue(24658) ~= 0 then -- ALTERAR Storage usado no Sistema, colocar sempre o mesmo
npcHandler:say("O Evento Está Fechado.", cid)
return true
end

if doPlayerRemoveMoney(cid, 10000) == true then -- ALTERAR 10000, esse é o valor para entrar
doTeleportThing(cid, {x=1009,y=804,z=12}) -- ALTERAR coordenada da sala de espera
npcHandler:say("Obrigado Até Mais!.", cid) -- ALTERAR frase que o npc fala após entrar na sala de espera
else
npcHandler:say("Voce Não Possui 10g.", cid) -- ALTERAR frase caso o player não tenha 10k
return true
end

return true
end

function oracle1(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end
npcHandler:say("Volte Quando Tive 10g", cid) -- ALTERAR frase caso o player diga No
return true
end



local node0 = keywordHandler:addKeyword({'evento'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce Possui 10g Para Me Paga?'}) -- ALTERAR segunda frase de interação
node0:addChildKeyword({'yes'}, oracle, {blessing = 1})
node0:addChildKeyword({'no'}, oracle1, {blessing = 1})

npcHandler:addModule(FocusModule:new())