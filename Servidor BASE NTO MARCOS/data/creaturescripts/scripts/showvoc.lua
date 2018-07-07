function onLook(cid, thing, position, lookDistance)
if isPlayer(thing.uid) then
local type = getPlayerStorageValue(thing.uid, 89745)
doPlayerSetSpecialDescription(thing.uid, "\n "..(getPlayerSex(cid) == 0 and "She" or "He").." are "..(type < 0 and "Shinobi" or type == 1 and "Genin" or type == 2 and "Chunin" or type == 3 and "Jounin" or type == 4 and "Anbu" or type == 5 and "Captain Anbu"))
end
return true
end