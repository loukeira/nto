local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 48)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -80.3, 1, -80.3, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 36)

local arr1 = {
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 2, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 0, 0, 0, 0, 0, 0, 0, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1}
}

local arr2 = {
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 3, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1},
{1, 1, 1, 1, 1, 1, 1, 1, 1}
}

local arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end

local function onCastSpell2(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

function onCastSpell(cid, var)

if isPlayer(cid) and exhaustion.check(cid, 120) then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(playerpos, 2)
return FALSE
end

local parameters = {cid = cid, var = var}
local positions = {
[1] = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z},
[2] = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z},
[3] = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z},
[4] = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z},
[5] = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z},
[6] = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z},
[7] = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y-2, z=getCreaturePosition(cid).z},
[8] = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y-3, z=getCreaturePosition(cid).z},
[9] = {x=getCreaturePosition(cid).x+4, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[10] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z},
[11] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y+3, z=getCreaturePosition(cid).z},
[12] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z},
[13] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z},
[14] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z},
[15] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y-1, z=getCreaturePosition(cid).z},
[16] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y-2, z=getCreaturePosition(cid).z},
[17] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y-3, z=getCreaturePosition(cid).z},
[18] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[19] = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z},
[20] = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z},
[21] = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z},
[22] = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z},
[23] = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z},
[24] = {x=getCreaturePosition(cid).x-2, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z},
[25] = {x=getCreaturePosition(cid).x-3, y=getCreaturePosition(cid).y+4, z=getCreaturePosition(cid).z},
[26] = {x=getCreaturePosition(cid).x+3, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[27] = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[28] = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[29] = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[30] = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[31] = {x=getCreaturePosition(cid).x-2, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[32] = {x=getCreaturePosition(cid).x-3, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
}

local function Efect1()
for i=1, #positions do
doSendDistanceShoot(positions[i], getCreaturePosition(cid), 4)
end
end

local function Efect2()
for i=1, #positions do
doSendDistanceShoot(positions[i], getCreaturePosition(cid), 4)
end
end

local function Efect3()
for i=1, #positions do
doSendDistanceShoot(positions[i], getCreaturePosition(cid), 4)
end
end

local function Efect4()
for i=1, #positions do
doSendDistanceShoot(positions[i], getCreaturePosition(cid), 4)
end
end

local function Efect5()
for i=1, #positions do
doSendDistanceShoot(positions[i], getCreaturePosition(cid), 4)
end
end

                local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, 36)

exhaustion.set(cid, 120, 2)
addEvent(onCastSpell1, 1, parameters)
addEvent(onCastSpell2, 250, parameters)
addEvent(onCastSpell3, 200, parameters)
addEvent(Efect1, 100)
addEvent(Efect2, 200)
addEvent(Efect3, 300)
addEvent(Efect4, 400)
addEvent(Efect5, 500)
return TRUE
end