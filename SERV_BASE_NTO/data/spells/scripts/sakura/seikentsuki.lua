local quant_hit = 1 -- quantidade de hit's que ira dar no target 
local timeHit = 1 -- segundos de diferença para cada hit

local quant_sqm = 3 -- sqms que ira empurrar o target
local sqmTime = 0 -- segundos para empurrar após hitar, exemplo de meio segundo.

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, 1)
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_SKILL, 1, 0, 1, 0)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, -1) 
setConditionParam(condition, CONDITION_PARAM_SPEED, -5000)
setConditionFormula(condition, 0, 0, 0, 0)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
--target = getCreatureTarget(cid)
--if not target then doPlayerSendCancel(cid, "Voce tem que estar mirando em alguem!") return true end


local waittime = 4
local storage = 113053

if exhaustion.check(cid, storage) then
doCreatureSay(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.", TALKTYPE_MONSTER)
return true
end

exhaustion.set(cid, storage, waittime)
local target = getCreatureTarget(cid)
if target > 0 then
	local position_target = nil
	local cont = 0
	for i=-1, 1 do
		for j=-1,1 do
			position_target = {x=getCreaturePosition(target).x+i, y=getCreaturePosition(target).y+j, z=getCreaturePosition(target).z}
			if isWalkable(position_target) then
				cont = cont+1
				break
			end
		end
		if cont > 0 then
			break
		end
		position_target = nil
	end
	if getDistanceBetween(getCreaturePosition(cid), getCreaturePosition(target)) <= 1 then
		position_target = getCreaturePosition(cid)
	end
	if position_target ~= nil then
		doTeleportThing(cid, position_target)
		doSendMagicEffect(getCreaturePosition(cid), 3) -- efeito que solta no player ao usar a magia.
		local tempo = 0
		while (tempo ~= quant_hit*(timeHit*1000)) do
			addEvent(hitTarget, tempo, cid, target)
			tempo = tempo + (timeHit*1000)
		end
		local temp = tempo
		while (tempo ~= temp+quant_sqm*(sqmTime*1000)) do
			addEvent(empurrarTarget, tempo, cid, target, tempo)
			tempo = tempo + (sqmTime*1000)
		end
		doAddCondition(target, condition)
		return true
	else
		doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
	end
else
	doPlayerSendCancel(cid, "Você precisa de um target!")
end
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

function hitTarget(cid, target)
if isCreature(target) and isPlayer(cid) then
	local effect = 307 -- efeito do hit na creatura.
	doAddCondition(target, condition)
	doTargetCombatHealth(cid, target, COMBAT_PHYSICALDAMAGE, -getHit(cid), -getHit(cid), effect)
end
end

function getHit(cid)
local hit = getPlayerLevel(cid)*2 + getPlayerMagLevel(cid)*2 + math.random(650,750)
return hit
end

function empurrarTarget(cid, target, tempo)
if isCreature(target) and isPlayer(cid) then
	local positions = nil
	doAddCondition(target, condition)
	if getPlayerLookDir(cid) == 0 then
        positions = {x=getCreaturePosition(target).x, y=getCreaturePosition(target).y-1, z=getCreaturePosition(target).z}
    elseif getPlayerLookDir(cid) == 1 then
        positions = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}
    elseif getPlayerLookDir(cid) == 2 then
        positions = {x=getCreaturePosition(target).x, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z}
    elseif getPlayerLookDir(cid) == 3 then
       positions = {x=getCreaturePosition(target).x-1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}
    end
	if positions ~= nil and isWalkable(positions) then
		doTeleportThing(target, positions)
	end
	local tp = sqmTime*1000*(quant_sqm-1)+quant_hit*timeHit*1000
	if tempo == tp then
		doRemoveCondition(target, CONDITION_PARALYZE)
	end	
end
end