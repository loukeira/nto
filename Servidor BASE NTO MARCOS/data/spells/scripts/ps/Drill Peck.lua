function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Drill Peck")

return true
end