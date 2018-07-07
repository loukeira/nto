function onCastSpell(cid, var)

local playerpos = getPlayerPosition(cid)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
local position2 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local MaximoSummon = 1 --- Maximo de Monstros Sumonados!! No Caso So Posso Sumonar 5 Clones

local summons = getCreatureSummons(cid)
if(table.maxn(summons) < MaximoSummon) then -- no summons
local clone = doCreateMonster("Katsuyu", playerpos)
doConvinceCreature(cid, clone)
doSendMagicEffect(position1, 152)
doSendMagicEffect(position2, 111)
doPlayerSendTextMessage(cid,27,'Kuchyose no Jutsu.') 
return TRUE
end
end