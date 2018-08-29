function onCastSpell(cid, var)
local from,to = {x=962, y=885, z=7},{x=973, y=892, z=7} -- começo e final do mapa
local from2,to2 = {x=979, y=901, z=7},{x=991, y=905, z=7} -- começo e final do mapa
local playerpos = getPlayerPosition(cid)
local cloth = getCreatureOutfit(cid)
local health = getCreatureHealth(cid)
local maxhealth = getCreatureMaxHealth(cid)
local MaximoSummon = 3 --- Maximo de Monstros Sumonados!! No Caso So Posso Sumonar 3 Clones

local summons = getCreatureSummons(cid)
if isInRange(getCreaturePosition(cid), from, to) or isInRange(getCreaturePosition(cid), from2, to2) then
doPlayerSendCancel(cid, "Você não pode usar esse jutsu aqui!") return true
end
if(table.maxn(summons) < MaximoSummon) then -- no summons
local Clone = doCreateMonster("Clone Das Sombras", playerpos)
doConvinceCreature(cid, Clone)
setCreatureMaxHealth(Clone, maxhealth)
doCreatureAddHealth(Clone, health)
doSetCreatureOutfit(Clone, cloth, -1)
return TRUE
end
end