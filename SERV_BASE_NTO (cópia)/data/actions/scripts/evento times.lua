function onUse(cid, item, frompos, item2, topos)
local storage = 123456         -- ALTERAR storage usado no sistema
local pos_templo = {x = 1030, y = 916, z = 6} -- ALTERAR posição do templo
local item = 2160 -- ALTERAR item que vai ganhar de premio
local count = 1000   -- ALTERAR quantidade de item que vai ganhar
 
if getPlayerStorageValue(cid, storage) == 4 then
doPlayerSendTextMessage(cid,22,"Você é um Grande Vitorioso, parabens.")
doPlayerAddItem(cid,item,count)
doTeleportThing(cid, pos_templo)
setPlayerStorageValue(cid,storage,-1)
else
doTeleportThing(cid, pos_templo)
end
 
end