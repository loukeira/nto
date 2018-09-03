local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 28)

local area = createCombatArea(AREA_CROSS2X2)
setCombatArea(combat, area)

function onTargetCreature(cid, target) return doChallengeCreature(cid, target) end
setCombatCallback(combat, CALLBACK_PARAM_TARGETCREATURE, "onTargetCreature")

function onCastSpell(cid, var)
	return doCombat(cid, combat, var)
end