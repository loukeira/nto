local focus = 0
local talk_start = 0
local conv = 0
local cost = 0
local pname = ""
local baseprice = 0
local gastostones = {
[0] = 0,
[1] = 1,
[2] = 2,
[3] = 3,
[4] = 4,
[5] = 6,
[6] = 8,
[7] = 10,
[8] = 12,
[9] = 15,
[10] = 18,
[11] = 21,
[12] = 24,
[13] = 28,
[14] = 32,
[15] = 36,
[16] = 40,
[17] = 45,
[18] = 50,
[19] = 55,
[20] = 60,
[21] = 66,
[22] = 72,
[23] = 78,
[24] = 84,
[25] = 91,
[26] = 98,
[27] = 105,
[28] = 112,
[29] = 120,
[30] = 128,
[31] = 136,
[32] = 144,
[33] = 153,
[34] = 162,
[35] = 171,
[36] = 180,
[37] = 190,
[38] = 200,
[39] = 210,
[40] = 220,
[41] = 231,
[42] = 242,
[43] = 253,
[44] = 264,
[45] = 276,
[46] = 288,
[47] = 300,
[48] = 312,
[49] = 325,
[50] = 338,
}
function sellPokemon(cid, name, price)
local ditto = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "ehditto")
	local bp = getPlayerSlotItem(cid, CONST_SLOT_BACKPACK)
    if #getCreatureSummons(cid) >= 1 then
       selfSay("Back your pokemon to do that!")
       focus = 0                                --alterado v1.8
       return true
    end
    local storages = {17000, 63215, 17001, 13008, 5700}   --alterado v1.8
    for s = 1, #storages do
        if getPlayerStorageValue(cid, storages[s]) >= 1 then
           selfSay("You can't do that while is Flying, Riding, Surfing, Diving or mount a bike!") 
           focus = 0 
           return true
        end
    end
    if getPlayerSlotItem(cid, 8).uid ~= 0 then 
	local boosts = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "boost") or 0
	local held1s = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "attackheld") or 0
			local held2s = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "defheld") or 0
			local held3s = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "regenheld") or 0
		local precocertos = (((gastostones[boosts] * 5) * 100000) + (held1s * 100000000) + (held2s * 100000000) + (held3s * 100000000))
       if string.lower(getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")) == string.lower(name) and not ditto then
          if not getItemAttribute(getPlayerSlotItem(cid, 8).uid, "unique") then  --alterado v1.6
             selfSay("Wow! Thanks for this wonderful "..name.."! Take yours "..price.." dollars. Would you like to sell another pokemon?")
             doPlayerAddMoney(cid, (price * 100) + precocertos)
			 doRemoveItem(getPlayerSlotItem(cid, 8).uid, 1)              --alterado v1.6
             doTransformItem(getPlayerSlotItem(cid, CONST_SLOT_LEGS).uid, 2395)
             return true
          end
       end
    end   
       
	for a, b in pairs(pokeballs) do
		local balls = getItemsInContainerById(bp.uid, b.on)
		for _, ball in pairs (balls) do
			local boost = getItemAttribute(ball, "boost") or 0
			local held1 = getItemAttribute(ball, "attackheld") or 0
			local held2 = getItemAttribute(ball, "defheld") or 0
			local held3 = getItemAttribute(ball, "regenheld") or 0
	local precocerto = (((gastostones[boost] * 5) * 100000) + (held1 * 100000000) + (held2 * 100000000) + (held3 * 100000000))
			if string.lower(getItemAttribute(ball, "poke")) == string.lower(name) and not ditto then
				if not getItemAttribute(ball, "unique") then --alterado v1.6
                   selfSay("Wow! Thanks for this wonderful "..getItemAttribute(ball, "poke").."! Take yours "..price.." dollars. Would you like to sell another pokemon?")
				   				   doPlayerAddMoney(cid, (price * 100) + precocerto)
				   doRemoveItem(ball, 1)
	               return true
                end
			end
		end
	end

	selfSay("You don't have a "..name..", make sure it is in your backpack and it is not fainted and it is not in a Unique Ball!")  --alterado v1.6
return false
end

function onCreatureSay(cid, type, msg)

	local msg = string.lower(msg)

	if string.find(msg, "!") or string.find(msg, ",") then
	return true
	end

	if focus == cid then
		talk_start = os.clock()
	end

	if msgcontains(msg, 'hi') and focus == 0 and getDistanceToCreature(cid) <= 3 then
		selfSay('Welcome to my store! I buy pokemons of all species, just tell me the name of the pokemon you want to sell.')
		focus = cid
		conv = 1
		talk_start = os.clock()
		cost = 0
		pname = ""
	return true
	end

	if msgcontains(msg, 'bye') and focus == cid then
		selfSay('See you around then!')
		focus = 0
	return true
	end

	if msgcontains(msg, 'yes') and focus == cid and conv == 4 then
		selfSay('Tell me the name of the pokemon you would like to sell.')
		conv = 1
	return true
	end

	if msgcontains(msg, 'no') and conv == 4 and focus == cid then
		selfSay('Ok, see you around then!')
		focus = 0
	return true
	end

	local common = {"rattata", "caterpie", "weedle", "magikarp"}

	if conv == 1 and focus == cid then
		for a = 1, #common do
			if msgcontains(msg, common[a]) then
				selfSay('I dont buy such a common pokemon!')
			return true
			end
		end
	end

	if msgcontains(msg, 'no') and conv == 3 and focus == cid then
		selfSay('Well, then what pokemon would you like to sell?')
		conv = 1
	return true
	end

	if (conv == 1 or conv == 4) and focus == cid then
		local name = doCorrectPokemonName(msg)
		local pokemon = pokes[name]
		if not pokemon then
			selfSay("Sorry, I don't know what pokemon you're talking about! Are you sure you spelled it correctly?")
		return true
		end

        baseprice = pokesPrice[name].price or math.floor(pokemon.level * 150)  --alterado v1.6

        cost = baseprice
        pname = name
        selfSay("Are you sure you want to sell a "..name.." for "..cost.." dollars + boost + helds?")
        conv = 3       
	end

	if isConfirmMsg(msg) and focus == cid and conv == 3 then
		if sellPokemon(cid, pname, cost) then
			conv = 4
		else
			conv = 1
		end
	return true
	end

end

local intervalmin = 38
local intervalmax = 70
local delay = 25
local number = 1
local messages = {"Buying some beautiful pokemons! Come here to sell them!",
		  "Wanna sell a pokemon? Came to the right place!",
		  "Buy pokemon! Excellent offers!",
		  "Tired of a pokemon? Why don't you sell it to me then?",
		 }

function onThink()

	if focus == 0 then
		selfTurn(1)
			delay = delay - 0.5
			if delay <= 0 then
				selfSay(messages[number])
				number = number + 1
					if number > #messages then
						number = 1
					end
				delay = math.random(intervalmin, intervalmax)
			end
		return true
	else

	if not isCreature(focus) then
		focus = 0
	return true
	end

		local npcpos = getThingPos(getThis())
		local focpos = getThingPos(focus)

		if npcpos.z ~= focpos.z then
			focus = 0
		return true
		end
		if (os.clock() - talk_start) > 70 then
			focus = 0
			selfSay("I have other clients too, talk to me when you feel like selling a pokemon.")
		end

		if getDistanceToCreature(focus) > 3 then
			selfSay("Good bye then and thanks!")
			focus = 0
		return true
		end

		local dir = doDirectPos(npcpos, focpos)	
		selfTurn(dir)
	end


return true
end