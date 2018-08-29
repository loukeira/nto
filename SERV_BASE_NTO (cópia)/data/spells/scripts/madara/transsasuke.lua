local outfit = {lookType = 32} -- Roupa que ira transformar no caso seu corpo ficara em choque
local tempo = 60 * 1000 -- Tempo, nesse caso esta 60 segundos Lembrando que 1000 = 1 segundo

local ml = 2 -- quantos ira aumentar o skill de ML
local skillfist = 2 -- quantos ira aumentar o skill de Fist
local skillsword = 2 -- quantos ira aumentar o skill de Sword
local skillaxe = 2 -- quantos ira aumentar o skill de Axe
local skillclub = 2 -- quantos ira aumentar o skill de Club
local skilldistance = 2 -- quantos ira aumentar o skill de Distance
local skillshield = 2 -- quantos ira aumentar o skill de Shield
local health = 20 -- A cada 1 segundo quantos aumentar de vida

local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)

local combat2 = createCombatObject()
setCombatParam(combat2, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat2, COMBAT_PARAM_AGGRESSIVE, 0)

local combat3 = createCombatObject()
setCombatParam(combat3, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat3, COMBAT_PARAM_AGGRESSIVE, 0)

local combat4 = createCombatObject()
setCombatParam(combat4, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat4, COMBAT_PARAM_AGGRESSIVE, 0)

local combat5 = createCombatObject()
setCombatParam(combat5, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat5, COMBAT_PARAM_AGGRESSIVE, 0)

local combat6 = createCombatObject()
setCombatParam(combat6, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat6, COMBAT_PARAM_AGGRESSIVE, 0)

local combat7 = createCombatObject()
setCombatParam(combat7, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat7, COMBAT_PARAM_AGGRESSIVE, 0)

local combat8 = createCombatObject()
setCombatParam(combat8, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat8, COMBAT_PARAM_AGGRESSIVE, 0)

local combat9 = createCombatObject()
setCombatParam(combat9, COMBAT_PARAM_EFFECT, 48)
setCombatParam(combat9, COMBAT_PARAM_AGGRESSIVE, 0)

local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, ml)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, skillfist)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, skillsword)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, skillaxe)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, skilldistance)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setCombatCondition(combat, condition)
setCombatCondition(combat2, condition)
setCombatCondition(combat3, condition)
setCombatCondition(combat4, condition)
setCombatCondition(combat5, condition)
setCombatCondition(combat6, condition)
setCombatCondition(combat7, condition)
setCombatCondition(combat8, condition)
setCombatCondition(combat9, condition)

local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_SPEED, 250)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat, condition)
setCombatCondition(combat2, condition)
setCombatCondition(combat3, condition)
setCombatCondition(combat4, condition)
setCombatCondition(combat5, condition)
setCombatCondition(combat6, condition)
setCombatCondition(combat7, condition)
setCombatCondition(combat8, condition)
setCombatCondition(combat9, condition)

local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat, condition)
setCombatCondition(combat2, condition)
setCombatCondition(combat3, condition)
setCombatCondition(combat4, condition)
setCombatCondition(combat5, condition)
setCombatCondition(combat6, condition)
setCombatCondition(combat7, condition)
setCombatCondition(combat8, condition)
setCombatCondition(combat9, condition)

local sys = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys, outfit)
setCombatCondition(combat, sys)

local sys2 = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys2, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys2,  {lookType = 342})
setCombatCondition(combat2, sys2)

local sys3 = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys3, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys3,  {lookType = 347})
setCombatCondition(combat3, sys3)

local sys4 = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys4, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys4,  {lookType = 352})
setCombatCondition(combat4, sys4)

local sys5 = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys5, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys5,  {lookType = 357})
setCombatCondition(combat5, sys5)

local sys6 = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys6, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys6,  {lookType = 362})
setCombatCondition(combat6, sys6)

local sys7 = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys7, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys7,  {lookType = 367})
setCombatCondition(combat7, sys7)

local sys8 = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys8, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys8,  {lookType = 372})
setCombatCondition(combat8, sys8)

local sys9 = createConditionObject(CONDITION_OUTFIT)
setConditionParam(sys9, CONDITION_PARAM_TICKS, tempo)
addOutfitCondition(sys9,  {lookType = 377})
setCombatCondition(combat9, sys9)



function onCastSpell(cid, var)
setPlayerStorageValue(cid, 102050,0)
if getPlayerStorageValue(cid, 102059) ~= 1 then
    if (getCreatureOutfit(cid).lookType == 341 or getCreatureOutfit(cid).lookType == 342 or getCreatureOutfit(cid).lookType == 343 or getCreatureOutfit(cid).lookType == 344 or getCreatureOutfit(cid).lookType == 345) then
	    return doCombat(cid, combat2, var)
	end
    if (getCreatureOutfit(cid).lookType == 346 or getCreatureOutfit(cid).lookType == 347 or getCreatureOutfit(cid).lookType == 348 or getCreatureOutfit(cid).lookType == 349 or getCreatureOutfit(cid).lookType == 350) then
	    return doCombat(cid, combat3, var)
	end	
    if (getCreatureOutfit(cid).lookType == 351 or getCreatureOutfit(cid).lookType == 352 or getCreatureOutfit(cid).lookType == 353 or getCreatureOutfit(cid).lookType == 354 or getCreatureOutfit(cid).lookType == 355) then
	    return doCombat(cid, combat4, var)
	end	
    if (getCreatureOutfit(cid).lookType == 356 or getCreatureOutfit(cid).lookType == 357 or getCreatureOutfit(cid).lookType == 358 or getCreatureOutfit(cid).lookType == 359 or getCreatureOutfit(cid).lookType == 360) then
	    return doCombat(cid, combat5, var)
	end		
	if (getCreatureOutfit(cid).lookType == 361 or getCreatureOutfit(cid).lookType == 362 or getCreatureOutfit(cid).lookType == 363 or getCreatureOutfit(cid).lookType == 364 or getCreatureOutfit(cid).lookType == 365) then
	    return doCombat(cid, combat6, var)
	end
	if (getCreatureOutfit(cid).lookType == 366 or getCreatureOutfit(cid).lookType == 367 or getCreatureOutfit(cid).lookType == 368 or getCreatureOutfit(cid).lookType == 369 or getCreatureOutfit(cid).lookType == 370) then
	    return doCombat(cid, combat7, var)
	end
	if (getCreatureOutfit(cid).lookType == 371 or getCreatureOutfit(cid).lookType == 372 or getCreatureOutfit(cid).lookType == 373 or getCreatureOutfit(cid).lookType == 374 or getCreatureOutfit(cid).lookType == 375) then
	    return doCombat(cid, combat8, var)
	end
	if (getCreatureOutfit(cid).lookType == 376 or getCreatureOutfit(cid).lookType == 377 or getCreatureOutfit(cid).lookType == 378 or getCreatureOutfit(cid).lookType == 379 or getCreatureOutfit(cid).lookType == 380) then
	    return doCombat(cid, combat9, var)
	end
	
return doCombat(cid, combat, var)	
else
setPlayerStorageValue(cid, 102050,1)  
doPlayerSendCancel(cid, "Sorry, you can not turn while flying.") 
end 
end