-- dash as it was in avaOT by Night Wolf 

local damage = 1000 -- dano que toma qnd bate em algum obstáculo
local speed = 1000 -- velocidade do player ao usar o dash (vai de 0 a mil)
local pzprotect = true -- nao deixa entrar em pz com a spell
local distance = 8 -- quantos sqms anda

local function isWalkable(pos, creature, proj, pz)-- by Nord
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
    if getTopCreature(pos).uid > 0 and creature then return false end
    if getTileInfo(pos).protection and pz then return false, true end
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
	if isCreature(cid) then 
		local poslook = getCreatureLookPosition(cid)
		poslook.stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE
		if isWalkable(poslook, false, false, pzprotect) then
			if not isCreature(getThingfromPos(poslook).uid) then
				doMoveCreature(cid, getPlayerLookDirection(cid))
				doSendMagicEffect(getPlayerPosition(cid), 1)
			else
				doCreatureAddHealth(cid, -damage)
				doSendMagicEffect(getPlayerPosition(cid), 87)
				doSendAnimatedText(getPlayerPosition(cid), "-"..damage , 180) 
			end
		else      
			doCreatureAddHealth(cid, -damage)
			doSendMagicEffect(getPlayerPosition(cid), 87)
			doSendAnimatedText(getPlayerPosition(cid), "-"..damage , 180) 
		end
	end
return true
end

function onCastSpell(cid, var)	
	for i = 0, distance do
		addEvent(onWalk, (1001- math.min(speed, 1000)) *i, cid)
	end
return true
end  