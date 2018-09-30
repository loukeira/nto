function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then




local skill = 0

while skill < 7 do
	if getPlayerSkillLevel(cid,skill) > 10 then



		local value,hits,value2,hits2= max(cid,skill)

		-- sword2, club1 e distance4, fist0, shield5, fishing 6
		if (skill == 2 or skill == 0 or skill == 5 or skill == 6) and (getPlayerVocation(cid) == (1 or 2 or 12 )) then
		value = value2
		hits = hits2
		elseif (skill == 1 or skill == 0 or skill == 5 or skill == 6) and (getPlayerVocation(cid) == (3 or 5 or 6 or 7 or 11 or 13 or 14 or 15) ) then
		value = value2
		hits = hits2
		elseif (skill == 4 or skill == 0 or skill == 5 or skill == 6) and (getPlayerVocation(cid) == (4 or 8 or 9 or 10 ) ) then
		value = value2
		hits = hits2
		end

		if (getPlayerSkillTries(cid,skill) > 0.75*value) then

		local matematica = getPlayerSkillTries(cid,skill) / 25
		local matematica2 = matematica - (0.5*hits)
		doPlayerAddSkillTry(cid, skill, -matematica2)


		elseif (getPlayerSkillTries(cid, skill) <= 0.75*value) and (getPlayerSkillTries(cid,skill) > 0.5*value) then
		local matematica = getPlayerSkillTries(cid,skill) / 25
		local matematica2 = matematica - (0.25*hits)
		doPlayerAddSkillTry(cid, skill, -matematica2)
	

		elseif (getPlayerSkillTries(cid, skill) <= 0.5*value) and (getPlayerSkillTries(cid,skill) > 0.25*value) then
		local matematica = getPlayerSkillTries(cid,skill) / 25
		local matematica2 = matematica - (0*hits)
		doPlayerAddSkillTry(cid, skill, -matematica2)
		

		elseif (getPlayerSkillTries(cid, skill) <= 0.25*value) and (getPlayerSkillTries(cid,skill) >= 0*value) then

		doPlayerSetSkillLevel(cid,skill,getPlayerSkillLevel(cid,skill)-1)
		local newvalue,hits4 = max(cid,skill)

		if (skill == 2 or skill == 0 or skill == 5 or skill == 6) and (getPlayerVocation(cid) == (1 or 2 or 12 )) then
		value = value2
		hits4 = hits2
		elseif (skill == 1 or skill == 0 or skill == 5 or skill == 6) and (getPlayerVocation(cid) == (3 or 5 or 6 or 7 or 11 or 13 or 14 or 15) ) then
		value = value2
		hits4 = hits2
		elseif (skill == 4 or skill == 0 or skill == 5 or skill == 6) and (getPlayerVocation(cid) == (4 or 8 or 9 or 10 ) ) then
		value = value2
		hits4 = hits2
		end

		--local matematica = getPlayerSkillTries(cid,skill) / 25
		--local matematica2 = matematica - (0*hits2)
		local matematica3 = 0.75*hits4
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
 hits = math.pow(2, k)
 valornormal = hits * 25
 valornormal2 = valornormal/(math.pow(2,x))
 hits2 = valornormal2/25
return valornormal,hits,valornormal2,hits2
end