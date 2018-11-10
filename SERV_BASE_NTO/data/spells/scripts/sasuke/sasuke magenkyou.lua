local storage_unica_dessa_spell = sasukemagenkyou1 -- MUDAR ESSA STORAGE.. CUIDADO COM A SEQUENCIA...
local storage_unica_dessa_spell_2 = sasukemagenkyou2 --MUDAR ESSA STORAGE... CUIDADO COM A SEQUENCIA..
local tempo_de_intervalo_da_effect = 4000  --TEMPO EM MILISEGUNDOS... (2500 = 2,5 SEGUNDOS // 4000 = 4 SEGUNDOS)
local tempo = 20 -- TEMPO DE DURAÇÃO DA MAGIA
local effect = 110 -- effect no player, caso queira apenas 1, basta remover os outros numeros.
local nome_da_magia_que_ira_aparecer_ao_soltar = "MANGEKYOU SHARINGAN!"

     
local ml = 6 -- quantos ira aumentar o skill de ML
local skillfist = 0 -- quantos ira aumentar o skill de Fist
local skillsword = 6 -- quantos ira aumentar o skill de Sword
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

--mudar aqui \/        
function magicEffect007(tempo2, tempo_de_intervalo_da_effect ,effect,cid, storage_unica_dessa_spell, storage_unica_dessa_spell_2)

                        if (isCreature(cid)) then
                        local stor = getPlayerStorageValue(cid,storage_unica_dessa_spell_2)
                        if stor == -1  then
--mudar aqui \/        
addEvent(pararmagicEffect007, tempo2*1000 ,cid, storage_unica_dessa_spell, storage_unica_dessa_spell_2)
                        setPlayerStorageValue(cid, storage_unica_dessa_spell_2,1)
                         end

                        if getPlayerStorageValue(cid, storage_unica_dessa_spell) > 0 and getCreatureCondition(cid, CONDITION_REGENERATION, 1) then
--mudar aqui \/        
addEvent(magicEffect007, tempo_de_intervalo_da_effect ,0,tempo_de_intervalo_da_effect, effect, cid, storage_unica_dessa_spell, storage_unica_dessa_spell_2)
        
                            local position = {x=getPlayerPosition(cid).x , y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
                            doSendMagicEffect(position, effect)  

                            end
                        end
                        end
                          
                    function onCastSpell(cid, var)
                    local position127 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
                    if (getPlayerStorageValue(cid, storage_unica_dessa_spell) ~= 1 or getCreatureCondition(cid, CONDITION_REGENERATION, 1) == false) and (get_buff_on(cid) < 1) then
                        doCombat(cid, combat, var)
                        tempo2 = tempo-1
--mudar aqui \/        
addEvent(magicEffect007, 1000, tempo2, tempo_de_intervalo_da_effect, effect, cid, storage_unica_dessa_spell, storage_unica_dessa_spell_2)

                        setPlayerStorageValue(cid, storage_unica_dessa_spell,1) -- storage verifica transformado, quando = 1 player esta transformado.
                        doCreatureSay(cid, ""..nome_da_magia_que_ira_aparecer_ao_soltar.."", TALKTYPE_MONSTER)
                        doSendMagicEffect(position127, effect)
                    else
                        doPlayerSendCancel(cid, "Sorry, you are transformed.")
                    end
                    end

--mudar aqui \/        
function pararmagicEffect007( cid,storage_unica_dessa_spell,storage_unica_dessa_spell_2 )

--mudar aqui \/        
stopEvent(magicEffect007)
                                 setPlayerStorageValue(cid,storage_unica_dessa_spell,-1)
                                 setPlayerStorageValue(cid,storage_unica_dessa_spell_2,-1)
                    end