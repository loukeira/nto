function onStepIn(cid, item, pos)

local pos = {x=1720, y=1507, z=7} -- ID da porta que sera removido e colocado denovo
local WallId = 6840 -- ID da parede
local storage2 = 35869 -- storage do piso que ira adicionar a parede (a mesma que sera colocado na TAG)

if item.actionid == storage then
doCreateItem(WallId, 1, pos)
end
return TRUE
end