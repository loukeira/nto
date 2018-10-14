local effect = 3 -- Effect que vai sair

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 138)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -5, -10, -5, -10)

function onCastSpell(cid, var)

	local target = variantToNumber(var)    
        doCombat(cid, combat, var)

	if not isPlayer(target) then
		doSendMagicEffect(getThingPos(target), effect)
		return true
	end	
	doTeleportThing(cid, getThingPos(target))
	doSendMagicEffect(getThingPos(target), effect)			
    return true
end