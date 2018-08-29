local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -1.2, 0, -1.3, 0)
local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -1.2, 0, -1.3, 0)
local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -1.2, 0, -1.3, 0)

local function onCastSpell2(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, parameters.combat2, parameters.var)
end

local function onCastSpell4(parameters)
doCombat(parameters.cid, parameters.combat3, parameters.var)
end

function onCastSpell(cid, var)
local parameters = { cid = cid, var = var, combat1 = combat1, combat2 = combat2, combat3 = combat3 }
doCreatureSay(cid, "Konoha Hariken!", TALKTYPE_MONSTER)
local target = getCreatureTarget(cid)
local position = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z}
local position2 = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z}
local position3 = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z}
local position4 = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z}
local position5 = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y+1, z=getCreaturePosition(target).z}
local position6 = {x=getCreaturePosition(target).x+2, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}
addEvent(doSendMagicEffect, 0, position, 39)
addEvent(doSendMagicEffect, 300, position2, 72)
addEvent(doSendMagicEffect, 600, position3, 72)
addEvent(doSendMagicEffect, 900, position4, 72)
addEvent(doSendMagicEffect, 1200, position5, 72)
addEvent(doSendMagicEffect, 1500, position6, 51)
addEvent(onCastSpell2, 0, parameters)
addEvent(onCastSpell3, 300, parameters)
addEvent(onCastSpell3, 600, parameters)
addEvent(onCastSpell3, 900, parameters)
addEvent(onCastSpell3, 1200, parameters)
addEvent(onCastSpell4, 1500, parameters)
end