local combat1 = createCombatObject()

setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat1, COMBAT_PARAM_EFFECT, 196)

setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -10.1, 1, -15.2, 1)


local combat2 = createCombatObject()

setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat2, COMBAT_PARAM_EFFECT, 196)

setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -10.2, 1, -15.2, 1)


local combat3 = createCombatObject()

setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat3, COMBAT_PARAM_EFFECT, 196)

setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -10.2, 1, -15.1, 1)


local combat4 = createCombatObject()

setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat4, COMBAT_PARAM_EFFECT, 196)

setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -10.2, 1, -15.2, 1)




arr1 = {
	
{3}

}


arr2 = {
	
{3}

}


arr3 = {
	
{3}

}


arr4 = {
	
{3}

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
local storage = 15288

if isPlayer(cid) and exhaustion.check(cid, storage) == TRUE then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 2)
return false
end

exhaustion.set(cid, storage, waittime)
local position127 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}

local parameters = { cid = cid, var = var}

addEvent(onCastSpell1, 200, parameters)

addEvent(onCastSpell2, 600, parameters)

addEvent(onCastSpell2, 1000, parameters)

addEvent(onCastSpell2, 1400, parameters)
    
doSendMagicEffect(position127, 110)
return TRUE
end 