domodlib('task_func')
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
if isInArray({"task","tasks","missao","missao"}, msg) then
npcHandler:say("Me Diga o Nome Do Monstro Que Voce Quer Mata", cid)
talkState[talkUser] = 1
elseif talkState[talkUser] == 1 then
if tasktabble[msg] then
if CheckTask(cid) ~= true then
local contagem = getPlayerStorageValue(cid, tasktabble[msg].storage)
if (contagem == -1) then contagem = 1 end
if not tonumber(contagem) then npcHandler:say('Desculpe, mas voc� j� terminou a task do '..msg, cid) return true end
setPlayerStorageValue(cid, tasktabble[msg].storage_start, 1)
npcHandler:say("Parabens,Agora Voce Fais Parte Da Missao, "..msg..", falta exterminar "..string.sub(((contagem)-1)-tasktabble[msg].count, 2).." "..msg, cid)
talkState[talkUser] = 0
else
npcHandler:say('Voce N�o Pode Pega 2 Missao', cid)
talkState[talkUser] = 0
end
else
npcHandler:say('Digite o Nome Correto Da Missao,Para Ver As Missao De Matar Fale {!task}', cid)
talkState[talkUser] = 1
end
elseif isInArray({"receber","reward","recompensa","report","reportar"}, msg) then
if CheckTask(cid) then
for k, v in pairs(tasktabble) do
racetype = k
if getPlayerStorageValue(cid,v.storage_start) >= 1 then
local contagem = getPlayerStorageValue(cid, v.storage)
if (contagem == -1) then contagem = 1 end
if not tonumber(contagem) then npcHandler:say('Voce Ja Recebeu Sua Recompensa', cid) return true end
if (((contagem)-1) >= v.count) then
for _, check in pairs(configbosses_task) do
if string.lower(check.race) == string.lower(racetype) then
local on = getPlayersOnline()
for i=1, #on do
if HavePlayerPosition(on[i], check.FromPosToPos[1],check.FromPosToPos[2]) then
selfSay('aguarde alguns instantes, tem pessoas fazendo a task.', cid) return true
end
end
doTeleportThing(cid, check.Playerpos)
local function checkArea(cid)
if not isCreature(cid) then return LUA_ERROR end
if HavePlayerPosition(cid, check.FromPosToPos[1],check.FromPosToPos[2]) then
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
end
end
addEvent(checkArea, check.time*60*1000, cid)
end
end
local str = ""
if v.exp ~= nil then doPlayerAddExp(cid, v.exp ) str = str.."".. (str == "" and "" or ",") .." "..v.exp.." de exp" end
if v.money ~= nil then doPlayerAddMoney(cid, v.money) str = str.."".. (str == "" and "" or ",") ..""..v.money.." gps" end
if v.reward ~= nil then doAddItemsFromList(cid,v.reward) str = str.."".. (str == "" and "" or ",") ..""..getItemsFromList(v.reward) end
npcHandler:say("Obrigado pela sua ajuda Recompensas: "..(str == "" and "nenhuma" or ""..str.."").." por ter completado a task do "..k, cid)
setPlayerStorageValue(cid, v.storage, "Finished")
setPlayerStorageValue(cid, v.storage_start, 0)
setPlayerStorageValue(cid, 521456, getPlayerStorageValue(cid, 521456) == -1 and 1 or getPlayerStorageValue(cid, 521456)+1)
finisheAllTask(cid)
else
npcHandler:say('Desculpe,mas voc� s� matou '..((contagem)-1)..' de '..v.count..' '..k, cid)
end
end
end
else
npcHandler:say("voc� n�o est� em nenhuma miss�o task", cid)
end
elseif isInArray({"sair","passa","exit"}, msg) then
if CheckTask(cid) then
talkState[talkUser] = 2
for k, v in pairs(tasktabble) do
if getPlayerStorageValue(cid,v.storage_start) >= 1 then
storagesair = v.storage_start
local contagem = getPlayerStorageValue(cid, v.storage)
if (contagem == -1) then contagem = 1 end
npcHandler:say('voc� est� participando de uma miss�o task do '..k..' e j� tem '..((contagem)-1)..' '..k..' mortos, deseja mesmo sair?', cid)
end
end
else
npcHandler:say("voc� n�o est� em nenhuma miss�o task", cid)
end
elseif msgcontains(msg, 'yes') and talkState[talkUser] == 2 then
setPlayerStorageValue(cid, storagesair, 0)
npcHandler:say("Voc� foi retirado da task com sucesso!", cid)
elseif msg == "no" then 
selfSay("Tudo bem ent�o", cid) 
talkState[talkUser] = 0 
npcHandler:releaseFocus(cid) 
end
return TRUE
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())