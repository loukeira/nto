function onSay(cid, words, param, channel)
local thisball = getPlayerSlotItem(cid, 8)
local mysum = getCreatureSummons(cid)[1]
if getItemAttribute(thisball.uid, "ehditto") then
	doItemSetAttribute(thisball.uid, "poke",  "Ditto")
	doUpdateMoves(cid)
	doItemSetAttribute(thisball.uid, "ehditto",  1)
end
end