function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "Venom Motion")

return true
end