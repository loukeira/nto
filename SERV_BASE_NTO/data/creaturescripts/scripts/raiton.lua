local tps = {
["the raiton boss"] = {pos = {x=804, y=1010, z=2}, toPos = {x=804, y=1010, z=1}, time = 50},
}

local function removeTp(tp)
local t = getTileItemById(tp.pos, 5023).uid
return t > 0 and doRemoveItem(t) and doSendMagicEffect(tp.pos, CONST_ME_POFF)
end

function onDeath(cid)
local tp = tps[getCreatureName(cid)]
if tp then
doCreateTeleport(5023, tp.toPos, tp.pos)
doCreatureSay(cid, "Parabens, podes proseeguir, O teleport ir� sumir em "..tp.time.." segundos.", TALKTYPE_ORANGE_1)
addEvent(removeTp, tp.time*1000, tp)
end
return true
end