local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                        npcHandler:onThink()                        end


function thinkCallback(cid)
local rand = math.random(1,100)
if rand == 1 then
selfSay('iremos captura os bijuus e fazer o tsukuyomi no me')
end
return true
end

function greetCallback(cid)

return true

end

if(msgcontains(msg, 'missoes')) then
selfSay('Ok, Para começar vamos fazer a {primeira missao}?', cid)
end
---------------------------------------------------------
if(msgcontains(msg, 'primeira missao')) then
selfSay('Va até o local 06 do MAPA, mate uns nekenins e me traga 10 Nukenin {talisma}', cid)
talkState[talkUser] = 1
elseif(msgcontains(msg, 'talisma') and talkState[talkUser] == 1) then
if (getPlayerStorageValue(cid,111) > 0) then
selfSay('Voce ja terminou essa missao.', cid)
else
if(doPlayerRemoveItem(cid, 10551, 10) == TRUE) then
setPlayerStorageValue(cid,111,1)
doPlayerAddExperience(cid,1000)
doPlayerAddItem(cid,10136,1)
selfSay('Obrigado! Se quiser ja podes fazer a {segunda missao}.. (ganhou um livro do kakashi de presete e ganhou 1000 de exp por ler)', cid)
else
selfSay('Voce não tens os 10 nukenins talisma ainda..', cid)
end
end
return true
end
 
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())
