local tempo = 60 -- tempo que o buff ira durar

local effect1 = {219} -- Efeito de cada evoluçao (no caso a inicial a 156)
local effect2 = {221}
local effect3 = {118}
local effect4 = {200}
local effect5 = {200}
local effect6 = {200}

local points1 = 35 -- quantos de skills ira dar em cada evoluçao (no caso a inicial 35)
local points2 = 45
local points3 = 55
local points4 = 65
local points5 = 75
local points6 = 85

local needX1 = 10 -- quantos vezes vai prescisar usar o buff pra upar pra seguinte evoluçao (no caso a inicial 10x)
local needX2 = 20
local needX3 = 30
local needX4 = 40
local needX5 = 50

local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_AGGRESSIVE, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_AGGRESSIVE, 0)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_AGGRESSIVE, 0)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_AGGRESSIVE, 0)

local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, points1)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, points1)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, points1)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, points1)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, points1)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, points1)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, points1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat1, condition)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, points2)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, points2)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, points2)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, points2)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, points2)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, points2)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, points2)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat2, condition)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, points3)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, points3)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, points3)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, points3)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, points3)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, points3)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, points3)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat3, condition)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, points4)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, points4)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, points4)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, points4)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, points4)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, points4)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, points4)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat4, condition)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, points5)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, points5)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, points5)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, points5)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, points5)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, points5)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, points5)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat5, condition)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, points6)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, points6)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, points6)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, points6)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, points6)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, points6)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, points6)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat6, condition)

local function Magica(tempo2,tempo3,cid)
if(isPlayer(cid)) then
if getPlayerStorageValue(cid,11000) <= needX1 then
for i=1, #effect1 do
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect1[i])  
end

elseif getPlayerStorageValue(cid,11000) >= needX1+1 and getPlayerStorageValue(cid,11000) <= needX2 then
for i=1, #effect2 do
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect2[i])  
end

elseif getPlayerStorageValue(cid,11000) >= needX2+1 and getPlayerStorageValue(cid,11000) <= needX3 then
for i=1, #effect3 do
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect3[i])  
end

elseif getPlayerStorageValue(cid,11000) >= needX3+1 and getPlayerStorageValue(cid,11000) <= needX4 then
for i=1, #effect4 do
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect4[i])  
end

elseif getPlayerStorageValue(cid,11000) >= needX4+1 and getPlayerStorageValue(cid,11000) <= needX5 then
for i=1, #effect5 do
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect5[i])  
end

elseif getPlayerStorageValue(cid,11000) >= needX5+1 then
for i=1, #effect6 do
local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, effect6[i])  
end
end
return TRUE
end
end
                  
function onCastSpell(cid, var)
if getCreatureCondition(cid, CONDITION_ATTRIBUTES) == FALSE then
if getPlayerStorageValue(cid,11000) < needX1 then
doCombat(cid, combat1, var)
elseif getPlayerStorageValue(cid,11000) == needX1 then
doCombat(cid, combat2, var)
doSendAnimatedText(getCreaturePosition(cid), 'Buff UP', 210)
elseif getPlayerStorageValue(cid,11000) > needX1 and getPlayerStorageValue(cid,11000) < needX2 then
doCombat(cid, combat2, var)
elseif getPlayerStorageValue(cid,11000) == needX2 then
doCombat(cid, combat3, var)
doSendAnimatedText(getCreaturePosition(cid), 'Buff UP', 210)
elseif getPlayerStorageValue(cid,11000) > needX2 and getPlayerStorageValue(cid,11000) < needX3 then
doCombat(cid, combat3, var)
elseif getPlayerStorageValue(cid,11000) == needX3 then
doCombat(cid, combat4, var)
doSendAnimatedText(getCreaturePosition(cid), 'Buff UP', 210)
elseif getPlayerStorageValue(cid,11000) > needX3 and getPlayerStorageValue(cid,11000) < needX4 then
doCombat(cid, combat4, var)
elseif getPlayerStorageValue(cid,11000) == needX4 then
doCombat(cid, combat5, var)
doSendAnimatedText(getCreaturePosition(cid), 'Buff UP', 210)
elseif getPlayerStorageValue(cid,11000) > needX4 and getPlayerStorageValue(cid,11000) < needX5 then
doCombat(cid, combat5, var)
elseif getPlayerStorageValue(cid,11000) == needX5 then
doCombat(cid, combat6, var)
doSendAnimatedText(getCreaturePosition(cid), 'Buff UP', 210)
elseif getPlayerStorageValue(cid,11000) > needX5 then
doCombat(cid, combat6, var)
end
tempo2 = 0
while (tempo2 ~= (tempo*1000)) do
addEvent(Magica, tempo2, tempo2, tempo*1000, cid)
tempo2 = tempo2 + 300
end
setPlayerStorageValue(cid, 11000,(getPlayerStorageValue(cid,11000))+1)
else
doPlayerSendCancel(cid, "Sorry, you are transformed.")
return FALSE
end
return TRUE
end