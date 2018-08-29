local posis = {   --[storage da city] = {pos da nurse na city},
[897530] = {x = 1053, y = 1046, z = 7},   --saffron                   --alterado v1.9 TUDO!! \/
[897531] = {x = 1060, y = 900, z = 7},    --cerulean
[897532] = {x = 1204, y = 1042, z = 7},    --lavender
[897533] = {x = 1213, y = 1321, z = 7},    --fuchsia
[897534] = {x = 862, y = 1094, z = 6},    --celadon
[897535] = {x = 705, y = 1086, z = 7},    --viridian
[897536] = {x = 1075, y = 1233, z = 7},    --vermilion
[897537] = {x = 723, y = 847, z = 7},    --pewter
[897538] = {x = 850, y = 1396, z = 7},    --cinnabar
[897539] = {x = 1429, y = 1597, z = 6},    --snow
[897540] = {x = 542, y = 675, z = 7},    --golden
[897541] = {x = 121, y = 1208, z = 7},    --golden
}

function onThingMove(creature, thing, oldpos, oldstackpos)
end

function onCreatureAppear(creature)
end

function onCreatureDisappear(cid, pos)
if focus == cid then
selfSay('Good bye sir!')
focus = 0
talk_start = 0
end
end

function onCreatureTurn(creature)
end

function msgcontains(txt, str)
return (string.find(txt, str) and not string.find(txt, '(%w+)' .. str) and not string.find(txt, str .. '(%w+)'))
end

function onCreatureSay(cid, type, msg)
local msg = string.lower(msg)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

for a, b in pairs(gobackmsgs) do
	local gm = string.gsub(b.go, "doka!", "")
	local bm = string.gsub(b.back, "doka!", "")
if string.find(string.lower(msg), string.lower(gm)) or string.find(string.lower(msg), string.lower(bm)) then
return true
end
end

if((msgcontains(msg, 'hi') or msgcontains(msg, 'heal') or msgcontains(msg, 'help')) and (getDistanceToCreature(cid) <= 3)) then

 	if exhaustion.get(cid, 9211) then
	selfSay('Please wait a few moment before asking me to heal your pokemons again!')
	return true
   	end

	if not getTileInfo(getThingPos(cid)).protection and nurseHealsOnlyInPZ then
		selfSay("Please, get inside the pokémon center to heal your pokemons!")
	return true
	end
	
	if getPlayerStorageValue(cid, 52480) >= 1 then
	   selfSay("You can't do that while in a Duel!")   --alterado v1.6.1
    return true 
    end
    
    for e, f in pairs(posis) do
        local pos = getThingPos(getNpcCid())
        if isPosEqual(pos, f) then
           if getPlayerStorageValue(cid, e) <= -1 then           --alterado v1.7
              setPlayerStorageValue(cid, e, 1)
           end
        end
    end 

	exhaustion.set(cid, 9211, 5)

	doCreatureAddHealth(cid, getCreatureMaxHealth(cid)-getCreatureHealth(cid))
	doCureStatus(cid, "all", true)
	doSendMagicEffect(getThingPos(cid), 132)

	local mypb = getPlayerSlotItem(cid, 8)

	if #getCreatureSummons(cid) >= 1 then

		if not nurseHealsPokemonOut then
			selfSay("Please, return your pokemon to his ball!")
		return true
		end

		local s = getCreatureSummons(cid)[1]
		doCreatureAddHealth(s, getCreatureMaxHealth(s))
		doSendMagicEffect(getThingPos(s), 13)
		doCureStatus(s, "all", false)
		if getPlayerStorageValue(s, 1008) < baseNurseryHappiness then
			setPlayerStorageValue(s, 1008, baseNurseryHappiness)
		end
		if getPlayerStorageValue(s, 1009) > baseNurseryHunger then
			setPlayerStorageValue(s, 1009, baseNurseryHunger)
		end
	else
		if mypb.itemid ~= 0 and isPokeball(mypb.itemid) then  --alterado v1.3
		    doItemSetAttribute(mypb.uid, "hp", 1)
			if getItemAttribute(mypb.uid, "hunger") and getItemAttribute(mypb.uid, "hunger") > baseNurseryHunger then
				doItemSetAttribute(mypb.uid, "hunger", baseNurseryHunger)
			end
			for c = 1, 15 do
				local str = "move"..c
				setCD(mypb.uid, str, 0)
			end
			if getItemAttribute(mypb.uid, "happy") and getItemAttribute(mypb.uid, "happy") < baseNurseryHappiness then
				doItemSetAttribute(mypb.uid, "happy", baseNurseryHappiness)
			end
			if getPlayerStorageValue(cid, 17000) <= 0 and getPlayerStorageValue(cid, 17001) <= 0 and getPlayerStorageValue(cid, 63215) <= 0 then
				for a, b in pairs (pokeballs) do
					if isInArray(b.all, mypb.itemid) then
					   doTransformItem(mypb.uid, b.on)
					end
				end
			end
		end
	end

	local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)

    local balls = getPokeballsInContainer(bp.uid)
    if #balls >= 1 then
       for _, uid in ipairs(balls) do
           doItemSetAttribute(uid, "hp", 1)
           for c = 1, 15 do
               local str = "move"..c
               setCD(uid, str, 0)   
           end
           if getItemAttribute(uid, "hunger") and getItemAttribute(uid, "hunger") > baseNurseryHunger then
              doItemSetAttribute(uid, "hunger", baseNurseryHunger)
           end
           if getItemAttribute(uid, "happy") and getItemAttribute(uid, "happy") < baseNurseryHappiness then
              doItemSetAttribute(uid, "happy", baseNurseryHappiness)
           end
           local this = getThing(uid)
           for a, b in pairs (pokeballs) do
		       if isInArray(b.all, this.itemid) then
	              doTransformItem(uid, b.on)
               end
           end
        end
    end
	setPlayerStorageValue(cid, 64722, 0)
	setPlayerStorageValue(cid, 6412311, 0)
	setPlayerStorageValue(cid, 6598754, -1) 
setPlayerStorageValue(cid, 6598755, -1) 
    selfSay('There you go! You and your pokemons are healthy again.')
    if useKpdoDlls then  --alterado v1.7
       doUpdateMoves(cid)
    end
end
end