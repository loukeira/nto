local function doSendMagicEffecte(pos, effect)
	addEvent(doSendMagicEffect, 50, pos, effect)
end

local waters = {11756, 4614, 4615, 4616, 4617, 4618, 4619, 4608, 4609, 4610, 4611, 4612, 4613, 7236, 4614, 4615, 4616, 4617, 4618, 4619, 4620, 4621, 4622, 4623, 4624, 4625, 4665, 4666, 4820, 4821, 4822, 4823, 4824, 4825}
                                                                      
local flie = {'4820', '4821', '4822', '4823', '4824', '4825'}
                                                                   --alterado v1.6 tabelas agora em configuration.lua!
local premium = false

function onStepIn(cid, item, position, fromPosition)
	if getPlayerStorageValue(cid, 64722) == 1 then 
	   return doPlayerSendCancel(cid, "You can't do it while in the Outland!")   --alterado v1.7
    end
if not isPlayer(cid) or isInArray({5, 6}, getPlayerGroupId(cid)) then --alterado v1.9
return true
end
if getPlayerStorageValue(cid, 75846) >= 1 then return true end   --alterado v1.9

if isPlayer(cid) and getCreatureOutfit(cid).lookType == 814 then return false end -- TV

if isPlayer(cid) and not isPremium(cid) and premium == true then
   doTeleportThing(cid, fromPosition, false)
   doPlayerSendCancel(cid, "Only premium members are allowed to surf.")
   return true
end

if getCreatureOutfit(cid).lookType == 316 or getCreatureOutfit(cid).lookType == 648 then
   doSendMagicEffect(fromPosition, 136)
end

if (getPlayerStorageValue(cid, 63215) >= 1 or getPlayerStorageValue(cid, 17000) >= 1) then
return true
end

if #getCreatureSummons(cid) == 0 then
   doPlayerSendCancel(cid, "You need a pokemon to surf.")
   doTeleportThing(cid, fromPosition, false)
   return true
end
                       --alterado v1.6
if (not isInArray(specialabilities["surf"], getPokemonName(getCreatureSummons(cid)[1]))) then 
   doPlayerSendCancel(cid, "This pokemon cannot surf.")
   doTeleportThing(cid, fromPosition, false)
   return true
end

if getPlayerStorageValue(cid, 5700) == 1 then
   doPlayerSendCancel(cid, "You can't do that while is mount in a bike!")
   doTeleportThing(cid, fromPosition, false)
   return true
end

if getPlayerStorageValue(cid, 212124) >= 1 then         --alterado v1.6
   doPlayerSendCancel(cid, "You can't do it with a pokemon with mind controlled!")
   doTeleportThing(cid, fromPosition, false)
   return true
end

if getPlayerStorageValue(cid, 52480) >= 1 then
   doPlayerSendCancel(cid, "You can't do it while a duel!")  --alterado v1.6
   doTeleportThing(cid, fromPosition, false)
   return true
end

if getPlayerStorageValue(cid, 6598754) == 1 or getPlayerStorageValue(cid, 6598755) == 1 then 
   doPlayerSendCancel(cid, "You can't do it while in the PVP Zone!")   --alterado v1.7
   doTeleportThing(cid, fromPosition, false)
   return true
end
                                        --alterado v1.6
doSetCreatureOutfit(cid, {lookType = surfs[getPokemonName(getCreatureSummons(cid)[1])].lookType + 351}, -1) 

doCreatureSay(cid, ""..getPokeName(getCreatureSummons(cid)[1])..", lets surf!", 1)
doChangeSpeed(cid, -(getCreatureSpeed(cid)))

local speed = 75 + PlayerSpeed + getSpeed(getCreatureSummons(cid)[1]) * 8 * speedRate
setPlayerStorageValue(cid, 54844, speed)
doChangeSpeed(cid, speed)

local pct = getCreatureHealth(getCreatureSummons(cid)[1]) / getCreatureMaxHealth(getCreatureSummons(cid)[1])
doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "hp", pct)

doRemoveCreature(getCreatureSummons(cid)[1])

addEvent(setPlayerStorageValue, 100, cid, 63215, 1)

local item = getPlayerSlotItem(cid, 8)
if getItemAttribute(item.uid, "boost") and getItemAttribute(item.uid, "boost") >= 50 and getPlayerStorageValue(cid, 42368) <= 0 then
   addEvent(sendAuraEffect, 120, cid, auraSyst[getItemAttribute(item.uid, "aura")])    --alterado v1.8
end

if useOTClient then
   doPlayerSendCancel(cid, '12//,hide') --alterado v1.8
end

return true
end

local direffects = {30, 49, 9, 51}

function onStepOut(cid, item, position, fromPosition)

if isPlayer(cid) and getCreatureOutfit(cid).lookType == 814 then return false end

	local checkpos = fromPosition
		checkpos.stackpos = 0

	if isInArray(waters, getTileInfo(checkpos).itemid) then
       if getPlayerStorageValue(cid, 63215) >= 1 or getPlayerStorageValue(cid, 17000) >= 1 then
          doSendMagicEffecte(fromPosition, direffects[getCreatureLookDir(cid) + 1])
       end
	end

	if not isInArray(waters, getTileInfo(getThingPos(cid)).itemid) then

		if getPlayerStorageValue(cid, 17000) >= 1 then return true end
		if getPlayerStorageValue(cid, 63215) <= 0 then return true end

		doRemoveCondition(cid, CONDITION_OUTFIT)
		setPlayerStorageValue(cid, 63215, -1)

		local item = getPlayerSlotItem(cid, 8)
		local pokemon = getItemAttribute(item.uid, "poke")
		local x = pokes[pokemon]

		if not x then return true end

		if getItemAttribute(item.uid, "nick") then
			doCreatureSay(cid, getItemAttribute(item.uid, "nick")..", I'm tired of surfing!", 1)
		else
			doCreatureSay(cid, getItemAttribute(item.uid, "poke")..", I'm tired of surfing!", 1)
		end

		doSummonMonster(cid, pokemon)

		local pk = getCreatureSummons(cid)[1]

		if not isCreature(pk) then
			pk = doCreateMonster(pokemon, backupPos)
			if not isCreature(pk) then
				doPlayerSendCancel(cid, "You can't stop surfing here.")
				doTeleportThing(cid, fromPosition, false)
			return true
			end
			doConvinceCreature(cid, pk)
		end

		doChangeSpeed(pk, getCreatureSpeed(cid))
		doChangeSpeed(cid, -getCreatureSpeed(cid))
		doRegainSpeed(cid)      --alterado v1.6
        
		doTeleportThing(pk, fromPosition, false)
		doTeleportThing(pk, getThingPos(cid), true)
		doCreatureSetLookDir(pk, getCreatureLookDir(cid))

		adjustStatus(pk, item.uid, true, false, true)

        if useOTClient then
	       doPlayerSendCancel(cid, '12//,show') --alterado v1.8
        end
        
	end

return true
end