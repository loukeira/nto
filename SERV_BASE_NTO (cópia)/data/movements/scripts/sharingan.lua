function onStepIn(cid, item, position, fromPosition)
function doHealthSecond(cid, quanty, delay) -- function by vodka
if not isCreature(cid) then return LUA_ERROR end
doCreatureAddHealth(cid, quanty)
doSendMagicEffect(getCreaturePosition(cid), 182)
doSendAnimatedText(getCreaturePosition(cid), -100, 180)
if delay ~= 0 then addEvent(doHealthSecond, 1000, cid, quanty, delay -1)
elseif delay == 0 then doCreatureSetNoMove(cid, false) end
end
doCreatureSetNoMove(cid, true)
doHealthSecond(cid, -100, 1)
return true
end