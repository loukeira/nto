function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then

local skill = 0

while skill < 7 do
if getPlayerSkillLevel(cid,skill) > 10 then

getPlayerSkillTries(cid, skill

doPlayerSetSkillLevel(cid, skill, getPlayerSkillLevel(cid, skill)-1)
end
skill = skill + 1
end




    if getPlayerStorageValue(cid, HPFix) == -1 then
       setPlayerStorageValue(cid, HPFix, 1)
    end
  end
   return true
end

