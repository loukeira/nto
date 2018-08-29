local fishing = {
["Magikarp"] = {skill = 0, level = -2},
["Qwilfish"] = {skill = 14, level = 3},
["Vaporeon"] = {skill = 14, level = 2},
["Staryu"] = {skill = 10, level = 6},
["Tentacool"] = {skill = 10, level = 7},
["Goldeen"] = {skill = 10, level = 5},
["Krabby"] = {skill = 10, level = 2},
["Horsea"] = {skill = 10, level = 3},
["Poliwag"] = {skill = 10, level = 2},
["Marill"] = {skill = 13, level = 3},
["Azumarill"] = {skill = 17, level = 16},
["Kingler"] = {skill = 14, level = 14},
["Seaking"] = {skill = 13, level = 11},
["Starmie"] = {skill = 14, level = 20},
["Chinchou"] = {skill = 10, level = 6},
["Poliwhirl"] = {skill = 13, level = 9},
["Seadra"] = {skill = 13, level = 15},
["Lanturn"] = {skill = 14, level = 14},
["Octillery"] = {skill = 15, level = 9},
["Corsola"] = {skill = 15, level = 16},
["Blastoise"] = {skill = 17, level = 16},
["Tentacruel"] = {skill = 17, level = 16},
["Mantine"] = {skill = 17, level = 16},
["Gyarados"] = {skill = 17, level = 16},
["Kingdra"] = {skill = 17, level = 16},
["Brave Blastoise"] = {skill = 23, level = 100},
["Tribal Feraligatr"] = {skill = 23, level = 100},
["War Gyarados"] = {skill = 23, level = 100},
["Ancient Kingdra"] = {skill = 23, level = 100},
}
local storage = 15458
local bonus = 1
local limite = 100

local function doFish(cid, pos, ppos, chance, interval, number)
      if not isCreature(cid) then return false end
      if getThingPos(cid).x ~= ppos.x or getThingPos(cid).y ~= ppos.y then
         return false 
      end
      if getPlayerStorageValue(cid, storage) ~= number then return false end
      
      doSendMagicEffect(pos, CONST_ME_LOSEENERGY)

      local peixe = 0
      local playerpos = getClosestFreeTile(cid, getThingPos(cid))
      local fishes = {}
      local randomfish = ""
      
      if getPlayerSkillLevel(cid, 6) < limite then 
	     doPlayerAddSkillTry(cid, 6, bonus)
      end

      for a, b in pairs (fishing) do
	      if getPlayerSkillLevel(cid, 6) >= b.skill then
		     table.insert(fishes, a)
          end
      end

	  if math.random(1, 100) <= chance then
         if getPlayerSkillLevel(cid, 6) < limite then 
		    doPlayerAddSkillTry(cid, 6, bonus)
         end
		 randomfish = fishes[math.random(#fishes)]
	     peixe = doSummonCreature(randomfish, playerpos)
		 if not isCreature(peixe) then
            addEvent(doFish, interval, cid, pos, ppos, chance, interval, number)
		    return true
		 end
	     doSetMonsterPassive(peixe)
	     doWildAttackPlayer(peixe, cid)
	     doCreatureSetLookDir(cid, getDirectionTo(getThingPos(cid), getThingPos(peixe)))  --alterado ver depois
		 if #getCreatureSummons(cid) >= 1 then
 		    doSendMagicEffect(getThingPos(getCreatureSummons(cid)[1]), 173)
			doChallengeCreature(getCreatureSummons(cid)[1], peixe)
  	     else
            doSendMagicEffect(getThingPos(cid), 173)
			doChallengeCreature(cid, peixe)
  	     end
	     return true
      end
      addEvent(doFish, 1000, cid, pos, ppos, chance, interval, number)
return true
end
local waters = {4614, 4615, 4616, 4617, 4618, 4619, 4608, 4609, 4610, 4611, 4612, 4613, 7236, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4665, 4666, 4820, 4821, 4822, 4823, 4824, 4825}

function onSay(cid, words, param, channel)
local position = getCreaturePosition(cid)
local delay = 1000 - getPlayerSkillLevel(cid, 6) * 25
local chance = 1000 + getPlayerSkillLevel(cid, 6) / 1
local geralposd = {x = ((position.x) + 2), y = (position.y), z = (position.z)}
local geralpose = {x = ((position.x) - 2), y = (position.y), z = (position.z)}
local geralposc = {x = (position.x), y = ((position.y) - 2), z = (position.z)}
local geralposb = {x = (position.x), y = ((position.y) + 2), z = (position.z)}
if param == "" then
if isInArray(waters, getTileInfo(geralposd).itemid) then
addEvent(doFish, 2000, cid, geralposd, getCreaturePosition(cid), chance, delay, getPlayerStorageValue(cid, storage))
return true
end
if isInArray(waters, getTileInfo(geralpose).itemid) then
addEvent(doFish, 2000, cid, geralpose, getCreaturePosition(cid), chance, delay, getPlayerStorageValue(cid, storage))
return true
end
if isInArray(waters, getTileInfo(geralposc).itemid) then
addEvent(doFish, 2000, cid, geralposc, getCreaturePosition(cid), chance, delay, getPlayerStorageValue(cid, storage))
return true
end
if isInArray(waters, getTileInfo(geralposb).itemid) then
addEvent(doFish, 2000, cid, geralposb, getCreaturePosition(cid), chance, delay, getPlayerStorageValue(cid, storage))
return true
end
else 
doPlayerSendTextMessage(cid, 20, "A agua deve estar ao seu redor!")
end
end
