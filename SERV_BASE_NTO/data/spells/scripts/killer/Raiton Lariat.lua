local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50.3, 1, -80.3, 1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local parameters = {cid = cid, var = var}
local playerpos = getCreaturePosition(cid)
local enemypos = getCreaturePosition(getCreatureTarget(cid))

if isPlayer(cid) and exhaustion.check(cid, 12000) then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(playerpos, 2)
return FALSE
end

local positions = {
[1] = {{x=enemypos.x+1, y=enemypos.y, z=enemypos.z}, 95},
[2] = {{x=playerpos.x+1, y=playerpos.y+1, z=playerpos.z}, 138},
[3] = {{x=enemypos.x, y=enemypos.y+1, z=enemypos.z}, 140},
[4] = {{x=enemypos.x+2, y=enemypos.y+1, z=enemypos.z}, 140},
}

exhaustion.set(cid, 12000, 1)
doTeleportThing(cid, enemypos)
addEvent(onCastSpell1, 1, parameters)
for i=1, #positions do
doSendMagicEffect(positions[i][1], positions[i][2])
end
return TRUE
end