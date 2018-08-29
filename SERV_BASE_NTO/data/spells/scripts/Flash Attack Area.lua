local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 129)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -50.3, 1, -80.3, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -80.3, 1, -100.3, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 53)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -100.3, 1, -133.3, 1)

local arr1 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 2, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local arr2 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 1, 0, 0, 0, 0, 0, 1, 0},
{0, 1, 0, 1, 1, 1, 0, 1, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 1, 2, 1, 1, 0, 0},
{0, 0, 0, 1, 1, 1, 0, 0, 0},
{0, 1, 0, 1, 1, 1, 0, 1, 0},
{0, 1, 0, 0, 0, 0, 0, 1, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0}
}

local arr3 = {
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 0, 3, 0, 1, 0, 0},
{0, 0, 1, 0, 0, 0, 1, 0, 0},
{0, 0, 1, 1, 1, 1, 1, 0, 0},
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
return FALSE
end

local parameters = {cid = cid, var = var}
local positions = {
[1] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y-3, z=getCreaturePosition(cid).z},
[2] = {x=getCreaturePosition(cid).x-3, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[3] = {x=getCreaturePosition(cid).x-2, y=getCreaturePosition(cid).y-3, z=getCreaturePosition(cid).z},
[4] = {x=getCreaturePosition(cid).x-1, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[5] = {x=getCreaturePosition(cid).x-4, y=getCreaturePosition(cid).y-2, z=getCreaturePosition(cid).z},
[6] = {x=getCreaturePosition(cid).x-3, y=getCreaturePosition(cid).y-3, z=getCreaturePosition(cid).z},
[7] = {x=getCreaturePosition(cid).x-5, y=getCreaturePosition(cid).y-4, z=getCreaturePosition(cid).z},
[8] = {x=getCreaturePosition(cid).x-6, y=getCreaturePosition(cid).y-7, z=getCreaturePosition(cid).z},
[9] = {x=getCreaturePosition(cid).x-6, y=getCreaturePosition(cid).y-6, z=getCreaturePosition(cid).z},
[10] = {x=getCreaturePosition(cid).x-7, y=getCreaturePosition(cid).y-5, z=getCreaturePosition(cid).z},
}

local function Efect1()
for i=1, #positions do
doSendDistanceShoot(positions[i], getCreaturePosition(cid), 42)
end
end

local function Efect2()
for i=1, #positions do
doSendDistanceShoot(positions[i], getCreaturePosition(cid), 47)
end
end

local function Efect3()
for i=1, #positions do
doSendDistanceShoot(positions[i], getCreaturePosition(cid), 29)
end
end

local function Efect4()
for i=1, #positions do
doSendDistanceShoot(positions[i], getCreaturePosition(cid), 29)
end
end

local function Efect5()
for i=1, #positions do
doSendDistanceShoot(positions[i], getCreaturePosition(cid), 42)
end
end

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