function onStepIn(cid, item, position, fromPosition)
local tiles = {
[18001] = {x=1448, y=1331, z=7}
[18002] = {x=1329, y=1573, z=5}
[18003] = {x=1335, y=1573, z=4}
[18004] = {x=1330, y=1574, z=3}
[18005] = {x=1333, y=1574, z=2}
[18006] = {x=1330, y=1576, z=7}
[18007] = {x=1332, y=1576, z=7}
}
return doTeleportThing(cid, tiles[item.actionid])
end