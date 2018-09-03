local time = 15 -- tempo em segundos para voltar
local points = 80 -- o tanto de skills ele ficara mais forte

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

local Tile1 = {x=1509, y=1256, z=7} -- position onde o player sera teleportado
local Tile2 = {x=1509, y=1260, z=7} -- position onde o target sera teleportado
local from1,to1 = {x=1509, y=1259, z=7},{x=1509, y=1255, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from2,to2 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from3,to3 = {x=1514, y=1262, z=7},{x=1504, y=1253, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from4,to4 = {x=1552, y=1254, z=7},{x=1561, y=1262, z=7} -- ponto 1 ao ponto 2 da area
local from5,to5 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from6,to6 = {x=1156, y=1192, z=7},{x=1172, y=1172, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from7,to7 = {x=664, y=1096, z=7},{x=685, y=1104, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from8,to8 = {x=1553, y=1254, z=7},{x=1562, y=1262, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado

if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) or isInRange(pos, from5, to5) or isInRange(pos, from6, to6) or isInRange(pos, from7, to7) or isInRange(pos, from8, to8) then
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
doSendMagicEffect(targetpos, 182)
addEvent(Teleport_Player, time*1000, cid)
addEvent(Teleport_Target, time*1000, target)
return TRUE
end