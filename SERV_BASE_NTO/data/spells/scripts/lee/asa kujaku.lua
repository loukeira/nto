local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, 134)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -40.2, 1, -40.2, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_DISTANCEEFFECT, 134)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -40.1, 1, -40.6, 1)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat3, COMBAT_PARAM_DISTANCEEFFECT, 134)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -40.4, 1, -40.5, 1)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat4, COMBAT_PARAM_DISTANCEEFFECT, 134)
setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -40.3, 1, -40.5, 1)


arr1 = {
 {0, 0, 0, 0, 0, 0, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 3, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 0, 0, 0, 0, 0, 0}
}

arr2 = {
 {0, 0, 0, 0, 0, 0, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 3, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 0, 0, 0, 0, 0, 0}
}

arr3 = {
 {0, 0, 0, 0, 0, 0, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 3, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 0, 0, 0, 0, 0, 0}
}

arr4 = {
 {0, 0, 0, 0, 0, 0, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 3, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 1, 1, 1, 1, 1, 0},
 {0, 0, 0, 0, 0, 0, 0}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
local area3 = createCombatArea(arr3)
local area4 = createCombatArea(arr4)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
setCombatArea(combat3, area3)
setCombatArea(combat4, area4)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

local function onCastSpell3(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat3, parameters.var)
end

local function onCastSpell4(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat4, parameters.var)
end
 
function onCastSpell(cid, var)

local waittime = 1 -- Tempo de exhaustion
local storage = 15859

if exhaustion.check(cid, storage) then
return false
end

exhaustion.set(cid, storage, waittime)
local position1 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position2 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+2, z=getCreaturePosition(cid).z}
local position3 = {x=getCreaturePosition(cid).x+1, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local position4 = {x=getCreaturePosition(cid).x+2, y=getCreaturePosition(cid).y+1, z=getCreaturePosition(cid).z}
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 100, parameters)
addEvent(onCastSpell2, 200, parameters)
addEvent(onCastSpell2, 300, parameters)
addEvent(onCastSpell2, 400, parameters)
doSendMagicEffect(position1, 100)
doSendMagicEffect(position2, 101)
doSendMagicEffect(position3, 102)
doSendMagicEffect(position4, 103)
return TRUE
end 