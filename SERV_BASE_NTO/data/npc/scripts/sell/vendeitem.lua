local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg)	end
function onThink()						npcHandler:onThink()						end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)


-------BUYABLE
shopModule:addBuyableItem({'tobi war mask'},                   7380, 5000000,       'tobi war mask')
shopModule:addBuyableItem({'yondaime tunic '},				7408, 5000000,		'yondaime tunic')
shopModule:addBuyableItem({'sennin legs'},                   2431, 5000000,       'sennin legs')
shopModule:addBuyableItem({'vital boots'},         7402, 5000000,       'vital boots')
shopModule:addBuyableItem({'kage shuriken'}, 2659, 5000000,       'kage shuriken')
shopModule:addBuyableItem({'kimimaro whip'}, 2396, 15000000,       'kimimaro whip')



npcHandler:addModule(FocusModule:new())