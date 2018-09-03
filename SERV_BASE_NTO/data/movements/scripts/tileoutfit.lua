local female = {lookType = 130, lookHead = 79, lookBody = 91, lookLegs = 91, lookFeet = 91, lookTypeEx = 0, lookAddons = 3} -- Outfit Female
local male = {lookType = 130, lookHead = 86, lookBody = 86, lookLegs = 86, lookFeet = 86, lookTypeEx = 0, lookAddons = 3} -- Outfit Male

function onStepIn(cid, item, pos) 
if isPlayer(cid) == TRUE then
if getPlayerSex(cid) == 0 then 
doCreatureChangeOutfit(cid, female)
else
doCreatureChangeOutfit(cid, male) 
end 
doSendMagicEffect(getThingPos(cid), 29) -- Efeito que dara quando o Player Pisar no Tile ou ItemId.
end 
return TRUE 
end