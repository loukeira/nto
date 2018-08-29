function onThink(cid, interval)
if isPlayer(cid) and #getCreatureSummons(cid) >= 1 then
 if getCreatureHealth(getCreatureSummons(cid)[1]) == getCreatureMaxHealth(getCreatureSummons(cid)[1]) then
 regenerando = 0
 end
if not getCreatureCondition(cid, CONDITION_INFIGHT) then
if getCreatureHealth(getCreatureSummons(cid)[1]) < getCreatureMaxHealth(getCreatureSummons(cid)[1]) then
if (getPlayerStorageValue(cid, 637501) <= 0) and getItemAttribute(getPlayerSlotItem(cid, 8).uid, "regenheld") == 1 then
if regenerando == 0 then
doRegenerateWithHeld(cid, getCreatureSummons(cid)[1])
end
end
end
end
end
end