local texto = [[Pegue Points Events e Troque Por Items e Vocations
]]

function onLogin(cid)
if getPlayerStorageValue(cid, 12233) == -1 and getPlayerVocation(cid) > 0 then
doShowTextDialog(cid, 2175, texto)
setPlayerStorageValue(cid, 12233, 1)
end
return TRUE
end