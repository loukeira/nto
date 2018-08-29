local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, true)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 134)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionFormula(condition, -0.5, 0, -0.5, 0)
setCombatCondition(combat, condition)

local area = createCombatArea(AREA_CROSS6X6)
setCombatArea(combat, area)
function onCastSpell(cid, var)
        local position = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, 219)
	return doCombat(cid, combat, var)
end