local distance = 10 -- distancia que anda (em sqm)
local speed = 100 -- milisegundos entre cada passo (qnt menor = mais rapido)
 
local invisible = createConditionObject(CONDITION_GAMEMASTER, (speed * distance) + 50, false, GAMEMASTER_INVISIBLE
local outfit = createConditionObject(CONDITION_INVISIBLE, (speed * distance) + 50, false)
 
local function isWalkable(pos, creature, proj, pz)-- by Nord
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then 
		return false 
	end
	
    if getTopCreature(pos).uid > 0 and creature then 
		return false 
	end
    if getTileInfo(pos).protection and pz then 
		return false, true 
	end
	
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
 
function onWalk(cid)
	local poslook = getCreatureLookPosition(cid)
	poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
	if isWalkable(poslook, false, false, false) then
		if not isCreature(getThingfromPos(poslook).uid) then
			doMoveCreature(cid, getPlayerLookDirection(cid))
			doSendMagicEffect(getPlayerPosition(cid), 2)
			return true
		else      
			doSendMagicEffect(getPlayerPosition(cid), 2)
			return true
		end
	else      
		doSendMagicEffect(getPlayerPosition(cid), 87)
	end
end
 
 
function onCastSpell(cid, var)
	if isPlayerPzLocked(cid) == FALSE then
		if exhaustion.check(cid, 13118) == TRUE then
			doPlayerSendCancel(cid, "Podera usar novamente dentro de 20 segundos.")
			doSendMagicEffect(getCreaturePosition(cid), 2)
			return false
		end
		
		addEvent(mc1,500,cid)
		exhaustion.set(cid, 13118, 20.0)
		doAddCondition(cid, invisible)
		doAddCondition(cid, outfit)
		
		for i = 0, distance do
			addEvent(onWalk, speed * i,cid)
		end
	end
	return true
end