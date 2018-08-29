local tempo = 60 -- tempo em segundos.
local effect = {136} -- effect no player, caso queira apenas 1, basta remover os outros numeros.
local effectt = {120} -- effect no player, caso queira apenas 1, basta remover os outros numeros.
local effecttt = {119} -- effect no player, caso queira apenas 1, basta remover os outros numeros.
     
local ml = 5 -- quantos ira aumentar o skill de ML
local skillfist = 5 -- quantos ira aumentar o skill de Fist
local skillsword = 5 -- quantos ira aumentar o skill de Sword
local skillaxe = 5 -- quantos ira aumentar o skill de Axe
local skillclub = 5 -- quantos ira aumentar o skill de Club
local skilldistance = 5 -- quantos ira aumentar o skill de Distance
local skillshield = 5 -- quantos ira aumentar o skill de Shield
local health = -150 -- A cada 1 segundo quantos aumentar de vida
local magic = 7 -- quantos ira aumentar o skill de ML
local skillmao = 7 -- quantos ira aumentar o skill de Fist
local skillespada = 7 -- quantos ira aumentar o skill de Sword
local skillmachado = 7 -- quantos ira aumentar o skill de Axe
local skillmaca = 7 -- quantos ira aumentar o skill de Club
local skillarco = 7 -- quantos ira aumentar o skill de Distance
local skilldefesa = 7 -- quantos ira aumentar o skill de Shield
local magica = 5 -- quantos ira aumentar o skill de ML
local skillmaozinha = 15 -- quantos ira aumentar o skill de Fist
local skillespadinha = 15 -- quantos ira aumentar o skill de Sword
local skillmachadinho = 15 -- quantos ira aumentar o skill de Axe
local skillmacacinha = 15 -- quantos ira aumentar o skill de Club
local skillarquinho = 15 -- quantos ira aumentar o skill de Distance
local skilldefesinha = 15 -- quantos ira aumentar o skill de Shield
local combat_lv1 = createCombatObject()
setCombatParam(combat_lv1, COMBAT_PARAM_AGGRESSIVE, 0)
     
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, ml)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, skillfist)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, skillsword)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, skillaxe)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillclub)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, skilldistance)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skillshield)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setCombatCondition(combat_lv1, condition)
     
local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_SPEED, 250)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat_lv1, condition)
     
local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat_lv1, condition)



local combat_lv2 = createCombatObject()
setCombatParam(combat_lv2, COMBAT_PARAM_AGGRESSIVE, 0)
     
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, magic)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, skillmao)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, skillespada)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, skillmachado)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillmaca)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, skillarco)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skilldefesa)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setCombatCondition(combat_lv2, condition)
     
local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_SPEED, 250)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat_lv2, condition)
     
local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat_lv2, condition)




local combat_lv3 = createCombatObject()
setCombatParam(combat_lv3, COMBAT_PARAM_AGGRESSIVE, 0)
     
local condition = createConditionObject(CONDITION_ATTRIBUTES)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_STAT_MAGICLEVEL, magica)
setConditionParam(condition, CONDITION_PARAM_SKILL_FIST, skillmaozinha)
setConditionParam(condition, CONDITION_PARAM_SKILL_SWORD, skillespadinha)
setConditionParam(condition, CONDITION_PARAM_SKILL_AXE, skillmachadinho)
setConditionParam(condition, CONDITION_PARAM_SKILL_CLUB, skillmacacinha)
setConditionParam(condition, CONDITION_PARAM_SKILL_DISTANCE, skillarquinho)
setConditionParam(condition, CONDITION_PARAM_SKILL_SHIELD, skilldefesinha)
setConditionParam(condition, CONDITION_PARAM_OUTFIT, outfit)
setCombatCondition(combat_lv3, condition)
     
local condition = createConditionObject(CONDITION_HASTE)
setConditionParam(condition, CONDITION_PARAM_SPEED, 250)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setCombatCondition(combat_lv3, condition)
     
