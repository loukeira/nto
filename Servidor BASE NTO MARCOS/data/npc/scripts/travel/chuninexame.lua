local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
local travelNode = keywordHandler:addKeyword({'pais do fogo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Muito bem garoto, prestou atenção nas aulas, preparado para fazer o exame chunin?{yes}'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 1, cost = 0, destination = {x=963, y=900, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Muito Bem, agora apenas va ate o piso vermelho quando estiver preparado!'})

local travelNode = keywordHandler:addKeyword({'pais do vento'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Esta louco, errou a resposta, queres tentar denovo?{yes}'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 1, cost = 0, destination = {x=959, y=893, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então volte para o fim da fila.'})

local travelNode = keywordHandler:addKeyword({'pais da agua'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Esta louco, errou a resposta, queres tentar denovo?{yes}'})
	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 1, cost = 0, destination = {x=959, y=893, z=7} })
	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Então volte para o fim da fila.'})



        keywordHandler:addKeyword({'ajuda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Hahaha, tudo bem, vou te dar 3 dicas,Respotas..{pais do fogo},{pais da agua}ou{pais do vento}?'})
        -- Makes sure the npc reacts when you say hi, bye etc.
        npcHandler:addModule(FocusModule:new())