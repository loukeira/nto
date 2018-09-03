local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN)
setCombatParam(combat, COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGY)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1.6, -100, -3.8, -100)

arr = {
{0, 0, 0, 0, 6, 1, 2, 0, 0, 0, 0},
{0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 1, 3, 1, 1, 3, 1, 1, 0, 0},
{0, 4, 1, 1, 1, 1, 1, 1, 1, 7, 0},
{0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0},
{1, 3, 4, 5, 6, 7, 1, 5, 1, 1, 1},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
{0, 0, 1, 1, 1, 7, 2, 1, 1, 0, 0},
{0, 5, 0, 1, 1, 1, 1, 1, 0, 0, 0},
{0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0},
}


local area = createCombatArea(arr)
setCombatArea(combat, area)

function onCastSpell(cid, var)
        return doCombat(cid, combat, var)
end