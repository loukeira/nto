local function playerAddExp(cid, exp)
	doPlayerAddExp(cid, exp)
	doSendAnimatedText(getThingPos(cid), exp, 215)
end

function onDeath(cid, corpse, deathList)
        
	if isSummon(cid) or not deathList or getCreatureName(cid) == "Evolution" then return true end --alterado v1.8

    -------------Edited Golden Arena-------------------------   
    if getPlayerStorageValue(cid, 22546) == 1 then
       setGlobalStorageValue(22548, getGlobalStorageValue(22548)-1)
       if corpse.itemid ~= 0 then doItemSetAttribute(corpse.uid, "golden", 1) end  --alterado v1.8    
    end   
    if getPlayerStorageValue(cid, 22546) == 1 and getGlobalStorageValue(22548) == 0 then
       local wave = getGlobalStorageValue(22547)
       for _, sid in ipairs(getPlayersOnline()) do
           if isPlayer(sid) and getPlayerStorageValue(sid, 22545) == 1 then
              if getGlobalStorageValue(22547) < #wavesGolden+1 then
                 doPlayerSendTextMessage(sid, 20, "Wave "..wave.." will begin in "..timeToWaves.."seconds!")   
                 doPlayerSendTextMessage(sid, 28, "Wave "..wave.." will begin in "..timeToWaves.."seconds!") 
                 addEvent(creaturesInGolden, 100, GoldenUpper, GoldenLower, false, true, true)
                 addEvent(doWave, timeToWaves*1000)
              elseif getGlobalStorageValue(22547) == #wavesGolden+1 then
                 doPlayerSendTextMessage(sid, 20, "You have win the golden arena! Take your reward!")
                 doPlayerAddItem(sid, 2152, getPlayerStorageValue(sid, 22551)*2)    --premio
                 setPlayerStorageValue(sid, 22545, -1)
                 doTeleportThing(sid, getClosestFreeTile(sid, posBackGolden), false) 
                 setPlayerRecordWaves(sid)
              end
           end
       end
       if getGlobalStorageValue(22547) == #wavesGolden+1 then
          endGoldenArena()
       end
    end   
    ---------------------------------------------------   /\/\
	local givenexp = getWildPokemonExp(cid)  

if givenexp > 0 then
for a = 1, #deathList do
local pk = deathList[a]
---
local list = getSpectators(getThingPosWithDebug(pk), 30, 30, false)
if isCreature(pk) then 
   local expTotal = math.floor(playerExperienceRate * givenexp * getDamageMapPercent(pk, cid))
   local party = getPartyMembers(pk)
   if isInParty(pk) and getPlayerStorageValue(pk, 4875498) <= -1 then
      expTotal = math.floor(expTotal/#party)         
      for i = 1, #party do
          if isInArray(list, party[i]) then
             playerAddExp(party[i], expTotal)
          end
      end
   else
      playerAddExp(pk, expTotal)  
   end       
end
end
end

	if isNpcSummon(cid) then
		local master = getCreatureMaster(cid)
		doSendMagicEffect(getThingPos(cid), getPlayerStorageValue(cid, 10000))
		doCreatureSay(master, getPlayerStorageValue(cid, 10001), 1)
		doRemoveCreature(cid)
	return false
	end

if corpse.itemid ~= 0 then   --alterado v1.8
   doItemSetAttribute(corpse.uid, "level", getPokemonLevel(cid))
   doItemSetAttribute(corpse.uid, "gender", getPokemonGender(cid))  
end
return true
end