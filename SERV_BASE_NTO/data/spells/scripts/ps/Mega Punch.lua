function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Mega Punch")

return true
end