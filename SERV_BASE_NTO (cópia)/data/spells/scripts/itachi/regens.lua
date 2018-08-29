function onCastSpell(cid, var)

local min = 20000 -- minimo que vai healar
local max = 35000 -- maximo que vai healar

for _, uid in pairs (getCreatureSummons(cid)) do
doSendMagicEffect(getThingPosition(uid), 5)
doCreatureAddHealth(uid, math.random(min,max))
end  
return TRUE
end