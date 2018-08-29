local talk_state = 0

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)  npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)  npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()  npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)


        if msgcontains(msg, 'akatsuki ring') then
        if getPlayerItemCount(cid,2160) >= 1 then
        if doPlayerRemoveItem(cid,6512,1) then
        doPlayerAddItem(cid,1990,1)
        npcHandler:say('mensagem quando o item é trocado.')
                end
                else
        npcHandler:say('mensagem quando o player nao tem o item')
        talk_state = 0
                end
        elseif msgcontains(msg, 'bye') then
                npcHandler:say('Até mais, ' .. getCreatureName(cid) .. '! Volte em breve...')
                talk_state = 0
     end

        if msgcontains(msg, 'Nagato Ring') then
        if getPlayerItemCount(cid,2160) >= 1 then
        if doPlayerRemoveItem(cid,6512,1) then
        doPlayerAddItem(cid,1990,1)
        npcHandler:say('mensagem quando o item é trocado.')
                end
                else
        npcHandler:say('mensagem quando o player nao tem o item')
        talk_state = 0
                end
        elseif msgcontains(msg, 'bye') then
                npcHandler:say('Até mais, ' .. getCreatureName(cid) .. '! Volte em breve...')
                talk_state = 0
     end

return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())