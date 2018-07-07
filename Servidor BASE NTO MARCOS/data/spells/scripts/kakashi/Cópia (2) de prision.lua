local remove_time = 5 -- tempo em segundos para remover as magic wall
local item_id = 5750 -- id da magic wall

function onCastSpell(cid, var)

local pos = getThingPosition(getCreatureTarget(cid))
posTile1 = {x=pos.x+1,y=pos.y,z=pos.z,stackpos=1}
posTile2 = {x=pos.x+2,y=pos.y,z=pos.z,stackpos=1}
posTile3 = {x=pos.x+3,y=pos.y,z=pos.z,stackpos=1}
posTile4 = {x=pos.x+4,y=pos.y,z=pos.z,stackpos=1}
posTile5 = {x=pos.x+5,y=pos.y,z=pos.z,stackpos=1}
posTile6 = {x=pos.x+6,y=pos.y,z=pos.z,stackpos=1}
posTile7 = {x=pos.x+7,y=pos.y,z=pos.z,stackpos=1}
posTile8 = {x=pos.x+8,y=pos.y,z=pos.z,stackpos=1}
posTile9 = {x=pos.x+9,y=pos.y,z=pos.z,stackpos=1}
posTile10 = {x=pos.x+10,y=pos.y,z=pos.z,stackpos=1}
posTile11 = {x=pos.x+11,y=pos.y,z=pos.z,stackpos=1}
posTile12 = {x=pos.x+12,y=pos.y,z=pos.z,stackpos=1}
posTile13 = {x=pos.x+13,y=pos.y,z=pos.z,stackpos=1}
posTile14 = {x=pos.x+14,y=pos.y,z=pos.z,stackpos=1}
posTile15 = {x=pos.x+15,y=pos.y,z=pos.z,stackpos=1}
posAll = {posTile1,posTile2,posTile3,posTile4,posTile5,posTile6,posTile7,posTile8,posTile9,posTile10,posTile11,posTile12,posTile13,posTile14,posTile15}

for i=1, #posAll do
	if isWalkable(posAll[i]) then
		doCreateItem(item_id, 1, posAll[i])
	end
end 
addEvent(removeItem, remove_time*1000, posAll)

return true
end

function isWalkable(pos, creature, pz, proj)
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
	local creature = getTopCreature(pos)
    if creature.type > 0 then	return false end
	if getTilePzInfo(pos) and not pz then return false end
	local n = not proj and 3 or 2
	for i = 0, 255 do
        pos.stackpos = i
        local tile = getTileThingByPos(pos)
        if tile.itemid ~= 0 and not isCreature(tile.uid) then
            if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                return false
            end
        end
	end
return true
end

function removeItem(posAll)
	for i=1, #posAll do
		for j=0, 255 do
			pos_stack = {x=posAll[i].x,y=posAll[i].y,z=posAll[i].z,stackpos=j}
			removeTile = getThingfromPos(pos_stack)
			if removeTile.itemid == item_id then
				doRemoveItem(removeTile.uid)
			end
		end
	end
end