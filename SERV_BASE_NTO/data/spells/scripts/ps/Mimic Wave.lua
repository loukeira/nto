function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Mimic Wave")

return true
end