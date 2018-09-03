

function onKill(cid, target)
	if(isMonster(target) == TRUE) then
	local name = getCreatureName(target)
	local monsterinfo = getMonsterInfo(name)
-- local xixi = getMonsterExperience(target)
	local mname = "Name: "..name.."\n"	
	local stamina = getPlayerStamina(cid)	
if (stamina >= 2400) then 
 ppau = 1.5
 else      
  ppau = 1
 end

-- PARTE DOS XP STAGES DEFINIDO PELO OTSERVER -- 


 local exprate = getExperienceStage(getPlayerLevel(cid))

	-- if getPlayerLevel(cid) <= 100 then exprate = 600 end
	-- if getPlayerLevel(cid) > 101 and getPlayerLevel(cid)<= 500 then exprate = 400 end
	-- if getPlayerLevel(cid) > 501 then exprate = 5 end
 --FIM --
contrib = 0
bonus_exp = 1
  if vip.hasVip(cid) == true then bonus_exp = 1.2 end
if (getPlayerStorageValue(cid, limitedeuso2) - os.time() > 0) and (getPlayerStorageValue(cid,io_expbonus2) == 1) then
 contrib = 0.5
end

if (getPlayerStorageValue(cid, limitedeuso) - os.time() > 0) and (getPlayerStorageValue(cid,io_expbonus) == 1) then
contrib = 1
end




	local boidacarapreta = tonumber(monsterinfo['experience'])*ppau*exprate*(bonus_exp+contrib)
	local experience = "Experience: "..monsterinfo['experience']*ppau*exprate*(bonus_exp+contrib).."\n"
		-- doBroadcastMessage(""..stamina.."")	
		-- doBroadcastMessage(mname)
				doPlayerSendTextMessage(cid, 27, ""..experience.."")
				-- doBroadcastMessage(boidacarapreta)
				db.query("UPDATE players SET xprank = "..boidacarapreta+xp_rank(cid).." WHERE id = "..getPlayerGUID(cid).." ;")
				doPlayerSendTextMessage(cid, 27, "xp rank atual e "..xp_rank(cid).." !") 	
		end
	return true
end

-- function xp_rank(cid) -- xprank 
-- local ult = db.getResult('select `xprank` from players where id = \''..getPlayerGUID(cid)..'\' ')

-- if (ult:getID() == -1) then
-- return false
-- end

-- local mamae = ult:getDataString("xprank")
-- ult:free()

-- caguei = tonumber(mamae)
-- return caguei

-- end