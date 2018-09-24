 function onDeath(cid, corpse, deathList)


local level = 100

 if (getPlayerLevel(cid) < level ) then
 	doCreatureSetDropLoot(cid, false)

end
return true
end