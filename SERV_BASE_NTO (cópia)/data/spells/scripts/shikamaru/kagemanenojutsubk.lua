local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 134)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -110.2, 1, -110.2, 1)

local condition = createConditionObject(CONDITION_PARALYZE)
setConditionParam(condition, CONDITION_PARAM_TICKS, 20000)
setConditionParam(condition, CONDITION_PARAM_SPEED, -400)
setCombatCondition(combat1, condition)

arr1 = {
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 1, 0, 0, 0},
{0, 0, 0, 3, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
{0, 0, 0, 0, 0, 0, 0},
}

local area1 = createCombatArea(arr1)
setCombatArea(combat1, area1)

function onCastSpell(cid, var)
local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x, y=p.y-1, z=p.z},
[1] = {x=p.x+4, y=p.y, z=p.z},
[2] = {x=p.x, y=p.y+4, z=p.z},
[3] = {x=p.x, y=p.y, z=p.z}
}
local y = {
[0] = 162,
[1] = 164,
[2] = 165,
[3] = 163
}
pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]
doSendMagicEffect(pos, eff)
doCreatureSay(cid, "Kagemane no Jutsu", TALKTYPE_MONSTER)
doCombat(cid, combat1, var)
end