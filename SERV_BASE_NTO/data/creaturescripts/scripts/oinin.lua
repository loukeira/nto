function onKill(cid, target)

local award = {
[100] = 10000, 
[200] = 50000, 
[300] = 100000, 
[400] = 200000, 
[4] = 300000, 
[5] = 400000, 
[6] = 500000, 
[7] = 700000,
[8] = 800000, 
[9] = 1000000 
} 

if getPlayerStorageValue(target, 13131) > -1 then
doPlayerAddMoney(cid, award[getPlayerStorageValue(target, 13131)])
setPlayerStorageValue(target, 13131, -1)

end
return TRUE
end