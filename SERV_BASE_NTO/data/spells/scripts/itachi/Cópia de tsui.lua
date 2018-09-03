local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 134)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -95.2, 1, -85.2, 1)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -400)
setCombatCondition(combat, condition)

function onCastSpell(cid, var)
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}
doSendMagicEffect(position1, 182)
return doCombat(cid, combat, var)
end