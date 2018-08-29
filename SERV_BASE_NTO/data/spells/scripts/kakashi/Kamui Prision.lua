function onCastSpell(cid, var)

local waittime = 300 -- Tempo de exhaustion
local storage = 15288

if exhaustion.check(cid, storage) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
return false
end

exhaustion.set(cid, storage, waittime)
local Tile1 = {x=1554, y=1315, z=7} -- pos pra onde sera levado o target
local from1,to1 = {x=1509, y=1259, z=7},{x=1509, y=1255, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from2,to2 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from3,to3 = {x=1514, y=1262, z=7},{x=1504, y=1253, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from4,to4 = {x=1552, y=1254, z=7},{x=1561, y=1262, z=7} -- ponto 1 ao ponto 2 da area
local from5,to5 = {x=979, y=911, z=7},{x=994, y=918, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from6,to6 = {x=1156, y=1192, z=7},{x=1172, y=1172, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from7,to7 = {x=664, y=1096, z=7},{x=685, y=1104, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local from8,to8 = {x=1553, y=1254, z=7},{x=1562, y=1262, z=7} -- ponto 1 ao ponto 2 da area em que ele sera teleportado
local target = getCreatureTarget(cid)
local targetpos = getCreaturePosition(target)
local time = 30 -- tempo pra teleporta devolta, em segs

if isInRange(pos, from1, to1) or isInRange(pos, from2, to2) or isInRange(pos, from3, to3) or isInRange(pos, from4, to4) or isInRange(pos, from5, to5) or isInRange(pos, from6, to6) or isInRange(pos, from7, to7) or isInRange(pos, from8, to8) then
doPlayerSendCancel(cid, "Você nao pode usar o Kamui aqui!")
return FALSE
end

local function Target_Back(target)
doTeleportThing(target, targetpos)
end

if isPlayer(target) then
doTeleportThing(target, Tile1)
doSendMagicEffect(targetpos, 196)
addEvent(Target_Back, time*1000, target)
doCreatureSay(cid, "Kamui Prision", TALKTYPE_MONSTER)
else
doPlayerSendCancel(cid, "Voce so pode usar esta magia em players!")
end
end