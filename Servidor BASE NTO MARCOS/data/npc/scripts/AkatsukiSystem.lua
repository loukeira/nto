-- Script Akatsuki System Advance 1.0 --
-- By RigBy --
-- Xtibia.com --
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end
 
local level = 1 -- Level preciso pra entra para akatsuki
local itemid = 5943 -- id do coração
local quantidade = 6 -- quantos hearts e preciso
local bonushp = 300000 -- quanto de bonus de life vai ganha
local bonusmp = 30000 -- quanto de bonus de mana vai ganha
local experience = 20 -- Experience rates no caso 2x a experiencia do seu servidor.
local config = {
--[Vocation] = ( Nova Vocation, New Outfit )
[1] = { 5, 128},
[2] = { 6, 129},
[3] = { 7, 130},
[4] = { 8, 131},
[5] = { 9, 300},
}
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
 return false
end
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
 
if msgcontains(msg, 'akatsuki') then
    if getPlayerVocation(cid) ~= config then
        if getPlayerStorageValue(cid, 89745) == -1 then
            if getPlayerLevel(cid) >= level then
                selfSay('Tem certeza de que quer se juntar a Akatsuki?.', cid)
                talkState[talkUser] = 1
            else
                selfSay('Você nem sabe o nível que é pra entrar na akatsuki, suma da minha frente seu idiota.', cid)
            end
        else
            selfSay('Você já faz parte da Akatsuki!', cid)
        end
    else
        selfSay('Não preciso de você agora!', cid)
    end
end
 
if talkState[talkUser] == 1 and msgcontains(msg, 'yes') then
    selfSay('Para provar a sua lealdade, você tem que trazer '..quantidade..' {coraçao}.', cid)
    talkState[talkUser] = 2
end
 
if talkState[talkUser] == 2 and msgcontains(msg, 'coraçao') then
    if getPlayerItemCount(cid, 5943) >= 6 then
    local voc = config[getPlayerVocation(cid)]
        doPlayerSetVocation(cid, voc[1])
    local outfit = {lookType = voc[2]}
        doCreatureChangeOutfit(cid, outfit)
        setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+bonushp)
        setCreatureMaxMana(cid, getCreatureMaxMana(cid)+bonusmp)
        doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
        doPlayerRemoveItem(cid, 5943, 6)
        doCreatureAddMana(cid, getCreatureMaxMana(cid))
        setPlayerStorageValue(cid,89745,6)
        doPlayerSetExperienceRate(cid, experience) 
        selfSay('Parabéns agora você faz parte da Akatsuki.', cid)
        talkState[talkUser] = 0
    else
        selfSay('Não adianta me enganar, você não tem '..quantidade..' corações, vai atrás, e só volte com eles.', cid)
    end
end
return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())