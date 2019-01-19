local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local moneyTo = {}
local playerTo = {}

function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)        end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)        end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)    end
function onThink()                npcHandler:onThink()                end

local function isValidMoney(money)
    if isNumber(money) == TRUE and money > 0 and money < 999999999 then
        return TRUE
    end
    return FALSE
end

function creatureSayCallback(cid, type, msg)
     token = 7443

    if(not npcHandler:isFocused(cid)) then
        return false
    end

    if msgcontains(msg, 'help') or msgcontains(msg, 'offer') then
        selfSay("You can check the {balance} of your token bank account, {deposit} token or {withdraw} it. You can also {transfer} money to other characters, provided that they have a vocation.", cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Balance ----------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'balance') or msgcontains(msg, 'Balance') then
        selfSay('Your account balance is '..get_tokens(cid)..' Tokens.', cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Help -------------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'basic functions') then
        selfSay('You can check the {balance{ of your bank account, Pdeposit{ money or Pwithdraw{ it. You can also {transfer} money to othercharacters, provided that they have a vocation.', cid)
        talkState[cid] = 0
    elseif msgcontains(msg, 'advanced functions') then
        selfSay('Renting a house has never been this easy. Simply make a bid for an auction. We will check immediately if you haveenough money.', cid)
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Deposit ----------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'deposit all') then
        local itemcount = getPlayerItemCount(cid, token) 

        if itemcount < 1 then
            selfSay('You don\'t have tokens to deposit in you inventory..', cid)
            talkState[cid] = 0
        else
            selfSay('Would you really like to deposit '..itemcount..' token?', cid)
            talkState[cid] = 2
            quant = tonumber(itemcount)
        end

    elseif msgcontains(msg, 'deposit') then
        selfSay("Please tell me how much token it is you would like to deposit.", cid)
        talkState[cid] = 1
    elseif talkState[cid] == 1 then
        quant = tonumber(msg)
        if quant then
            selfSay("Would you really like to deposit "..quant.." token?", cid)
            talkState[cid] = 2
        else
            selfSay('Is isnt valid amount of token to deposit.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 2 then
        if msgcontains(msg, 'yes') then
            if getPlayerItemCount(cid, token)  < quant then
                selfSay('You do not have enough token.', cid)
            else
               doPlayerRemoveItem(cid, token, quant)

               db.query("UPDATE `players` SET `tokens` = `tokens`+"..quant.." WHERE id = "..getPlayerGUID(cid).." ;")
               selfSay("Alright, we have added the amount of "..quant.." tokens to your balance.Your account balance is "..get_tokens(cid)..".", cid)
               --db.query("UPDATE `players` SET `tokens` = "..get_tokens(cid)+quant.." WHERE id = "..getPlayerGUID(cid).." ;")
               --selfSay("Alright, we have added the amount of "..quant.." tokens to your balance.Your account balance is "..get_tokens(cid)..".", cid)

            end
        elseif msgcontains(msg, 'no') then
            selfSay('ok, bye', cid)
        end
        talkState[cid] = 0
-----------------------------------------------------------------
---------------------------- Withdraw ---------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'withdraw') then
        selfSay("Please tell me how much token you would like to withdraw.", cid)
        talkState[cid] = 6
    elseif talkState[cid] == 6 then
        withdraw = tonumber(msg)
        if withdraw then
            selfSay('Are you sure you wish to withdraw '..withdraw..' token from your token bank account?', cid)
            talkState[cid] = 7
        else
            selfSay('Is isnt valid amount of token to withdraw.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 7 then
        if msgcontains(msg, 'yes') then

            if get_tokens(cid) <  withdraw then
                selfSay('There is not enough token on your bank account. Your token balance is '..get_tokens(cid)..'. Please tell me the amount of tokens coins you would like to withdraw.', cid)
            else
                doPlayerAddItem(cid, token, withdraw)
  db.query("UPDATE `players` SET `tokens` = `tokens`-"..withdraw.." WHERE id = "..getPlayerGUID(cid).." ;")
                selfSay('Here you are, ' ..withdraw.. ' tokens. Your token balance is '..get_tokens(cid)..'. Please let me know if there is something else I can do for you.', cid)


                --db.query("UPDATE `players` SET `tokens` = "..get_tokens(cid)-withdraw.." WHERE id = "..getPlayerGUID(cid).." ;")
                --selfSay('Here you are, ' ..withdraw.. ' tokens. Your token balance is '..get_tokens(cid)..'. Please let me know if there is something else I can do for you.', cid)
                talkState[cid] = 0
            end


        elseif msgcontains(msg, 'no') then
            selfSay('As you wish. Is there something else I can do for you?', cid)
            talkState[cid] = 0
        end
-----------------------------------------------------------------
---------------------------- Transfer ---------------------------
-----------------------------------------------------------------
    elseif msgcontains(msg, 'transfer') then
        selfSay("Please tell me the amount of token you would like to transfer.", cid)
        talkState[cid] = 11
    elseif talkState[cid] == 11 then
        transfer = tonumber(msg)
        if transfer then
            selfSay('Who would you like transfer '..transfer..' tokens to?', cid)
            talkState[cid] = 12
        else
            selfSay('Is isnt valid amount of token to transfer.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 12 then
        playyer = msg

        if getCreatureName(cid) == playyer then
            selfSay('Ehm, You want transfer money to yourself? Its impossible!', cid)
            talkState[cid] = 0
            return true
        end

        if player_existe(playyer) then
        --if playerExists(playyer) then
            selfSay('So you would like to transfer ' ..transfer.. ' token to "' ..playyer.. '" ?', cid)
            talkState[cid] = 13
        else
            selfSay('Player with name "' ..playyer.. '" doesnt exist.', cid)
            talkState[cid] = 0
        end
    elseif talkState[cid] == 13 then
        if msgcontains(msg, 'yes') then
            if get_tokens(cid) < transfer then
                selfSay('You dont have enought tokens on your token bank account.', cid)
                return true
            end

            if (player_existe(playyer) == false) then
                selfSay('This player does not exist on this world or have no vocation.', cid)
            else
                db.query("UPDATE `players` SET `tokens` = `tokens`-"..transfer.." WHERE id = "..getPlayerGUID(cid).." ;")
                --db.query("UPDATE `players` SET `tokens` = "..get_tokens(cid)-transfer.." WHERE id = "..getPlayerGUID(cid).." ;")
                --db.query("UPDATE `players` SET `tokens` = "..get_tokens(getCreatureByName(playyer))+transfer.." WHERE id = "..getPlayerGUID(getCreatureByName(playyer)).." ;") 
       
                  db.query("UPDATE `players` SET `tokens` = `tokens`+"..transfer.." WHERE id = "..select_id(playyer).." ;") 

                selfSay('You have transferred ' ..transfer.. ' Token(s) to "' ..playyer..' ".', cid)
                playerTo[cid] = nil
            end
        elseif msgcontains(msg, 'no') then
            selfSay('As you wish. Is there something else I can do for you?', cid)
        end
        talkState[cid] = 0
    end
    return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  

function select_id(cidadao)  
local player = db.getResult("SELECT `name`,`id` FROM `players` where account_id = "..getAccountIdByName(tostring(cidadao))..";")    
            if(player:getID() ~= -1) then
                while (true) do
                  repeat

                    local name = player:getDataString("name")
                    local id = player:getDataString("id")
                        

                        if string.lower(name) ~= string.lower(cidadao) then
                            break
                        end 
                        resposta = id
                       

                    until true

                    if not(player:next()) then
                        break
                    end
                end
                player:free()
            end

return tonumber(resposta)
end


 



function get_tokens(cid) -- xprank 
local ult = db.getResult('select `tokens` from players where id = \''..getPlayerGUID(cid)..'\' ')

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataString("tokens")
ult:free()

caguei = tonumber(mamae)
return caguei

end


function get_transfer(coco) -- xprank 
local ult = db.getResult("select `tokens` from players where account_id = "..getAccountIdByName(tostring(coco)).." ")

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataString("tokens")
ult:free()

caguei = tonumber(mamae)
return caguei

end

function player_existe(name)  
local ult = db.getResult("select `name` from players where account_id = "..getAccountIdByName(tostring(name)).." ")

if (ult:getID() == -1) then
return false
end

local mamae = ult:getDataString("name")
ult:free()

if mamae == nil then 
    resposta = false
else
    resposta = true
end

return resposta

end

