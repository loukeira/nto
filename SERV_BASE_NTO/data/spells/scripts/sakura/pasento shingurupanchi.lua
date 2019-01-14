local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EEFFECT, 310)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -20.2, 1, -20.2, 1)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 309)
setCombatFormula(combat2, COMBAT_FORMULA_LEVELMAGIC, -20.1, 1, -20.6, 1)

arr1 = {
 {3}
}

arr2 = {
 {3}
}

local area1 = createCombatArea(arr1)
local area2 = createCombatArea(arr2)
setCombatArea(combat1, area1)
setCombatArea(combat2, area2)
 
local function onCastSpell1(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat1, parameters.var)
end
 
local function onCastSpell2(parameters)
    return isPlayer(parameters.cid) and doCombat(parameters.cid, combat2, parameters.var)
end

function onCastSpell(cid, var)
--target = getCreatureTarget(cid)
--if not target then doPlayerSendCancel(cid, "Voce tem que estar mirando em alguem!") return true end


local waittime = 3
local storage = 113052

if exhaustion.check(cid, storage) then
doCreatureSay(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.", TALKTYPE_MONSTER)
return trye
end

exhaustion.set(cid, storage, waittime)
local position348 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local parameters = { cid = cid, var = var}
addEvent(onCastSpell1, 500, parameters)
addEvent(onCastSpell2, 1000, parameters)
    doSendMagicEffect(position348, 3)
return TRUE
end 