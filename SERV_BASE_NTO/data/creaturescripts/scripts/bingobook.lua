function onKill(cid, target)

local award = {
[0] = 2272, -- crystal coin
[1] = 2431, -- crusader helmet
[2] = 7402, -- crown armor
[3] = 2431, -- boots of haste
[4] = 7408, -- demon shield
[5] = 7380, -- golden legs
[6] = 7869, -- golden armor
[7] = 2429, -- dragon scale helmet
[8] = 2139, -- dragon scale mail
[9] = 2446, -- mastermind shield
}

if getPlayerStorageValue(target, 13131) > -1 then
doPlayerAddItem(cid, award[getPlayerStorageValue(target, 13131)])
setPlayerStorageValue(target, 13131, -1)

end
return TRUE
end