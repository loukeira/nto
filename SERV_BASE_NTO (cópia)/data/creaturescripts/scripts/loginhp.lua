function onLogin(cid)
	local HPFix = 158920
    if getPlayerStorageValue(cid, HPFix) == 1 then
       doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
       doCreatureAddMana(cid, getCreatureMaxMana(cid))

       setPlayerStorageValue(cid, HPFix, -1)
    end
   return true
end