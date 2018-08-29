function onCastSpell(cid, var)

	if isSummon(cid) then return true end

	docastspell(cid, "DynamicKick")

return true
end