local condition = createConditionObject(CONDITION_REGENERATION)
setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
setCombatCondition(combat_lv3, condition)
            
function magicEffect1(tempo2,tempo3,cid)
if (isCreature(cid)) then
    if getPlayerStorageValue(cid, 102053) > 0 and getCreatureCondition(cid, CONDITION_REGENERATION, 1) then
        for i=1, #effect do
        local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, 136)  
        end
    end
end
end

function magicEffect7(tempo2,tempo3,cid)
if (isCreature(cid)) then
    if getPlayerStorageValue(cid, 102253) > 0 and getCreatureCondition(cid, CONDITION_REGENERATION, 1) then
        for i=7, #effect do
        local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, 120)  
        end
    end
end
end

function magicEffect8(tempo2,tempo3,cid)
if (isCreature(cid)) then
    if getPlayerStorageValue(cid, 103053) > 0 and getCreatureCondition(cid, CONDITION_REGENERATION, 1) then
        for i=8, #effect do
        local position = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
doSendMagicEffect(position, 119)  
        end
    end
end
end

local function onCastSpell1(parameters)
doCombat(parameters.cid, combat_lv1, parameters.var)
end

local function onCastSpell2(parameters)
doCombat(parameters.cid, combat_lv2, parameters.var)
end

local function onCastSpell3(parameters)
doCombat(parameters.cid, combat_lv3, parameters.var)
end
                  
function onCastSpell(cid, var)
if getPlayerStorageValue(cid, 102053) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
    doCombat(cid, combat, var)
    tempo2 = 0
    while (tempo2 ~= (tempo*1000)) do
        addEvent(magicEffect1, tempo2, tempo2, tempo*1000, cid)
        tempo2 = tempo2 + 300
    end
    setPlayerStorageValue(cid, 102053,1) -- storage verifica transformado, quando = 1 player esta transformado.
else
    doPlayerSendCancel(cid, "Sorry, you are transformed.")
end
if getPlayerStorageValue(cid, 102253) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
    doCombat(cid, combat, var)
    tempo2 = 0
    while (tempo2 ~= (tempo*1000)) do
        addEvent(magicEffect7, tempo2, tempo2, tempo*1000, cid)
        tempo2 = tempo2 + 300
    end
    setPlayerStorageValue(cid, 102253,1) -- storage verifica transformado, quando = 1 player esta transformado.
else
    doPlayerSendCancel(cid, "Sorry, you are transformed.")
end
if getPlayerStorageValue(cid, 103053) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false then
    doCombat(cid, combat, var)
    tempo2 = 0
    while (tempo2 ~= (tempo*1000)) do
        addEvent(magicEffect8, tempo2, tempo2, tempo*1000, cid)
        tempo2 = tempo2 + 300
    end
    setPlayerStorageValue(cid, 103053,1) -- storage verifica transformado, quando = 1 player esta transformado.
else
    doPlayerSendCancel(cid, "Sorry, you are transformed.")
end

local parameters = { cid = cid, var = var}
local spell_storage = 46501
if getPlayerStorageValue(cid, spell_storage) < 5 then
addEvent(onCastSpell1, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 5 then
addEvent(onCastSpell2, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "O jutsu Susano subiu para o level 2")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Spell UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 10 and getPlayerStorageValue(cid, spell_storage) < 30 then
addEvent(onCastSpell2, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
elseif getPlayerStorageValue(cid, spell_storage) == 30 then
addEvent(onCastSpell3, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
doPlayerSendTextMessage(cid, 22, "O jutsu Susano subiu para o level 3")
doSendMagicEffect(getCreaturePosition(cid),28)
doSendAnimatedText(getCreaturePosition(cid), 'Spell UP', 210)
elseif getPlayerStorageValue(cid, spell_storage) > 30 then
addEvent(onCastSpell3, 0, parameters)
setPlayerStorageValue(cid, spell_storage, getPlayerStorageValue(cid, spell_storage)+1)
end
return TRUE
end