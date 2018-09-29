function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then



		local t = {PLAYERLOSS_EXPERIENCE, PLAYERLOSS_SKILLS, PLAYERLOSS_MANA}
		for i = 1, #t do
			doPlayerSetLossPercent(cid, t[i], 20)
		end
	



    if getPlayerStorageValue(cid, HPFix) == -1 then
       setPlayerStorageValue(cid, HPFix, 1)
    end
  end
   return true
end
