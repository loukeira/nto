local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -140.3, 1, -143.3, 1)

arr = {
{1, 1, 1},
{1, 3, 1},
{1, 1, 1}
}


local area = createCombatArea(arr)
setCombatArea(combat, area)
 
local function onCastSpell1(parameters)
return isCreature(parameters.cid) and doCombat(parameters.cid, combat, parameters.var)
end


function onCastSpell(cid, var)

if getPlayerStorageValue(cid, 13255) < 0 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao possui o poder da nibi.")
return FALSE
end

local parameters = {cid = cid, var = var}

local config = {
[1] = {x=getCreaturePosition(cid).x ,y=getCreaturePosition(cid).y ,z=getCreaturePosition(cid).z},
[2] = {x=getCreaturePosition(cid).x ,y=getCreaturePosition(cid).y+1 ,z=getCreaturePosition(cid).z},
[3] = {x=getCreaturePosition(cid).x+1 ,y=getCreaturePosition(cid).y+1 ,z=getCreaturePosition(cid).z},
[4] = {x=getCreaturePosition(cid).x+2 ,y=getCreaturePosition(cid).y+1 ,z=getCreaturePosition(cid).z},
[5] = {x=getCreaturePosition(cid).x+2 ,y=getCreaturePosition(cid).y ,z=getCreaturePosition(cid).z},
[6] = {x=getCreaturePosition(cid).x+2 ,y=getCreaturePosition(cid).y-1 ,z=getCreaturePosition(cid).z},
[7] = {x=getCreaturePosition(cid).x+1 ,y=getCreaturePosition(cid).y-1 ,z=getCreaturePosition(cid).z},
[8] = {x=getCreaturePosition(cid).x ,y=getCreaturePosition(cid).y-1 ,z=getCreaturePosition(cid).z},
[9] = {x=getCreaturePosition(cid).x+1 ,y=getCreaturePosition(cid).y ,z=getCreaturePosition(cid).z},
}

addEvent(onCastSpell1, 300, parameters)
for i=1, #config do
doSendMagicEffect(config[i], 54)
end
return TRUE
end