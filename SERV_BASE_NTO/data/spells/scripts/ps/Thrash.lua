function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Thrash")

return true
end