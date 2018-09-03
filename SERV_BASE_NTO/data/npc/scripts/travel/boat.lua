local keywordHandler = KeywordHandler:new()

local npcHandler = NpcHandler:new(keywordHandler)

NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)    npcHandler:onCreatureAppear(cid) end

function onCreatureDisappear(cid)    npcHandler:onCreatureDisappear(cid) end

function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg) end

function onThink()       npcHandler:onThink() end


local travelNode = keywordHandler:addKeyword({'suna'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to Suna Gakure, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 1, cost = 0, destination = {x=564, y=1145, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})


local travelNode = keywordHandler:addKeyword({'mist'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dou you wanna go to Mist Gakure, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  level = 1, cost = 0, destination = {x=1149, y=1218, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

local travelNode = keywordHandler:addKeyword({'twist'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dou you wanna go to twist Gakure, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  premium = true,  level = 1, cost = 0, destination = {x=1307, y=1279, z=2} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})


local travelNode = keywordHandler:addKeyword({'konoha'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dou you wanna go to Konoha Gakure, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 1, cost = 0, destination = {x=1015, y=906, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})


local travelNode = keywordHandler:addKeyword({'amegakure'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to Amekagure no Sato, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 1, cost = 0, destination = {x=972, y=1430, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})


local travelNode = keywordHandler:addKeyword({'valley of the end'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dou you wanna go to Valley of the End, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 1, cost = 0, destination = {x=965, y=830, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})


local travelNode = keywordHandler:addKeyword({'south florest'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Dou you wanna go to Souty Florest, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = false, level = 1, cost = 0, destination = {x=912, y=1179, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})


local travelNode = keywordHandler:addKeyword({'west desert'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to West Desert, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 1, cost = 0, destination = {x=1496, y=1053, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})


local travelNode = keywordHandler:addKeyword({'south island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to Sounth Island, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, level = 1, cost = 0, destination = {x=1084, y=1400, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

--------------------------------------
local travelNode = keywordHandler:addKeyword({'zetsu covil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to zetsu covil, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  premium = false, level = 1, cost = 0, destination = {x=1658, y=33, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

--------------------------------------
local travelNode = keywordHandler:addKeyword({'member akatsuki covil'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to member akatsuki covil, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  premium = false, level = 1, cost = 0, destination = {x=1715, y=204, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

--------------------------------------
local travelNode = keywordHandler:addKeyword({'paper island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to paper island, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  premium = true, level = 1, cost = 0, destination = {x=1547, y=1830, z=6} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

--------------------------------------

local travelNode = keywordHandler:addKeyword({'orochimaru island'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to orochimaru island, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  premium = true, level = 1, cost = 0, destination = {x=1863, y=394, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})

--------------------------------------
local travelNode = keywordHandler:addKeyword({'vila shinobi'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you wanna go to Vila Shinobi, are you sure?'})
 
travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler,  premium = true, level = 1, cost = 0, destination = {x=792, y=1496, z=7} })
 
travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'Next time maybe.'})


keywordHandler:addKeyword({'area free'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 
'I can take you to Suna,Mist,Konoha,Amegakure,Valley of the End,South Florest,South Island,West Desert,Zetsu Covil,Member Akatsuki Covil.'})

keywordHandler:addKeyword({'area vip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 
'Posso Lhe Leva Para a {Paper Island},Onde a Konans Que Dão Muinto Dinheiro,{Orochimaru Island},Onde os orochimarus Que Dão Muinto Dinheiro,Tambem Posso Lhe Leva Para a {Vila Shinobi},Onde Muintos Shinobis Vivem e Comercializa Items,e Casas.'})

keywordHandler:addKeyword({'area evento'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 
'Nesse Momento a Area Dos Eventos Esta Em Construção.'})
        
-- Makes sure the npc reacts when you say hi, bye etc.
        
npcHandler:addModule(FocusModule:new())