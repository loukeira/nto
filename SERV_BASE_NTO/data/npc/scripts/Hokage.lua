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

local moedas = {2157,9020}
local t = {
      ["rasengan!"] = {price = 15,vocations = {248},level = 30},
      ["find person"] = {price = 25,vocations = {3,4},level = 8},
      ["light magic missile"] = {price =30,vocations = {1,5,4,7,8},level = 15},
      ["energy strike"] = {price =20,vocations = {296},level = 12},
      ["flame strike"] = {price =100,vocations = {1,2,5,6},level = 12}
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
            npcHandler:say("Voc� aprendeu uma nova magia chamada ".. msg .."!", cid)
        else
            npcHandler:say("voc� precisa de  "..t[msg].price.." ".. getItemNameById(moedas[1]).." ou  "..t[msg].price.." ".. getItemNameById(moedas[2]), cid)
        end
        else
            npcHandler:say("voc� n�o tem a voca��o para comprar est� spell.", cid)
        end
        else
            npcHandler:say("voc� precisa ter level "..t[msg].level.." ou mais para comprar essa magia.", cid)
        end
        else
            npcHandler:say("voc� j� aprendeu essa magia.", cid)
        end

end 
return TRUE 
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback) 
npcHandler:addModule(FocusModule:new())