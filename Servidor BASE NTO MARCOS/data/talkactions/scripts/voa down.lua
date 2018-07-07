
function onSay(cid)--- By moc kthe bear (MTB)

      local time = os.time()
      if time < getPlayerStorageValue(cid, 102054) then
          doPlayerSendCancel(cid, "You are exhausted.")
          return true
      end
      if not fly.using(cid) then
          return false
      end
local from1,to1 = {x=976, y=887, z=7},{x=1071, y=936, z=7},{x=976, y=887, z=6},{x=1071, y=936, z=6} -- area em que vai poder usar
local from2,to2 = {x=976, y=887, z=6},{x=1071, y=936, z=6} -- area em que vai poder usar
local from3,to3 = {x=976, y=887, z=5},{x=1071, y=936, z=5} -- area em que vai poder usar
local from4,to4 = {x=976, y=887, z=4},{x=1071, y=936, z=4} -- area em que vai poder usar
local from5,to5 = {x=976, y=887, z=3},{x=1071, y=936, z=3} -- area em que vai poder usar
local from6,to6 = {x=976, y=887, z=2},{x=1071, y=936, z=2} -- area em que vai poder usar
local from7,to7 = {x=976, y=887, z=1},{x=1071, y=936, z=1} -- area em que vai poder usar
local from8,to8 = {x=976, y=887, z=0},{x=1071, y=936, z=0} -- area em que vai poder usar

if not (isInArea(getCreaturePosition(cid), from1, to1)) and not (isInArea(getCreaturePosition(cid), from2, to2)) and not (isInArea(getCreaturePosition(cid), from3, to3)) and not (isInArea(getCreaturePosition(cid), from4, to4)) and not (isInArea(getCreaturePosition(cid), from5, to5)) and not (isInArea(getCreaturePosition(cid), from6, to6)) and not (isInArea(getCreaturePosition(cid), from7, to7)) then
doPlayerSendCancel(cid, "You can't fly here.")
return true
end

      local pos = getCreaturePosition(cid)
      pos.z = pos.z-1
      if hasSqm(pos) or pos.z < 0 or up.checkAround(pos) then
          doPlayerSendTextMessage(cid,27,'You cannot fly higger.')
          return true
      else
          gerarEmVolta(pos)
          doTeleportThing(cid,pos)
          pos.z = pos.z+1
          deletarEmVolta(pos)
      end
      return true
    end