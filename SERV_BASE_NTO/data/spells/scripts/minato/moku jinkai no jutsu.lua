local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -100.3, 1, -100.3, 1)

local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end

function onCastSpell(cid, var)
local parameters = {cid = cid, var = var}
local playerpos = getCreaturePosition(cid)

if isPlayer(cid) and exhaustion.check(cid, 12000) then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(playerpos, 2)
return FALSE
end

local positions = {
[1] = {{x=playerpos.x+1, y=playerpos.y-1, z=playerpos.z}, 199},
}

exhaustion.set(cid, 12000, 1)
addEvent(onCastSpell1, 1, parameters)
for i=1, #positions do
doSendMagicEffect(positions[i][1], positions[i][2])
end
return TRUE
end