local tempo = 5 -- tempo do paralyze em segundos
local effect = 123 -- efeito que vai sair ao redor do player
local exausted = 8 -- exhausted em segundos
local storage = 13098 -- storage do exausted

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -5000)

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)

local function Efect()
if not isCreature(target) then return true end
local positions = {
[1] = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z},
[2] = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z},
[3] = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y-1, z=getCreaturePosition(target).z},
[4] = {x=getCreaturePosition(target).x-1, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z},
[5] = {x=getCreaturePosition(target).x-1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z},
[6] = {x=getCreaturePosition(target).x-1, y=getCreaturePosition(target).y-1, z=getCreaturePosition(target).z},
[7] = {x=getCreaturePosition(target).x, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z},
[8] = {x=getCreaturePosition(target).x, y=getCreaturePosition(target).y-1, z=getCreaturePosition(target).z}
}
for i=1, #positions do
if isWalkable(positions[i]) then
doSendMagicEffect(positions[i], effect)
end
end
end

local function No_Move_Target()
if isCreature(target) then
doCreatureSetNoMove(target, 0)
end
return TRUE
end

if isPlayer(cid) and exhaustion.check(cid, storage) == TRUE then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar novamente.")
return false
end

exhaustion.set(cid, storage, exausted)
doCreatureSetNoMove(target, 1)
doAddCondition(target, condition)
addEvent(No_Move_Target, tempo*1000)
local t = 0
while t <= tempo*1000 do
addEvent(Efect, t)
t = t+300
end
return true
end