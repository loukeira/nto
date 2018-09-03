function onStepIn(cid, item, pos)

local pos = {x=1724, y=1507, z=7} -- position em que sera adicionado a parede
local WallId = 6840 -- ID da parede
local storage = 35871 -- storage do piso que ira adicionar a parede (a mesma que sera colocado na TAG)

 if item.actionid == storage and isPlayer(cid) and getPlayerAccess(cid) < 3 then
if getTileItemById(pos, WallId).uid < 1 then
doCreateItem(WallId, 1, pos)
end
end
return TRUE
end