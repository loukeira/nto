
local item1 = 113
local quant1 = 15

local vocation13 = 245
local pos = {x=1024, y=1027, z=7}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)  npcHandler:onCreatureAppear(cid)  end
function onCreatureDisappear(cid)  npcHandler:onCreatureDisappear(cid)  end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)  end
function onThink()  npcHandler:onThink()  end

function santaNPC(cid, message, keywords, parameters, node)
if(not npcHandler:isFocused(cid)) then
return false
end
if(parameters.present == true) then
if(doPlayerRemoveItem(cid,item1,quant1) == true) then
doPlayerSetVocation(cid, 245)
doTeleportThing(cid, pos)
npcHandler:say('Pronto Se Troco Seu Vocation.',cid)
else
npcHandler:say('Voce Nao Tem Os Items.',cid)
end
npcHandler:resetNpc()
return true
end
end

npcHandler:setMessage(MESSAGE_GREET, "Ola |PLAYERNAME|. Voce Quer Troca Seu Premiu Do Evento Por As {Vocations} Kisame?.")

local noNode = KeywordNode:new({'no'}, santaNPC, {present = false})
local yesNode = KeywordNode:new({'yes'}, santaNPC, {present = true})

local node = keywordHandler:addKeyword({'vocations'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce Quer a Vocation Kisame?'})
node:addChildKeywordNode(yesNode)
node:addChildKeywordNode(noNode)
npcHandler:addModule(FocusModule:new())