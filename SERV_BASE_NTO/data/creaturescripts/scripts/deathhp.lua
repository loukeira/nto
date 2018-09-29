function onDeath(cid,attacker)
	local HPFix = 158920
  if isPlayer(cid) then



		local t = {PLAYERLOSS_EXPERIENCE, PLAYERLOSS_SKILLS, PLAYERLOSS_MANA}
		for i = 1, #t do
			doPlayerSetLossPercent(cid, t[i], 20)
		end

		player_skills

		
		local matematica = getskillcount(cid) - 1


		db.query("UPDATE player_skills SET count = "..matematica.." WHERE player_id = "..getPlayerGUID(cid).." ;")

	



    if getPlayerStorageValue(cid, HPFix) == -1 then
       setPlayerStorageValue(cid, HPFix, 1)
    end
  end
   return true
end

function getskillcount(cid) -- xprank 
    local ult = db.getResult('select `count` from player_skills where id = \''..getPlayerGUID(cid)..'\' ')

    if (ult:getID() == -1) then
    return false
    end

    local mamae = ult:getDataString("count")
    ult:free()

    caguei = tonumber(mamae)
    return caguei

end