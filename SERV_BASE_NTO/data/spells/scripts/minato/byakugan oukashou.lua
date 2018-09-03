local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -100.3, 1, -100.3, 1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local parameters = {cid = cid, var = var}
local playerpos = getCreaturePosition(cid)
local enemypos = getCreaturePosition(getCreatureTarget(cid))

if isPlayer(cid) and exhaustion.check(cid, 1200) then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(playerpos, 2)
return FALSE
end

local positions = {
[1] = {{x=enemypos.x-1, y=enemypos.y, z=enemypos.z}, 185},
[2] = {{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z}, 95},
}

exhaustion.set(cid, 1200, 1)
doTeleportThing(cid, enemypos)
addEvent(onCastSpell1, 1, parameters)
for i=1, #positions do
doSendMagicEffect(positions[i][1], positions[i][2])
end
return TRUE
end