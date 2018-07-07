function onDeath(cid,attacker)
	local HPFix = 158920
  if isCreature(attacker) or isPlayer(attacker) then
    if getPlayerStorageValue(cid, HPFix) == -1 then
       setPlayerStorageValue(cid, HPFix, 1)
    end
  end
   return true
end
