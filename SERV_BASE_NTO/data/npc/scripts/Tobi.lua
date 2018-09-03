local keywordHandler = KeywordHandler:new() 
local npcHandler = NpcHandler:new(keywordHandler) 
NpcSystem.parseParameters(npcHandler) 
local talkState = {} 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end 
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end 
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end 
function onThink() npcHandler:onThink() end 
function creatureSayCallback(cid, type, msg) 
if(not npcHandler:isFocused(cid)) then 
return false 
end 
local talkUser = NPCHANDLER_CONVbehavior == CONVERSATION_DEFAULT and 0 or cid

local moedas = {2157}
local t = {
      ["kamui prision"] = {price = 250,vocations = {213,214,215,216,217,263,264,265,266,267},level = 250},
      ["new pain rikudou"] = {price = 250,vocations = {213,214,215,216,217,263,264,265,266,267},level = 250}
      }

if (msgcontains(msg, 'SPELLS') or msgcontains(msg, 'spells'))then
local str = ""
str = str .. "Eu vendo estas Magias: "
for name, pos in pairs(t) do
str = str.." {"..name.."} = "..pos.price.." Moedas /"
end
str = str .. "." 
npcHandler:say(str, cid)
elseif t[msg] then
        if not getPlayerLearnedInstantSpell(cid, msg) then
        if getPlayerLevel(cid) >= t[msg].level then
        if isInArray(t[msg].vocations, getPlayerVocation(cid)) then
        if doPlayerRemoveItem(cid,moedas[1],t[msg].price) or doPlayerRemoveItem(cid,moedas[2],t[msg].price) then
            doPlayerLearnInstantSpell(cid, msg)
            npcHandler:say("Você aprendeu uma nova magia chamada ".. msg .."!", cid)
        else
            npcHandler:say("você precisa de  "..t[msg].price.." ".. getItemNameById(moedas[1]).." ou  "..t[msg].price.." ".. getItemNameById(moedas[2]), cid)
        end
        else
            npcHandler:say("você não tem a vocação para comprar está spell.", cid)
        end
        else
            npcHandler:say("você precisa ter level "..t[msg].level.." ou mais para comprar essa magia.", cid)
        end
        else
            npcHandler:say("você já aprendeu essa magia.", cid)
        end

end 
return TRUE 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())