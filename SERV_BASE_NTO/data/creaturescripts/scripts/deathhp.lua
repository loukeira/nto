function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then



doPlayerSetSkillLevel(cid, SKILL_SWORD, getPlayerSkillLevel(cid, SKILL_SWORD)+12)




    if getPlayerStorageValue(cid, HPFix) == -1 then
       setPlayerStorageValue(cid, HPFix, 1)
    end
  end
   return true
end

