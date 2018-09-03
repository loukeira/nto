
---Script by mock the bear
function doCopyItem(item,pos) ---Script by mock the bear
  for i=1,6 do
      pos.z = pos.z+1
      if hasSqm(pos) and getSqmId(pos).itemid ~= 10217 then
            local i = doCreateItem(item.itemid,item.type,pos)
            if item.actionid ~= 0 then
              doSetItemActionid(i,item.actionid)
            end
            doSendMagicEffect(pos,9)
            return i
      else
        local p2 = {x=pos.x+1,y=pos.y+1,z=pos.z}
        doSendDistanceShoot(pos,p2,40)
        doSendMagicEffect(pos,2)
      end
  end
end
function onAddItem(item,pos,k) ---Script by mock the bear
  doCopyItem(item,k)
  doRemoveItem(item.uid,item.type == 0 and 1 or item.type)
end
function onStepIn(cid, item, position, fromPosition) ---Script by mock the bear
  local dir = {
  [30004] = {0,6,7},
  [30007] = {7,0,6,1,5},
  [30008] = {1,5,7},
  [30009] = {5,4,2,1,7},
  [30006] = {2,5,4},
  [30003] = {4,3,6,2,5},
  [30002] = {3,4,6},
  [30001] = {6,0,7,3,4},
  }

local from,to = {x=1001, y=705, z=7},{x=1031, y=737, z=7} -- começo e final do mapa
local from2,to2 = {x=1011, y=705, z=6},{x=1031, y=738, z=6} -- começo e final do mapa
local from3,to3 = {x=1012, y=706, z=5},{x=1032, y=739, z=5} -- começo e final do mapa
local from4,to4 = {x=985, y=598, z=7},{x=1044, y=652, z=7} -- começo e final do mapa
local from5,to5 = {x=986, y=615, z=6},{x=1039, y=647, z=7} -- começo e final do mapa
local from6,to6 = {x=990, y=616, z=5},{x=1040, y=647, z=5} -- começo e final do mapa
if isInRange(getCreaturePosition(cid), from, to) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) or isInRange(getCreaturePosition(cid), from5, to5) or isInRange(getCreaturePosition(cid), from6, to6) then
doPlayerSendCancel(cid, "Você não pode se Transformar nesta área!") return true
end

  if isPlayer(cid) then
      local chkps = {x=position.x,y=position.y,z=position.z}
      local ig = false
      for i,b in pairs(dir[item.actionid]) do
        local nw = getPosByDir(chkps,b)
        local g = getTileThingByPos(nw)
        if hasSqm3(nw) or g.itemid == CONST_FLYVOID or nw.x < 35 or nw.y < 35 then
            ig = true
            break
        end
      end

local from,to = {x=1001, y=705, z=7},{x=1031, y=737, z=7} -- começo e final do mapa
local from2,to2 = {x=1011, y=705, z=6},{x=1031, y=738, z=6} -- começo e final do mapa
local from3,to3 = {x=1012, y=706, z=5},{x=1032, y=739, z=5} -- começo e final do mapa
local from4,to4 = {x=985, y=598, z=7},{x=1044, y=652, z=7} -- começo e final do mapa
local from5,to5 = {x=986, y=615, z=6},{x=1039, y=647, z=7} -- começo e final do mapa
local from6,to6 = {x=990, y=616, z=5},{x=1040, y=647, z=5} -- começo e final do mapa
if isInRange(getCreaturePosition(cid), from, to) or isInRange(getCreaturePosition(cid), from2, to2) or isInRange(getCreaturePosition(cid), from3, to3) or isInRange(getCreaturePosition(cid), from4, to4) or isInRange(getCreaturePosition(cid), from5, to5) or isInRange(getCreaturePosition(cid), from6, to6) then
doPlayerSendCancel(cid, "Você não pode se Transformar nesta área!") return true
end

      if not ig then
        deletarEmVolta(fromPosition)
        gerarEmVolta(getCreaturePosition(cid))
      else
        doTeleportThing(cid,fromPosition,false)
        doPlayerSendTextMessage(cid,27, "Sorry, you cannot fly here.")
      end
  end
end
function onStepOut(cid, item, position, fromPosition,q)
  addEvent(function(pos) if fly.checkAround(pos) then deletarEmVolta(pos) end end,10000,position)
end