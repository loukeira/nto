local energy = {
[1] = {x=getThingPosition(cid).x, y=getThingPosition(cid).y, z=getThingPosition(cid).z},
[2] = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z},
[3] = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y, z=getThingPosition(cid).z},
[4] = {x=getThingPosition(cid).x+1, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z},
[5] = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z},
[6] = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y, z=getThingPosition(cid).z},
[7] = {x=getThingPosition(cid).x-1, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z},
[8] = {x=getThingPosition(cid).x, y=getThingPosition(cid).y+1, z=getThingPosition(cid).z},
[9] = {x=getThingPosition(cid).x, y=getThingPosition(cid).y-1, z=getThingPosition(cid).z}
}


function onUse(cid, item, fromPosition, itemEx, toPosition)

local p = 0
while p ~= 10 do
for i=1, #energy do
doSendMagicEffect(energy[1], 3)
end
p = p+1
end
end
