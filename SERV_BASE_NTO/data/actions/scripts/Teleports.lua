-- [( Script created by Doidin for XTibia.com )] --
function onUse(cid, item, fromPosition, item2, toPosition)

local teleport = {x=1553, y=1601, z=7} -- Coordenadas para onde o player irá ser teleportado.
local item_id = 3255,3256,3257,3258,3259,3260,3261,3262,3266 -- ID do item que o player precisa para ser teleportado.


if getPlayerItemCount(cid,item_id) >= 9 then
        doTeleportThing(cid, teleport)
        doSendMagicEffect(getPlayerPosition(cid), 10)
        doPlayerSendTextMessage(cid, 22, "Go Quest Jinchuriki > "..getItemNameById(item_id).." < Mate Os Monsters e Os Otros Jinchuriki")
        else
        doPlayerSendTextMessage(cid, 23, "Sorry, you need a "..getItemNameById(item_id).." to enter.")
        end
end