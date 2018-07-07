function onStepIn(cid, item, position, fromPosition)
local config =
{
lvl = 400, --- Level
novolocal = {x=1551, y=1603, z=7},
msg = "Você ainda não tem level suficiente.",
uniqueid = 3000-3008
}
if (item.uid == config.uniqueid) and (getPlayerLevel(cid) >= config.lvl) then
doTeleportThing(cid,config.novolocal)
doSendMagicEffect(config.novolocal,10)
else
doPlayerSendCancel(cid, config.msg)
doTeleportThing(cid,FromPosition)
end

local tiles = { -- Action id / Storage, Valor
[6320] = {itemid = 3255, valor = 1},
[6321] = {storage = 3256, valor = 2},
[6322] = {storage = 3257, valor = 3},
[6323] = {storage = 3258, valor = 4},
[6324] = {storage = 3259, valor = 5},
[6325] = {storage = 3260, valor = 6},
[6326] = {storage = 3261, valor = 7},
[6327] = {storage = 3262, valor = 8},
[6328] = {storage = 3266, valor = 9},
}
local t = tiles[item.actionid]

if getPlayerItemCount(cid, t.itemid) < t.valor then
doTeleportThing(cid, fromPosition)
doPlayerSendCancel(cid, "Descupe Voce Nao é Jinchuriki.") return true
end
return true
end