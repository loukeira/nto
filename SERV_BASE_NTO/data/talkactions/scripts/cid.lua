
function onSay(cid, words, param, channel)

                        -- local coco = 1114
                        -- local xixi = 373
                        -- local stak = 1

                        -- while coco<=1117 do
                        -- while xixi <= 377 do
                        -- while stak <=255 do

                        -- if getTileThingByPos({x = coco, y = xixi, z = 7,stackpos = stak}).itemid == 9930 then
                        -- doPlayerSendTextMessage(cid, 18, "WORK!")
                        -- doSendMagicEffect({x = coco, y = xixi, z = 7,stackpos = stak}, 306)
                        -- doSendMagicEffect({x = coco, y = xixi, z = 7,stackpos = stak}, 307)

                        -- end

                        -- stak = stak +1
                        -- end

                        -- xixi = xixi + 1
                        -- stak = 0

                        -- end
                        -- coco = coco + 1
                        -- xixi = 373

                        -- end


local waittime = 3
local storage = 113007


-- if (getPlayerStorageValue(cid,storage) <= os.time()) then
--         setPlayerStorageValue(cid,storage, os.time() + waittime)
--         doPlayerSendTextMessage(cid,18,"coco!" ) 
-- end
--if exhaustion.check(cid, storage) then
--doPlayerSendTextMessage(cid,18, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
--doPlayerSendTextMessage(cid,18, "Aguarde " .. exhaustion.check(cid, storage) .. " segundos para usar a spell novamente.")
--return false
--end

local ml = 3 -- quantos ira aumentar o skill de ML
local skillfist = 0 -- quantos ira aumentar o skill de Fist
local skillsword = 0 -- quantos ira aumentar o skill de Sword
local skillaxe = 0 -- quantos ira aumentar o skill de Axe
local skillclub = 0 -- quantos ira aumentar o skill de Club
local skilldistance = 0 -- quantos ira aumentar o skill de Distance
local skillshield = 0 -- quantos ira aumentar o skill de Shield
local health = 0 -- A cada 1 segundo quantos aumentar de vida


                        local combat = createCombatObject()
                        setCombatParam(combat, COMBAT_PARAM_AGGRESSIVE, 0)
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
                        setCombatCondition(combat, condition)
                             
                        local condition = createConditionObject(CONDITION_HASTE)
                        setConditionParam(condition, CONDITION_PARAM_SPEED, 250)
                        setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
                        setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
                        setCombatCondition(combat, condition)
                             
                        local condition = createConditionObject(CONDITION_REGENERATION)
                        setConditionParam(condition, CONDITION_PARAM_SUBID, 1)
                        setConditionParam(condition, CONDITION_PARAM_BUFF, TRUE)
                        setConditionParam(condition, CONDITION_PARAM_TICKS, tempo*1000)
                        setConditionParam(condition, CONDITION_PARAM_HEALTHGAIN, health)
                        setConditionParam(condition, CONDITION_PARAM_HEALTHTICKS, 1000)
                        setCombatCondition(combat, condition)

   doPlayerSendTextMessage(cid,18,"coco!" ) 

     


return true
end

