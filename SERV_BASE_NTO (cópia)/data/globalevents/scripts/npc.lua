function onThink(interval, lastExecution, thinkInterval)
local pos = {x=1054,y=913,z=7} -- Local onde aparece o npc
local npc = doCreateNpc("dalk", pos ) -- Altere o (dalk) pelo nome do seu npc.
local nMin = 20 -- tempo em minuto para o npc sumir.
addEvent(doRemoveCreature, nMin*60*1000, npc)
return true
end