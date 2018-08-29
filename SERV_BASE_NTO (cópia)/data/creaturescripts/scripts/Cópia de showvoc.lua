function onLook(cid, thing, position, lookDistance)
if isPlayer(thing.uid) then
local type = getPlayerStorageValue(thing.uid, 89745)
local jin = getPlayerStorageValue(thing.uid, 13255)
local akat = getPlayerStorageValue(thing.uid, 8974555)
doPlayerSetSpecialDescription(thing.uid, "\n"..(getPlayerSex(cid) == 0 and "She" or "He").." are "..(type < 0 and "Shinobi" or type == 1 and "Genin" or type == 2 and "Chunin" or type == 3 and "Jounin" or type == 4 and "Anbu" or type == 5 and "Sennin").."\n"..(getPlayerSex(cid) == 0 and "She" or "He").." "..(jin < 0 and "no have" or jin > 0 and "have").." power"..(jin < 0 and "" or jin == 1 and " of shukaku" or jin == 2 and " of nibi" or jin == 3 and " of sambi" or jin == 4 and " of yonbi" or jin == 5 and " of rokubi" or jin == 6 and " of gobi" or jin == 7 and " of shichibi" or jin == 8 and " of hachibi" or jin == 9 and " of kyuubi" or jin == 10 and " of Juubi") akat == Member Akatsuki and " of Akatsuki")
end
return true
end