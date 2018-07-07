local combat = createCombatObject() 
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_MANADRAIN) 
setCombatParam(combat, COMBAT_PARAM_EFFECT, 5) 
setCombatParam(combat, COMBAT_PARAM_TARGETCASTERORTOPMOST, 1) 
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0) 
setCombatParam(combat, COMBAT_PARAM_DISPEL, CONDITION_PARALYZE) 
--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, 1.2, -30, 1.6, 0) 

function onGetFormulaValues(cid, level, maglevel) 
    min = (level * 4 + maglevel * 3) * 4.2 - 25 
    max = (level * 4 + maglevel * 3) * 4.5 
     
    if min < 2000 then 
        min = 2000 
    end 

    return min, max 
end 

setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues") 

function onCastSpell(cid, var) 
    return doCombat(cid, combat, var) 
end  