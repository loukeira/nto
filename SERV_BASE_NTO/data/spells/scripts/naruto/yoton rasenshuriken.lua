local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_FIREDAMAGE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 30)

function onGetFormulaValues(cid, level, maglevel)
	local min = level / 5 + maglevel * 5.5 + 32         
	local max = level / 5 + maglevel * 7.7 + 48
	return -min, -max
end

local speed = createConditionObject(CONDITION_PARALYZE)
setConditionParam(speed, CONDITION_PARAM_TICKS, 5000)
setConditionFormula(speed, -0.7, 56, -0.7, 56)
setCombatCondition(combat, speed)

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
function onCastSpell(cid, var)

local waittime = 5
local storage = 113026

if exhaustion.check(cid, storage) then
doCreatureSay(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.", TALKTYPE_MONSTER)
return true
end

exhaustion.set(cid, storage, waittime)
       return doCombat(cid, combat, var)
end