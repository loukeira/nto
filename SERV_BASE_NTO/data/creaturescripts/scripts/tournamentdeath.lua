local cfg = {
leftPos = {x = 1286, y = 1548, z = 7},
rightPos = {x = 1378, y = 1607, z = 7},
}

function onPrepareDeath(cid, lastHitKiller, mostDamageKiller)
if isInRange(getCreaturePosition(pid), cfg.leftPos, cfg.rightPos) then
doTeleportThing(cid, getTownTemplePosition(getPlayerTown(cid)))
doCreatureAddHealth(cid, getCreatureMaxHealth(cid), 65535, 256, true)
doCreatureAddMana(cid, getCreatureMaxMana(cid))
doRemoveConditions(cid, false)
return false
end
return true
end