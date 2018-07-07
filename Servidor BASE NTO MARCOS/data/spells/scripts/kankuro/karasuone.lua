function onCastSpell(cid, var)

local playerpos = getPlayerPosition(cid)
local health = getCreatureHealth(cid)
local maxhealth = getCreatureMaxHealth(cid)
local MaximoSummon = 5 --- Maximo de Monstros Sumonados!! No Caso So Posso Sumonar 5 Clones

local summons = getCreatureSummons(cid)
if(table.maxn(summons) < MaximoSummon) then -- no summons
local clone = doCreateMonster("karasu one", playerpos)
doConvinceCreature(cid, clone)
setCreatureMaxHealth(clone, maxhealth)
doCreatureAddHealth(clone, health)
doSendMagicEffect(playerpos, 2)
return TRUE
end
end