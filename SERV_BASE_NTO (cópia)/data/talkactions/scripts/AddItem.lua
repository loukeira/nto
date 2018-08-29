function onSay(cid, words, param, channel)

        local S = param:explode(",")

        if S[1] and tonumber(S[2]) and tonumber(S[3]) then
                if getPlayerByNameWildcard(S[1]) then
                        doPlayerAddItem(getPlayerByNameWildcard(S[1]), S[2], S[3])
                else
                        local ITEM = doCreateItemEx(S[2], S[3])
                        doPlayerSendMailByName(S[1], ITEM)
                end
        else
                doPlayerSendTextMessage(cid, 27, words .. "player, itemId, itemType(count).")
        end

        return true
end