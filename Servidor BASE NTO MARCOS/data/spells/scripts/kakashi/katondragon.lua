local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat1, COMBAT_PARAM_EFFECT, 134)
setCombatFormula(combat1, COMBAT_FORMULA_LEVELMAGIC, -40.2, 1, -50.2, 1)

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
local waittime = 1 -- Tempo de exhaustion
local storage = 5818

if exhaustion.check(cid, storage) then
doCreatureSay(cid, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.", TALKTYPE_MONSTER)
return false
end

local p = getCreaturePosition(cid)
local x = {
[0] = {x=p.x, y=p.y-1, z=p.z},
[1] = {x=p.x+4, y=p.y, z=p.z},
[2] = {x=p.x, y=p.y+4, z=p.z},
[3] = {x=p.x-1, y=p.y, z=p.z}
}
local y = {
[0] = 106,
[1] = 104,
[2] = 107,
[3] = 105
}
pos = x[getCreatureLookDirection(cid)]
eff = y[getCreatureLookDirection(cid)]
doSendMagicEffect(pos, eff)
doCreatureSay(cid, "Katon Dragon Furie no Jutsu", TALKTYPE_MONSTER)
exhaustion.set(cid, storage, waittime)
doCombat(cid, combat1, var)
end