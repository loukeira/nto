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
local msg = string.lower(msg)
local moeda = 884
local t = {
   ["Gunbai"] = {15, 346}, -- ["nome do item"] = {quanto vai custar, id do tem que sera vendido}
   ["Yondaime Tunic"] = {5, 7408},
   ["Tobi War Mask"] = {5, 7380},
   ["Madara Boots"] = {5, 111},
   ["Madara Legs"] = {5, 110},
   ["Madara Armor"] = {5, 107},
   ["Nagato Ring"] = {15, 112},
   ["Chojuro Sword"] = {10, 114},
   ["Hidan Amulet"] = {5, 845}
    }
local t2 = { ["Semana de premium"] = {5, 3277},
   ["Mes de premium"] = {10, 3276},
   ["Obito"] = {15, 316},
   ["Madara"] = {20, 395},
   ["Minato"] = {15, 118},
   ["Raikage"] = {20, 117},
   ["Kisame"] = {15, 116},
   ["Itachi"] = {15, 115},
   ["Hashirama"] = {20, 829},
   ["Tsunade"] = {20, 830},
   ["Remover Red Skull"] = {10, 3578},
   ["Remover Black Skull"] = {15, 3579}
}
---------------------------------------------------------
if(msgcontains(msg, 'pontos')) then
selfSay('entre em nosso blog e compre: {http://ntoheld.blogspot.com.br/}', cid)
talkState[talkUser] = 1
end
end
---------------------------------------------------------

if (msgcontains(msg, 'Item') or msgcontains(msg, 'ITEM'))then
local str = ""
str = str .. "Eu Posso lhe Vender Esse Items: "
for name, pos in pairs(t) do
str = str.." {"..name.."} por "..pos[1].." Pontos, "
end
str = str .. "."
npcHandler:say(str, cid)
elseif t[msg] then
                if doPlayerRemoveItem(cid,moeda,t[msg][1]) then
                       doPlayerAddItem(cid,t[msg][2],1)
                        npcHandler:say("Aqui está seu ".. getItemNameById(t[msg][2]) .."!", cid)
                else
                        npcHandler:say("Voce nao tem pointos suficientes! para adquirir pointos entre no blog de nosso server para saber como pagar: ".. getItemNameById(moeda), cid)
                end
end
---------------------------------------------------------
if (msgcontains(msg, 'ACCOUNT') or msgcontains(msg, 'account'))then
local str = ""
str = str .. "Eu Posso lhe Vender Esse Pergaminhos: "
for name, pos in pairs(t2) do
str = str.." {"..name.."} por "..pos[1].." Pontos, "
end
str = str .. "."
npcHandler:say(str, cid)
elseif t2[msg] then
                if doPlayerRemoveItem(cid,moeda,t2[msg][1]) then
                       doPlayerAddItem(cid,t2[msg][2],1)
                        npcHandler:say("Aqui está seu ".. getItemNameById(t2[msg][2]) .."!", cid)
                else
                        npcHandler:say("Voce nao tem pointos suficientes! para adquirir pointos entre no blog de nosso server para saber como pagar: ".. getItemNameById(moeda), cid)
                end
end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())