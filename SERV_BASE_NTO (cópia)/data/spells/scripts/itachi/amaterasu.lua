local combat1 = createCombatObject()

setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat1, COMBAT_PARAM_EFFECT, 79)

setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -20.5, 1, -20.5, 1)


local combat2 = createCombatObject()

setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat2, COMBAT_PARAM_EFFECT, 79)

setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -20.5, 1, -20.5, 1)


local combat3 = createCombatObject()

setCombatParam(combat3, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat3, COMBAT_PARAM_EFFECT, 79)

setCombatFormula(combat3, COMBAT_FORMULA_LEVELMAGIC, -20.5, 1, -20.5, 1)


local combat4 = createCombatObject()

setCombatParam(combat4, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat4, COMBAT_PARAM_EFFECT, 79)

setCombatFormula(combat4, COMBAT_FORMULA_LEVELMAGIC, -20.5, 1, -20.5, 1)



local combat5 = createCombatObject()

setCombatParam(combat5, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat5, COMBAT_PARAM_EFFECT, 79)

setCombatFormula(combat5, COMBAT_FORMULA_LEVELMAGIC, -20.5, 1, -20.5, 1)



local combat6 = createCombatObject()

setCombatParam(combat6, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

setCombatParam(combat6, COMBAT_PARAM_EFFECT, 79)

setCombatFormula(combat6, COMBAT_FORMULA_LEVELMAGIC, -20.5, 1, -20.5, 1)



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


arr5 = {
	
{3}

}


arr6 = {
	
{3}

}


local area1 = createCombatArea(arr1)

local area2 = createCombatArea(arr2)

local area3 = createCombatArea(arr3)

local area4 = createCombatArea(arr4)

local area5 = createCombatArea(arr5)

local area6 = createCombatArea(arr6)

setCombatArea(combat1, area1)

setCombatArea(combat2, area2)

setCombatArea(combat3, area3)

setCombatArea(combat4, area4)
 

setCombatArea(combat5, area5)
 

setCombatArea(combat6, area6)
 

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
 

local function onCastSpell5(parameters)
    
return isPlayer(parameters.cid) and doCombat(parameters.cid, combat5, parameters.var)

end
 

local function onCastSpell6(parameters)
    
return isPlayer(parameters.cid) and doCombat(parameters.cid, combat6, parameters.var)

end
 

function onCastSpell(cid, var)


if isPlayer(cid) and exhaustion.check(cid, 1200) then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(playerpos, 2)
return FALSE
end

exhaustion.set(cid, 1200, 2)
local position127 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}

local parameters = { cid = cid, var = var}

addEvent(onCastSpell1, 200, parameters)

addEvent(onCastSpell2, 600, parameters)

addEvent(onCastSpell2, 1000, parameters)

addEvent(onCastSpell2, 1400, parameters)
    
addEvent(onCastSpell2, 1700, parameters)
 
addEvent(onCastSpell2, 2000, parameters)
   
return TRUE

end 