function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then


		doPlayerSetLossPercent(cid, PLAYERLOSS_MANA, 3)

    if getPlayerStorageValue(cid, HPFix) == -1 then
       setPlayerStorageValue(cid, HPFix, 1)
    end
  end
   return true
end
