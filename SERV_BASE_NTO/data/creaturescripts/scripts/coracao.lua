local tps = {
                        ["Hidan"] = {pos = {x=1687, y=770, z=7}, toPos = {x=1708, y=772, z=7}, time = 50},
}
local function removeTp(tp)
local t = getTileItemById(tp.pos, 5023).uid
return t > 0 and doRemoveItem(t) and doSendMagicEffect(tp.pos, CONST_ME_POFF)
end
function onDeath(cid)
                        local tp = tps[getCreatureName(cid)]
                        if tp then
                        doCreateTeleport(5023, tp.toPos, tp.pos)
                        doCreatureSay(cid, "Hahaha, Voltarei!!..O teleport ir� sumir em "..tp.time.." segundos.", TALKTYPE_ORANGE_1)
                        addEvent(removeTp, tp.time*1000, tp)
                        end
                        return true
end