
function onSay(cid, words, param)

local cost = 500000

for b = 1,5 do
    if getPlayerBlessing(cid, b) then
        doPlayerSendCancel(cid,'Voce ja Tem Bless e nao Precisa de Outra!')
                doSendMagicEffect(getPlayerPosition(cid), 17)
    else
        if doPlayerRemoveMoney(cid, cost) == TRUE then
                for i = 1,5 do
                        doPlayerAddBlessing(cid, i)
                end
                doSendMagicEffect(getPlayerPosition(cid), 37)
                doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'Voce Comprou Bless!')
        else
                doPlayerSendCancel(cid, "Voce Precisa de 50 Gold Bars para Comprar Bless!")
                doSendMagicEffect(getPlayerPosition(cid), 41)

        end
   end    
        return true
end
end