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
doCreatureSay(cid, "Manda Apareça", TALKTYPE_MONSTER)
local target = getCreatureTarget(cid)
local position = {x=getCreaturePosition(target).x+1, y=getCreaturePosition(target).y, z=getCreaturePosition(target).z}
addEvent(doSendMagicEffect, 0, position, 157)
addEvent(doSendMagicEffect, 300, position, 47)
addEvent(doSendMagicEffect, 600, position, 47)
addEvent(doSendMagicEffect, 900, position, 47)
addEvent(onCastSpell2, 0, parameters)
addEvent(onCastSpell3, 300, parameters)
addEvent(onCastSpell3, 600, parameters)
addEvent(onCastSpell4, 900, parameters)
end