--[[
	Spell by Shawak
	
Wolf transform
]]--
 

local time = 60 * 1000 -- 60 * 1000 = 2 min

local ml = 5 -- quantos ira aumentar o skill de ML
	
local skillfist = 5 -- quantos ira aumentar o skill de Fist
	
local skillsword = 5 -- quantos ira aumentar o skill de Sword
	
local skillaxe = 5 -- quantos ira aumentar o skill de Axe
	
local skillclub = 5 -- quantos ira aumentar o skill de Club
	
local skilldistance = 5 -- quantos ira aumentar o skill de Distance
	
local health = -150 -- A cada 1 segundo quantos aumentar de vida
	
local addShielding = 50 -- how much shielding should be added
 
 

local wolf = {lookType = 158, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookTypeEx = 0, lookAddons = 0}

local combat = createCombatObject()

setCombatParam(combat, COMBAT_PARAM_EFFECT, 5)

setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
 

local condition = createConditionObject(CONDITION_ATTRIBUTES)

setConditionParam(condition, CONDITION_PARAM_TICKS, time)

setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, addShielding)

setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)

setCombatCondition(combat, condition)
 

local speed = createConditionObject(CONDITION_HASTE)

setConditionParam(speed, CONDITION_PARAM_TICKS, time)

setConditionFormula(speed, 0.7, -56, 0.7, -56)

setCombatCondition(combat, speed)
 

local outfit = createConditionObject(CONDITION_OUTFIT)

setConditionParam(outfit, CONDITION_PARAM_TICKS, time)

addOutfitCondition(outfit, wolf)

setCombatCondition(combat, outfit)
 

local exhaust = createConditionObject(CONDITION_EXHAUST)

setConditionParam(exhaust, CONDITION_PARAM_SUBID, 2)

setConditionParam(exhaust, CONDITION_PARAM_TICKS, time)

setCombatCondition(combat, exhaust)
 

function onCastSpell(cid, var)
	

return doCombat(cid, combat, var)

end
