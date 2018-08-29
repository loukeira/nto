local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 25)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -2, -17, -2, -30, 6, 6, 2.2, 2.8)

function onCastSpell(cid, var)

local jogadorpos = getCreaturePosition(cid)
local target = getCreatureTarget(cid)
local monsterpos = getCreaturePosition(target)
if target == isMonster or isCreature then
doTeleportThing(cid,monsterpos)
doTeleportThing(target,jogadorpos)
doSendMagicEffect(jogadorpos, 211)
doSendMagicEffect(monsterpos, 211)
return doCombat(cid, combat, var)
end
end