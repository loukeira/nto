local combatDist = createCombatObject()
setCombatParam(combatDist, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combatDist, COMBAT_PARAM_EFFECT, 34)
setCombatParam(combatDist, COMBAT_PARAM_DISTANCEEFFECT, 29)
setCombatFormula(combatDist, COMBAT_FORMULA_LEVELMAGIC, -18.0, 0, -23.0, 0)

local paralyze = createConditionObject(CONDITION_PARALYZE)
setConditionParam(paralyze, CONDITION_PARAM_TICKS, 3000)
setConditionParam(paralyze, CONDITION_PARAM_SPEED, -800)

local function Cooldown(cid)
if isPlayer(cid) == TRUE then
doPlayerSendTextMessage(cid,MESSAGE_STATUS_WARNING,'CD: Lança Sagrada')
end
end

local exhausted_seconds = 3 -- Segundos que o Player Poderá castar a spell novamente
local exhausted_storagevalue = 9669 -- Storage Value do Cool Down

function onCastSpell(cid, var)
if(os.time() < getPlayerStorageValue(cid, exhausted_storagevalue)) then
doPlayerSendCancel(cid,'O Cooldown não está pronto.')
return TRUE
end

if(target == 0) then
doPlayerSendCancel(cid,'Select your target.')
doSendMagicEffect(getCreaturePosition(cid), 2)
return TRUE
end
local target = getCreatureTarget(cid)

if(target ~= 0 and isPlayer(target) == 1) then
local congelado = { lookType = getCreatureOutfit(target).lookType,lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = getCreatureOutfit(target).lookAddons}
doSetCreatureOutfit(target, congelado, 10000)
setPlayerStorageValue(target, exhausted_storagevalue, os.time() + exhausted_seconds)
doTargetCombatCondition(0, target, condition, CONST_ME_NONE)
doSendAnimatedText(getThingPos(target), "Lanca!", TEXTCOLOR_WHITE_EXP)
doPlayerSendTextMessage(target,20,'Voce está stunado.')
doTargetCombatCondition(0, target, paralyze, CONST_ME_NONE)
doCombat(cid, combatDist, numberToVariant(target))
else
local monstro = { lookType = getCreatureOutfit(target).lookType,lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = getCreatureOutfit(target).lookAddons}
doSendAnimatedText(getThingPos(target), "Lanca!", TEXTCOLOR_WHITE_EXP)
doSetCreatureOutfit(target, monstro, 10000)
doTargetCombatCondition(0, target, paralyze, CONST_ME_NONE)
doCombat(cid, combatDist, numberToVariant(target))
end

    rand = math.random(1,1)
    if rand == 1 and isPlayer(cid) == 1 then
     doPlayerSay(cid,"Stun!",16)
      addEvent(Cooldown, 1*9000,cid)
         setPlayerStorageValue(cid, exhausted_storagevalue, os.time() + exhausted_seconds)
    return doCombat(cid, combat, var)
    elseif rand == 2 and isPlayer(cid) == 1 then
     doPlayerSay(cid,"Stun!",16)
      addEvent(Cooldown, 1*9000,cid)
         setPlayerStorageValue(cid, exhausted_storagevalue, os.time() + exhausted_seconds)
    return doCombat(cid, combat, var)
else
      addEvent(Cooldown, 1*9000,cid)
         setPlayerStorageValue(cid, exhausted_storagevalue, os.time() + exhausted_seconds)
    return doCombat(cid, combat, var)
end
end