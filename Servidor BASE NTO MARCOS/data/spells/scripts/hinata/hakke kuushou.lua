function getPosfromArea3(cid,area)
icenter = math.floor(table.getn(area)/2)+1
jcenter = math.floor(table.getn(area[1])/2)+1
center = area[icenter]
ivar = table.getn(area)
jvar = table.getn(area[1])
i = table.getn(area)^2
j = table.getn(area[1])^2

   if center[jcenter] == 3 then
                  if getPlayerLookDir(cid) == 0 then
                  signal = {-1,1,1,2}
                  elseif getPlayerLookDir(cid) == 1 then
                  signal = {1,-1,2,1}
                  elseif getPlayerLookDir(cid) == 2 then
                  signal = {1,-1,1,2}
                  else
                  signal = {-1,1,2,1}
                  end
   else
   signal = {-1,1,1,2}
   end

POSITIONS = {}  
P = 0
   
repeat
pvar = {0,0}
I = area[ivar]
J = I[jvar]
i = i-1
j = j-1
   if J == 1 then
                  if jvar < jcenter then  
                  pvar[signal[3]] = signal[1]*math.abs((jcenter-jvar))
                  elseif jvar > jcenter then  
                  pvar[signal[3]] = signal[2]*math.abs((jcenter-jvar))
                  end
                  
                  if ivar < icenter then  
                  pvar[signal[4]] = signal[1]*math.abs((icenter-ivar))
                  elseif ivar > icenter then
                  pvar[signal[4]] = signal[2]*math.abs((icenter-ivar))
                  end
   end    
   if jvar > 1 then
   jvar = (jvar-1)
   elseif ivar > 1 then
   jvar = table.getn(area[1])
   ivar = (ivar-1)
   end  
local pos = getThingPos(cid)
local areapos = {x=pos.x+(pvar[1]),y=pos.y+(pvar[2]),z=pos.z}  
   if pos.x ~= areapos.x or pos.y ~= areapos.y then
   P = P+1
   POSITIONS[P] = areapos
   end   
until i <= 0 and j <= 0

return POSITIONS
end

function doPushCreature3(cid,uid,direction,distance,time)
if isCreature(uid) == TRUE then
    local rand = (2*math.random(0,1))-1
    local rand2 = math.random(-1,0)
    if direction == 0 then
        signal = {0,rand,-rand,rand,-rand,0,-1,-1,-1,0,0,0}
        elseif direction == 1 then
        signal = {1,1,1,0,0,0,0,rand,-rand,rand,-rand,0}
    elseif direction == 2 then
        signal = {0,rand,-rand,rand,-rand,0,1,1,1,0,0,0}
    elseif direction == 3 then
        signal = {-1,-1,-1,0,0,0,0,rand,-rand,rand,-rand,0}
    elseif direction == 4 then
        signal = {-1,rand2,(-rand2)-1,0,1,rand2+1,rand2,0}
    elseif direction == 5 then
        signal = {1,-rand2,-((-rand2)-1),0,1,rand2+1,rand2,0}
    elseif direction == 6 then
        signal = {-1,rand2,(-rand2)-1,0,-1,(-rand2)-1,rand2,0}
    else
        signal = {1,-rand2,-((-rand2)-1),0,-1,(-rand2)-1,rand2,0}
    end
    local pos = getThingPos(uid)
    nsig = #signal
    nvar = 0
    repeat
        nvar = nvar+1
        newpos = {x=pos.x+(signal[nvar]),y=pos.y+(signal[(nsig/2)+nvar]),z=pos.z}
        newtile = {x=newpos.x,y=newpos.y,z=newpos.z,stackpos=0}
    until getTileThingByPos(newtile).uid ~= 0 and hasProperty(getTileThingByPos(newtile).uid,3) == FALSE and queryTileAddThing(uid,newpos) == 1 or nvar == (nsig/2)
    if distance == nil or distance == 1 then
        local hit = math.random((getPlayerLevel(cid) * 0.90 + getPlayerMagLevel(cid) * 1.70) * 1.0,(getPlayerLevel(cid) * 1.00 + getPlayerMagLevel(cid) * 1.80) * 1.0)
        doTeleportThing(uid,newpos,TRUE)        
        doSendMagicEffect(getCreaturePosition(uid), 54) -- 12, effect ao acertar o player.
        if getCreatureHealth(uid) > hit then
            if getCreatureHealth(uid) > 0 then
                doSendAnimatedText(getCreaturePosition(uid), hit, 144)
            end
            doCreatureAddHealth(uid, -hit)
        else
            if getCreatureHealth(uid) > 0 then
                doSendAnimatedText(getCreaturePosition(uid), getCreatureHealth(uid), 144)
            end
            doCreatureAddHealth(uid, -getCreatureHealth(uid))
        end
    else
    distance = distance-1
    doTeleportThing(uid,newpos,TRUE)
        if time ~= nil then
            addEvent(doPushCreature3,time,cid,uid,direction,distance,time)
        else
            addEvent(doPushCreature3,500,cid,uid,direction,distance,500)
        end
    end
end
end

function onCastSpell(cid, words, param)

local function TRES(cid)
local area = {
{0, 0, 0},
{0, 1, 0},
{0, 1, 0},
{0, 1, 0},
{0, 3, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
}

pos = getPosfromArea1(cid,area)
n = 0

while n < #pos do
n = n+1
doSendMagicEffect(pos[n],54)
thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
if isCreature(getThingfromPos(thing).uid) == TRUE then
doPushCreature3(cid, getThingfromPos(thing).uid,getPlayerLookDir(cid))
end
end
end

local function QUATRO(cid)
local area = {
{0, 1, 0},
{0, 1, 0},
{0, 1, 0},
{0, 0, 0},
{0, 0, 0},
{0, 3, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
{0, 0, 0},
}

pos = getPosfromArea1(cid,area)
n = 0

while n < #pos do
n = n+1
doSendMagicEffect(pos[n],54)
thing = {x=pos[n].x,y=pos[n].y,z=pos[n].z,stackpos=253}
if isCreature(getThingfromPos(thing).uid) == TRUE then
doPushCreature3(cid, getThingfromPos(thing).uid,getPlayerLookDir(cid))
end
end
end

addEvent(TRES, 1, cid)
addEvent(QUATRO, 300, cid)
return TRUE
end