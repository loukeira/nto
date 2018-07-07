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
 
local level = 200 -- Level preciso pra entra para akatsuki
local itemid = 4569 -- id do coração
local quantidade = 6 -- quantos hearts e preciso
local bonushp = 20000 -- quanto de bonus de life vai ganha
local bonusmp = 20000 -- quanto de bonus de mana vai ganha
local experience = 10 -- Experience rates no caso 2x a experiencia do seu servidor.
local config = {
--[Vocation] = ( Nova Vocation, New Outfit )
-- Naruto --
[402] = { 414, 744},
[434] = { 414, 744},
[1] = { 414, 744},
[2] = { 414, 744},
[3] = { 414, 744},
[4] = { 414, 744},
[5] = { 414, 744},
[6] = { 414, 744},
[7] = { 414, 744},
[8] = { 414, 744},
[9] = { 414, 744},
[10] = { 414, 744},
[11] = { 414, 744},
[12] = { 414, 744},
[279] = { 414, 744},
-- Sasuke --
[373] = { 415, 765},
[13] = { 415, 765},
[14] = { 415, 765},
[15] = { 415, 765},
[16] = { 415, 765},
[17] = { 415, 765},
[18] = { 415, 765},
[19] = { 415, 765},
[20] = { 415, 765},
[21] = { 415, 765},
[22] = { 415, 765},
[23] = { 415, 765},
[24] = { 415, 765},
-- Lee --
[25] = { 416, 742},
[26] = { 416, 742},
[27] = { 416, 742},
[28] = { 416, 742},
[29] = { 416, 742},
[30] = { 416, 742},
[31] = { 416, 742},
[32] = { 416, 742},
[33] = { 416, 742},
-- Gaara --
[61] = { 418, 749},
[50] = { 418, 749},
[51] = { 418, 749},
[52] = { 418, 749},
[53] = { 418, 749},
[54] = { 418, 749},
[55] = { 418, 749},
[56] = { 418, 749},
[57] = { 418, 749},
[58] = { 418, 749},
[59] = { 418, 749},
[60] = { 418, 749},
-- Neji --
[70] = { 419, 745},
[71] = { 419, 745},
[72] = { 419, 745},
[73] = { 419, 745},
[74] = { 419, 745},
[75] = { 419, 745},
[76] = { 419, 745},
[77] = { 419, 745},
[78] = { 419, 745},
-- Kiba --
[90] = { 420, 752},
[91] = { 420, 752},
[92] = { 420, 752},
[93] = { 420, 752},
[94] = { 420, 752},
[95] = { 420, 752},
[96] = { 420, 752},
[97] = { 420, 752},
[98] = { 420, 752},
-- Shikamaru --
[110] = { 421, 747},
[111] = { 421, 747},
[112] = { 421, 747},
[113] = { 421, 747},
[114] = { 421, 747},
[115] = { 421, 747},
[116] = { 421, 747},
-- Hinata --
[130] = { 422, 750},
[131] = { 422, 750},
[132] = { 422, 750},
[133] = { 422, 750},
[134] = { 422, 750},
[135] = { 422, 750},
-- Tenten --
[150] = { 423, 760},
[151] = { 423, 760},
[152] = { 423, 760},
[153] = { 423, 760},
[154] = { 423, 760},
-- Kakashi --
[200] = { 425, 741},
[201] = { 425, 741},
[202] = { 425, 741},
[203] = { 425, 741},
[204] = { 425, 741},
[205] = { 425, 741},
[206] = { 425, 741},
[207] = { 425, 741},
[208] = { 425, 741},
-- Tobi --
[213] = { 426, 746},
[214] = { 426, 746},
[215] = { 426, 746},
[216] = { 426, 746},
[217] = { 426, 746},
[263] = { 426, 746},
[264] = { 426, 746},
[265] = { 426, 746},
[266] = { 426, 746},
[367] = { 426, 746},
[369] = { 426, 746},
[370] = { 426, 746},
-- Minato --
[221] = { 427, 764},
[222] = { 427, 764},
[223] = { 427, 764},
[224] = { 427, 764},
[225] = { 427, 764},
[257] = { 427, 764},
[258] = { 427, 764},
[259] = { 427, 764},
[411] = { 427, 764},
[412] = { 427, 764},
-- Kisame --
[245] = { 428, 763},
[246] = { 428, 763},
[247] = { 428, 763},
[248] = { 428, 763},
[249] = { 428, 763},
[250] = { 428, 763},
[251] = { 428, 763},
[252] = { 428, 763},
[253] = { 428, 763},
-- Madara --
[281] = { 429, 754},
[282] = { 429, 754},
[283] = { 429, 754},
[284] = { 429, 754},
[285] = { 429, 754},
[286] = { 429, 754},
[287] = { 429, 754},
[288] = { 429, 754},
[371] = { 429, 754},
[375] = { 429, 754},
[435] = { 429, 754},
[403] = { 429, 754},
-- Temari --
[351] = { 430, 759},
[352] = { 430, 759},
[353] = { 430, 759},
[354] = { 430, 759},
[355] = { 430, 759},
[356] = { 430, 759},
-- Kankuro --
[361] = { 431, 751},
[362] = { 431, 751},
[363] = { 431, 751},
[364] = { 431, 751},
[365] = { 431, 751},
[366] = { 431, 751},
[367] = { 431, 751},
[368] = { 431, 751},
-- Killer Bee --
[190] = { 435, 753},
[191] = { 435, 753},
[192] = { 435, 753},
[193] = { 435, 753},
[194] = { 435, 753},
[195] = { 435, 753},
[196] = { 435, 753},
}
function creatureSayCallback(cid, type, msg)
if(not npcHandler:isFocused(cid)) then
 return false
end
 
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid
 
 
if msgcontains(msg, 'akatsuki') then
    if getPlayerVocation(cid) ~= config then
        if getPlayerStorageValue(cid, 8974555) == -1 then
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
 
if talkState[talkUser] == 2 and msgcontains(msg, 'coracao') then
    if getPlayerItemCount(cid, 4569) >= 6 then
    local voc = config[getPlayerVocation(cid)]
        doPlayerSetVocation(cid, voc[1])
    local outfit = {lookType = voc[2]}
        doCreatureChangeOutfit(cid, outfit)
        setCreatureMaxHealth(cid, getCreatureMaxHealth(cid)+bonushp)
        setCreatureMaxMana(cid, getCreatureMaxMana(cid)+bonusmp)
        doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
        doPlayerRemoveItem(cid, 4569, 6)
        doCreatureAddMana(cid, getCreatureMaxMana(cid))
        setPlayerStorageValue(cid,8974555,6)
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