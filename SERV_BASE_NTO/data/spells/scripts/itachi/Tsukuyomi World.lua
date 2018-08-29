local time = 15 -- tempo em segundos para voltar
local points = 10 -- o tanto de skills ele ficara mais forte

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, time*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, points)

function onCastSpell(cid, var)

local waittime = 15 -- Tempo de exhaustion
local storage = 15288

if exhaustion.check(cid, storage) then
return false
end

exhaustion.set(cid, storage, waittime)
local pos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)

local Tile1 = {x=1509, y=1255, z=7} -- position onde o player sera teleportado
local Tile2 = {x=1509, y=1259, z=7} -- position onde o target sera teleportado
local from,to = {x=979, y=911, z=7},{x=994, y=918, z=7},{ -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from,to1 = {x=1504, y=1253, z=7},{x=1514, y=1263, z=7},{ -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from,to2 = {x=1553, y=1253, z=7},{x=1562, y=1262, z=7},{ -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from,to3 = {x=1160, y=1176, z=7},{x=1168, y=1190, z=7},{ -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from,to4 = {x=664, y=1099, z=7},{x=685, y=1104, z=7},{ -- ponto 1 ao ponto 2 da area em que ele sera teleportado


if isInRange(pos, from, to) and isInRange(pos, from1, to1) and isInRange(pos, from2, to2) and isInRange(pos, from3, to3) and isInRange(pos, from4, to4) then
doPlayerSendCancel(cid, "Você nao pode usar o Tsukuyomi World aqui!")
return FALSE
end

if not isPlayer(target) then
doPlayerSendCancel(cid, "Você so pode usar essa magia em players!")
return FALSE
end

local function Teleport_Player(cid)
doTeleportThing(cid,pos)
end

local function Teleport_Target(target)
doCreatureSetNoMove(target, 0)
doTeleportThing(target,targetpos)
end

doAddCondition(cid, condition)
doCreatureSetNoMove(target, 1)
doTeleportThing(cid,Tile1)
doTeleportThing(target,Tile2)
doSendMagicEffect(targetpos, 252)
addEvent(Teleport_Player, time*1000, cid)
addEvent(Teleport_Target, time*1000, target)
return TRUE
end