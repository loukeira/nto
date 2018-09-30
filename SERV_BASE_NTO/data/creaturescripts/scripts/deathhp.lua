function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then



if getPlayerSkillLevel(cid,SKILL_SWORD) > 10 then
doPlayerSetSkillLevel(cid, SKILL_SWORD, getPlayerSkillLevel(cid, SKILL_SWORD)-1)
end



    if getPlayerStorageValue(cid, HPFix) == -1 then
       setPlayerStorageValue(cid, HPFix, 1)
    end
  end
   return true
end

