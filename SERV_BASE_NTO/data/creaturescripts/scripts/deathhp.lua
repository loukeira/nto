function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then


local i = 0
while i < 7 then
if getPlayerSkillLevel(cid,i) > 10 then
doPlayerSetSkillLevel(cid, i, getPlayerSkillLevel(cid, i)-1)
end
i = i + 1
end


    if getPlayerStorageValue(cid, HPFix) == -1 then
       setPlayerStorageValue(cid, HPFix, 1)
    end
  end
   return true
end

