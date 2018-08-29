local focus = 0
local talk_start = 0
local target = 0
local following = false
local attacking = false
local talkState = {}
local finalname = ""
 
function onThingMove(creature, thing, oldpos, oldstackpos)
end
 
function onCreatureAppear(creature)
end
 
function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Até Mais Senhor!')
focus = 0
talk_start = 0
end
end
 
if (msgcontains(msg, 'hi') and (focus == 0) and (focus ~= cid) and (getDistanceToCreature(cid) <= 4)) then
--if not isPremium(cid) then
--selfSay("Oi, "..getCreatureName(cid).."! Sinto muito, mas eu só posso dar trocar o nickname de somente membros premium!")
--return true
--end
focus = cid
talkState[talkUser] = 1
selfSay("Oi, "..getCreatureName(cid).."! Eu posso trocar o seu nickname gostaria de trocar ?")
elseif (msgcontains(msg, "no") or msgcontains(msg, "bye")) and focus == cid and talkState[talkUser] ~= 3 then
selfSay("Não tem problema, então, senhor. Volte quando quizer!")
focus = 0
elseif msgcontains(msg, "yes") and focus == cid and talkState[talkUser] == 1 then
end
selfSay("Qual nickname você gostaria ?")
talkState[talkUser] = 3
elseif talkState[talkUser] == 3 and focus == cid then
 
local tablee = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "x", "w", "y", "z", ".", ":", "'", '"', "~", "^", "@", "#", "$", "%", "&", "*", "(", ")", "-", "+", "_", "?", ">", "<", "•", ";", "°", "¹", "²", "³", "£", "¢", "¬", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}
local table = {"'", '"', "!", "ã", "õ", "ç", "´", "`", "á", "à", "ó", "ò", "é", "è", "í", "ì", "ú", "ù", "¹", "²", "³", "£", "¢", "¬", "§", "°", "º", "ª", "•", "|"}
for a = 1, #table do
if string.find(msg, table[a]) then
selfSay("Lamentamos, mas o nick tem símbolos inválidos.")
return true
end
end
if string.len(msg) <= 1 or string.len(msg) >= 14 then
selfSay("Desculpe, esse nick é muito longo ou muito curto!")
return true
end
selfSay("Tem certeza que você quer mudar o seu  "..nickname.."\""..msge.."\"?  Isso vai lhe custar 10 dólares")
talkState[talkUser] = 5
finalname = msge
elseif msgcontains(msg, "yes") and focus == cid and talkState[talkUser] == 5 then
if doPlayerRemoveMoney(cid, 100000) == false then
selfSay("Você não tem dinheiro suficiente para pagar este serviço, volte mais tarde.")
focus = 0
talkState[talkUser] = 0
return true
end
if getPlayerStorageValue(cid, 9912) == -1 then
setPlayerStorageValue(cid, 9912, 0)
end
function onThink()
if focus ~= 0 then
a, b, c = selfGetPosition()
if c ~= getThingPos(focus).z then
focus = 0
end
end
 
if focus ~= 0 then
if getDistanceToCreature(focus) > 6 then
focus = 0
end
end
 
return true
end