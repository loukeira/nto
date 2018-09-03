local effect = {221}
local exausted = 5 -- minutos
local tempo = 10 -- tempo que irao morrer
     
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 0, -999999999, 0, -999999999)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and getTilePzInfo(getCreaturePosition(parameters.cid)) == FALSE and doCombat(parameters.cid, combat, parameters.var)
end

local function Dead_END(cid)
if isCreature(cid) then
doCreatureSetNoMove(cid, 0)
if isCreature(getCreatureTarget(cid)) then
doCreatureSetNoMove(getCreatureTarget(cid), 0)
end
return getTilePzInfo(getCreaturePosition(cid)) == FALSE and doCreatureAddHealth(cid, -getCreatureMaxHealth(cid))
end
end
            
local function Magica(cid)
if isCreature(cid) then
doSendMagicEffect(getCreaturePosition(cid), 50)
for i=1, #effect do
local position = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z}
doSendMagicEffect(position, effect[i])
end
if isCreature(getCreatureTarget(cid)) then
doSendMagicEffect(getCreaturePosition(getCreatureTarget(cid)), 50)
end
end
end
                  
function onCastSpell(cid, var)
local parameters = {cid = cid, var = var}

if isPlayer(cid) and getPlayerStorageValue(cid, 17455)-os.time() > 1 then
local seetime = getPlayerStorageValue(cid, 17455)-os.time()
local minutes, seconds = math.floor(seetime/60), math.floor(seetime%60)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Aguarde "..minutes.." minuto(s) e "..seconds.." segundo(s) para usar novamente!")
return false
end

setPlayerStorageValue(cid, 17455, exausted*60+os.time())
addEvent(Dead_END, tempo*1000, cid)
addEvent(onCastSpell1, tempo*1000, parameters)
doCreatureSetNoMove(cid, 1)
doCreatureSetNoMove(getCreatureTarget(cid), 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Sua alma sera selada em "..tempo.." segundo(s)!")
local tempo2 = 0
while (tempo2 <= (tempo*1000)) do
addEvent(Magica, tempo2, cid)
tempo2 = tempo2 + 300
end
return true
end