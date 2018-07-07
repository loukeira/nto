
function onCastSpell(cid, var) --- By moc kthe bear (MTB)

local from,to = {x=976, y=887, z=7},{x=1071, y=936, z=7} -- area em que vai poder usar
local from,to = {x=976, y=887, z=7},{x=1071, y=936, z=6} -- area em que vai poder usar
local from,to = {x=976, y=887, z=7},{x=1071, y=936, z=5} -- area em que vai poder usar
local from,to = {x=976, y=887, z=7},{x=1071, y=936, z=4} -- area em que vai poder usar
local from,to = {x=976, y=887, z=7},{x=1071, y=936, z=3} -- area em que vai poder usar
local from,to = {x=976, y=887, z=7},{x=1071, y=936, z=2} -- area em que vai poder usar
local from,to = {x=976, y=887, z=7},{x=1071, y=936, z=1} -- area em que vai poder usar
local from,to = {x=976, y=887, z=7},{x=1071, y=936, z=0} -- area em que vai poder usar

if not isInRange(getCreaturePosition(cid), from, to) then
doPlayerSendCancel(cid, "You can't fly here.")
return false
end
      local time = os.time()
      if time < getPlayerStorageValue(cid, 102054) then
          doPlayerSendCancel(cid, "You are exhausted.")
          return false
      end
      if not fly.using(cid) then
          return false
      end
      local pos = getCreaturePosition(cid)
      pos.stackpos = 0
      local g = getTileThingByPos(pos)
      pos.z = pos.z+1
      local f = getTileThingByPos(pos)
      if getSqmId(getCreaturePosition(cid)).itemid ~= CONST_FLYVOID
          or down.checkAround(pos)
          or (g.itemid ~= CONST_FLYVOID and f.itemid ~= CONST_FLYVOID and f.itemid ~= 0 and f.itemid ~= 1)
          or (not isWalkable(pos,true,false,false) and hasSqm(pos))
          or (hasSqm(pos) and not getTileHouseInfo(pos)) == 0 then
          doPlayerSendTextMessage(cid,27,'You cannot go to down here.')
          return false
      else
          down.gerarEmVolta(pos)
          doTeleportThing(cid,pos)
          pos.z = pos.z-1
          deletarEmVolta(pos)
      end
      return true
    end