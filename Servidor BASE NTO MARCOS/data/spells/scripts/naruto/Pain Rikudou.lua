function onCastSpell(cid, var)
local from,to = {x=962, y=885, z=7},{x=973, y=892, z=7} -- começo e final do mapa
local from2,to2 = {x=979, y=901, z=7},{x=991, y=905, z=7} -- começo e final do mapa
local playerpos = getPlayerPosition(cid)
local position1 = {x=getPlayerPosition(cid).x+1, y=getPlayerPosition(cid).y+1, z=getPlayerPosition(cid).z}
local position2 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local position3 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local position4 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local position5 = {x=getPlayerPosition(cid).x, y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
local MaximoSummon = 1 --- Maximo de Monstros Sumonados!! No Caso So Posso Sumonar 5 Clones

local summons = getCreatureSummons(cid)
if isInRange(getCreaturePosition(cid), from, to) or isInRange(getCreaturePosition(cid), from2, to2) then
doPlayerSendCancel(cid, "Você não pode usar Summons Aqui!") return true
end
if(table.maxn(summons) < MaximoSummon) then -- no summons
local clone = doCreateMonster("Pain Five", playerpos)
local clone1 = doCreateMonster("Pain Four", playerpos)
local clone2 = doCreateMonster("Pain Six", playerpos)
local clone3 = doCreateMonster("Pain Three", playerpos)
local clone4 = doCreateMonster("Pain Two", playerpos)
doConvinceCreature(cid, clone)
doConvinceCreature(cid, clone1)
doConvinceCreature(cid, clone2)
doConvinceCreature(cid, clone3)
doConvinceCreature(cid, clone4)
doSendMagicEffect(position1, 111)
doSendMagicEffect(position2, 111)
doSendMagicEffect(position3, 111)
doSendMagicEffect(position4, 111)
doSendMagicEffect(position5, 111)
return TRUE
end
end