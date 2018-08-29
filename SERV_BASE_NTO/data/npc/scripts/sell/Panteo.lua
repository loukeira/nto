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
shopModule:addBuyableItem({'chakra legs'},         2430, 2000000,       'chakra legs')
shopModule:addBuyableItem({'nukenin talisman'},                   10551, 10000,       'nukenin talisman')
shopModule:addBuyableItem({'orochimaru tunic'},         2534, 1500000,       'orochimaru tunic')
shopModule:addBuyableItem({'raikage glove'},                   2516, 3500000,       'raikage glove')
shopModule:addBuyableItem({'renegade essence'},         6500, 10000,       'renegade essence')
shopModule:addBuyableItem({'sennin legs'},                   2431, 7500000,       'sennin legs')
shopModule:addBuyableItem({'vital boots'},                   7402, 7000000,       'vital boots')

npcHandler:addModule(FocusModule:new())