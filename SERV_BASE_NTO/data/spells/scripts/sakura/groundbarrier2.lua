local combat1 = createCombatObject()
setCombatParam(combat1, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatParam(combat1, COMBAT_PARAM_CREATEITEM, 1497)

local arr1 = {
{0, 0, 0, 0, 0, 0, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 1, 0, 0, 0, 1, 0},
{0, 1, 0, 2, 0, 1, 0},
{0, 1, 0, 0, 0, 1, 0},
{0, 1, 1, 1, 1, 1, 0},
{0, 0, 0, 0, 0, 0, 0}
}


local area1 = createCombatArea(arr1)


setCombatArea(combat1, area1)


local function onCastSpell1(parameters)
doCombat(parameters.cid, parameters.combat1, parameters.var)
end


function onCastSpell(cid, var)

local parameters = { cid = cid, var = var, combat1 = combat1 }

addEvent(onCastSpell1, 100, parameters)

end