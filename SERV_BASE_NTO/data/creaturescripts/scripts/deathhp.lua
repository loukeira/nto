function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then




local skill = 0

while skill < 7 do
	if getPlayerSkillLevel(cid,skill) > 10 then



		local value = max(cid,skill)


		-- if (getPlayerSkillTries(cid, skill) >= 0.75*value) then
		-- doPlayerSetSkillTries(cid, skill, 0.5*value,50)
		-- doPlayerSendTextMessage(cid,18,"vc ficou com 50")

		-- elseif (getPlayerSkillTries(cid, skill) >=0.5*value) and (getPlayerSkillTries(cid, skill) <0.75*value) then
		-- doPlayerSetSkillTries(cid, skill, 0.25*value,25)

		-- doPlayerSendTextMessage(cid,18,"vc ficou com 25")

		-- elseif (getPlayerSkillTries(cid, skill) >=0.25*value) and (getPlayerSkillTries(cid, skill) < 0.5*value) then
		-- doPlayerSetSkillTries(cid, skill, 0,0)
		-- doPlayerSendTextMessage(cid,18,"vc ficou com zero")

		-- elseif (getPlayerSkillTries(cid, skill) < 0.25*value) then
		-- doPlayerSendTextMessage(cid,18,"vc perdeu lvl")
		-- doPlayerSendTextMessage(cid,18, "valor maximo: "..getPlayerSkillTries(cid,skill).." / "..max(cid,skill).." ")
		-- local newvalue = max(cid,skill)
		-- doPlayerSetSkillTries(cid, skill, 0.75*newvalue)

		-- end


		--doPlayerSendTextMessage(cid,18,"vc perdeu lvl")
		doPlayerSendTextMessage(cid,18, "antes: "..getPlayerSkillTries(cid,skill).." / "..max(cid,skill).." ")
		local newvalue = max(cid,skill)
		doPlayerSetSkillTries(cid, skill, 50 ,20)
		doPlayerSendTextMessage(cid,18, "depois: "..getPlayerSkillTries(cid,skill).." / "..max(cid,skill).." ")



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