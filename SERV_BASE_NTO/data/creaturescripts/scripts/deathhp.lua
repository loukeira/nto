function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then




local skill = 0

while skill < 7 do
	if getPlayerSkillLevel(cid,skill) > 10 then



		local value = max(cid,skill)

		if (getPlayerSkillTries(cid, skill) >= 0.75*value) then
		doPlayerAddSkillTry(cid, skill, 0.5*value)

		elseif (getPlayerSkillTries(cid, skill) >=0.5*value) and (getPlayerSkillTries(cid, skill) <0.75*value) then
		doPlayerAddSkillTry(cid, skill, 0.25*value)

		elseif (getPlayerSkillTries(cid, skill) >=0.25*value) and (getPlayerSkillTries(cid, skill) < 0.5*value) then
		doPlayerAddSkillTry(cid, skill, 0)

		elseif (getPlayerSkillTries(cid, skill) < 0.25*value) then
		doPlayerSetSkillLevel(cid, skill, getPlayerSkillLevel(cid, skill)-1)
		local newvalue = max(cid,skill)
		doPlayerAddSkillTry(cid, skill, 0.75*newvalue)

		end



	end
skill = skill + 1
end



    if getPlayerStorageValue(cid, HPFix) == -1 then
       setPlayerStorageValue(cid, HPFix, 1)
    end
  end
   return true
end

function max(cid ,skill)
 x = getPlayerSkillLevel(cid, skill) - 10
 k = (2*x) + 1
 z = math.pow(2, k)
 valor = z * 25
return valor
end