--<Script by Jhon992>--

local stonesId = {4025} -- ids dos diferente tipos de stones.
local timeRemove = 15 -- tempo para dumir as pedras em segundos.

function createObject(cid, position, stonesPosition)
if (isPlayer(cid)) then
        if getPlayerLookDir(cid) == 0 then
                positions = {x=position.x, y=position.y-1, z=position.z}
        elseif getPlayerLookDir(cid) == 1 then
                positions = {x=position.x+1, y=position.y, z=position.z}
        elseif getPlayerLookDir(cid) == 2 then
                positions = {x=position.x, y=position.y+1, z=position.z}
        elseif getPlayerLookDir(cid) == 3 then
                positions = {x=position.x-1, y=position.y, z=position.z}
        end
        
        if isWalkable(positions) then
                createStone(stonesPosition, positions, stonesId[math.random(1,#stonesId)], cid)
                addEvent(createObject, 500, cid, positions, stonesPosition)
        else
                addEvent(removeStones, timeRemove*1000, stonesPosition)
        end
end
end

function createStone(stonesPosition, positions, stone, cid)
        doCreateItem(stone, 1, positions)
        stonesPosition[(#stonesPosition)+1] = {x=positions.x, y=positions.y, z=positions.z, stackpos=1}
end

function removeStones(stonesPosition)
for i=1, #stonesPosition do
        for o=1, 2 do
                stonesPosition[i] = {x=stonesPosition[i].x, y=stonesPosition[i].y, z=stonesPosition[i].z, stackpos=o}
                if isInArray(stonesId, getThingfromPos(stonesPosition[i]).itemid) then
                        doRemoveItem(getThingfromPos(stonesPosition[i]).uid)
                end
        end
end
end

function isWalkable(pos, creature, pz, proj) -- nord
        if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
        local creature = getTopCreature(pos)
        if creature.type > 0 then       return false end
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

function onCastSpell(cid, var)
        local stonesPosition = {}
        local position = getPlayerPosition(cid)
        createObject(cid, position, stonesPosition)
    return true
end