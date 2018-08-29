function onCastSpell(cid, var)

local min = 900000 -- minimo que vai healar
local max = 900000 -- maximo que vai healar

if #getCreatureSummons(cid) < 1 then
doPlayerSendCancel(cid, "Voce nao tem summons.")
return FALSE
end

for _, uid in pairs (getCreatureSummons(cid)) do
doSendMagicEffect(getThingPosition(uid), 1)
doCreatureAddHealth(uid, math.random(min,max))
end  
return TRUE
end