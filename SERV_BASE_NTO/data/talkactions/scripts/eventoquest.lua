local config = {
storage = 5858, -- Não mexa aqui! 
time = 400, -- tempo em segundos que será criada a parede 
pos = {x=1016,y=890,z=7},
paredeid = 1536, -- id da parede 
} 
local position = {
x = 1010,y = 890,z = 7 -- pos em que o jogador precisa estar para falar
} 
 
function onSay(cid, words, param, channel) 
function criar() 
doCreateItem(config.paredeid, 1, config.pos)
end 
local parede = getTileItemById(config.pos, config.paredeid)
local pos,area = getCreaturePosition(cid)
if (pos.z) and (pos.x) and (pos.y) then 
if parede then
if getGlobalStorageValue(config.storage) <= os.time() then 
doBroadcastMessage("[evento] box misteriosa foi aberto em 5 minutos se fexara")
doRemoveItem(parede.uid, 1)
setGlobalStorageValue(config.storage,os.time()+config.time+5) 
addEvent(criar, config.time*1000)
else
doPlayerSendCancel(cid, "A entrada já foi removida.")
return TRUE
end
end
end
end