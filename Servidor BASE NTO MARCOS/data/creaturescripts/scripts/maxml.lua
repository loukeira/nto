function onAdvance(cid, skill, oldlevel, newlevel)
local maxml = 10
if skill == 5 then
if newlevel >= maxml then
doPlayerSetMagicRate(cid, 0)
setPlayerStorageValue(cid, 20130314, maxml)
end
end
return true
end