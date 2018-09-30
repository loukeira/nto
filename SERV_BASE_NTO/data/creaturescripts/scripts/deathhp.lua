function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then




local skill = 0

while skill < 7 do
	if getPlayerSkillLevel(cid,skill) > 10 then



		local value,z,value2= max(cid,skill)
		

		if (getPlayerSkillTries(cid,skill) > 0.75*value) then

		local matematica = getPlayerSkillTries(cid,skill) / 25
		local matematica2 = matematica - (0.5*z)
		doPlayerAddSkillTry(cid, skill, -matematica2)


		elseif (getPlayerSkillTries(cid, skill) <= 0.75*value) and (getPlayerSkillTries(cid,skill) > 0.5*value) then
		local matematica = getPlayerSkillTries(cid,skill) / 25
		local matematica2 = matematica - (0.25*z)
		doPlayerAddSkillTry(cid, skill, -matematica2)
	

		elseif (getPlayerSkillTries(cid, skill) <= 0.5*value) and (getPlayerSkillTries(cid,skill) > 0.25*value) then
		local matematica = getPlayerSkillTries(cid,skill) / 25
		local matematica2 = matematica - (0*z)
		doPlayerAddSkillTry(cid, skill, -matematica2)
		

		elseif (getPlayerSkillTries(cid, skill) <= 0.25*value) and (getPlayerSkillTries(cid,skill) > 0*value) then

		setPlayerSkillLevel(cid,skill,getPlayerSkillLevel(cid,skill)-1)
		local newvalue,z2 = max(cid,skill)


		--local matematica = getPlayerSkillTries(cid,skill) / 25
		--local matematica2 = matematica - (0*z2)
		local matematica3 = 0.75*z2
		doPlayerAddSkillTry(cid, skill, matematica3)
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
 valor2 = valor/(math.pow(2,x))
return valor,z,valor2
end