local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

    if(npcHandler.focus ~= cid) then
        return false
    end
    
    if msgcontains(msg,'jutsus') then
        if getPlayerVocation(cid) == 10 or getPlayerVocation(cid) == 5 then
            selfSay('What jutsu want to learn (hokage impulse, hokage heal & tensei no jutsu).?')
        else
            selfSay('Sorry, I only sell spells to sorcerers.')
        end
    end
return 1    
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
 
 
local node1 = keywordHandler:addKeyword({'hokage impulse'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to learn hokage impulse for 170 gp?'})
node1:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'Bijuu Furie', vocation = 10, price = 170, level = 120})
node1:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the jutsu?', reset = true})
 
 
local node2 = keywordHandler:addKeyword({'hokage heal'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to hokage heal for 80 gp?'})
node2:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'Hokage Heal Person', vocation = 10, price = 80, level = 120})
node2:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the jutsu?', reset = true})
 
 
local node3 = keywordHandler:addKeyword({'tensei no jutsu'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Would you like to tensei no jutsu magic missile for 500 gp?'})
node3:addChildKeyword({'yes'}, StdModule.learnSpell, {npcHandler = npcHandler, premium = false, spellName = 'Bijuu Furie', vocation = 10, price = 500, level = 120})
node3:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Cant you handle the power of the jutsu?', reset = true})
 
npcHandler:addModule(FocusModule:new())