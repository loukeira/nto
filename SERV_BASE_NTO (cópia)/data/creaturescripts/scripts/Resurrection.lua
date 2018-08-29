local item_id = 5091
local count = 1
local temple = {x=1026, y=910, z=7}

function onDeath(cid, corpse, deathList)

        if isPlayer(cid) then
                if getPlayerItemCount(cid,item_id) >= 1 then
                        if doPlayerRemoveItem(cid,item_id,count) then
                                doSendMagicEffect(getPlayerPosition(cid), 10)
                                doPlayerSendTextMessage(cid, 23, "Reborn from the ashes.")
                        end
                else
                        doPlayerSetMasterPos(cid, temple)
         doTeleportThing(cid,c)
                        doSendMagicEffect(getPlayerPosition(cid), 10)
                end
        end
end