local tempo = 60 -- tempo em segundos
local effect = {228} -- effect no player
local exausted = 1 -- em minutos

local points = 10 -- quantos ira aumentar os skills
local outfit = {lookType = 608
}
 -- outfit que ira dar

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, points)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, points)
setCombatCondition(combat, condition)

local condition = createConditionObject(CONDITION_OUTFIT)

setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)

addOutfitCondition(condition, outfit)

setCombatCondition(combat, condition)


function Magica(cid)
if isCreature(cid) then
for i=1, #effect do
local position = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}
doSendMagicEffect(position, effect[i])
end
end
end

function onCastSpell(cid, var)

if isPlayer(cid) and getPlayerAccess(cid) < 3 and getPlayerStorageValue(cid, 17456)-os.time() > 1 then
local seetime = getPlayerStorageValue(cid, 17456)-os.time()
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde "..minutes.." minuto(s) e "..seconds.." segundo(s) para usar novamente!")
return false
end

setPlayerStorageValue(cid, 17456, exausted*60+os.time())
doCombat(cid, combat, var)
local tempo2 = 0
while (tempo2 <= (tempo*1000)) do
addEvent(Magica, tempo2, cid)
tempo2 = tempo2 + 300
end
return true
end