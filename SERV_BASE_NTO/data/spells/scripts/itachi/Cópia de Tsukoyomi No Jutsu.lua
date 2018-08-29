local function random(pos)
return {x=pos.x+math.random(-6, 8), y=pos.y+math.random(-4, 5), z=pos.z}
end

local function sendEff(cid, eff, t)
if t > 0 and isCreature(cid) then
local pos = getCreaturePosition(cid)
for i=1, 150 do
doSendMagicEffect(random(pos), eff, cid)
end
addEvent(sendEff, 1000, cid, eff, t-1)
end
end

function onCastSpell(cid, var)
local target = getCreatureTarget(cid)
local eff = 33
local time = 15

local function Remove_NoMove()
doCreatureSetNoMove(target, 0)
end

if not isPlayer(target) then
doPlayerSendCancel(cid, "Apenas em Players XD")
return FALSE
end

doCreatureSetNoMove(target, 1)
sendEff(target, eff, time)
addEvent(Remove_NoMove, time*1000)
return TRUE
end