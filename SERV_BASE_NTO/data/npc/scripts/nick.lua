local focus = 0
local talk_start = 0
local conv = 0
local target = 0
local following = false
local attacking = false
local talkState = {}
local finalname = ""

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

function onCreatureSay(cid, type, msge)
local msg = string.lower(msge)
local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid


	if focus == cid then
		talk_start = os.clock()
	end

local auras = {"red aura", "blue aura", "green aura", "yellow aura", "white aura", "gray aura", "cyan aura", "purple aura", "orange aura"}


if (msgcontains(msg, 'hi') and (focus == 0) and (getDistanceToCreature(cid) <= 4)) then

	focus = cid
	conv = 1
	talk_start = os.clock()
	selfSay("Hello, "..getCreatureName(cid).."! I can give your pokemon a nickname or i can put in your pokemon a elemental aura, if he is boosted at least +50...")

elseif (msgcontains(msg, "no") or msgcontains(msg, "bye")) and focus == cid and conv ~= 3 then

	selfSay("No problem then, sir. Come back when you feel like it!")
	focus = 0

elseif (msgcontains(msg, "nick") or msgcontains(msg, "nickname")) and focus == cid and conv == 1 then

		if getPlayerSlotItem(cid, 8).uid <= 0 then
			selfSay("Sorry, you don't have a pokemon in the main slot!")
			focus = 0
		return true
		end

	selfSay("Put your pokemon at the main slot and tell me, what nickname would you like me to give to your pokemon?")
	conv = 3
	
elseif msgcontains(msg, "aura") and focus == cid and conv == 1 then

     if getPlayerSlotItem(cid, 8).uid <= 0 then
        selfSay("Sorry, you don't have a pokemon in the main slot!")
        focus = 0
     return true
     end
     
     local pb = getPlayerSlotItem(cid, 8).uid
     if not getItemAttribute(pb, "boost") or getItemAttribute(pb, "boost") < 50 then
        selfSay("Sorry, your pokemon is not boosted +50!")
        focus = 0
     return true
     end  
     
     if getItemAttribute(pb, "aura") and getItemAttribute(pb, "aura") ~= "" then
        selfSay("Sorry, your pokemon already have a elemental aura!")
        focus = 0
     return true
     end 
     
     if #getCreatureSummons(cid) >= 1 then 
        selfSay("Return your pokemon for your pokeball!")
        focus = 0
     return true
     end       
          
     selfSay("You can choose one of these auras: red aura, blue aura, green aura, yellow aura, white aura, gray aura, cyan aura, purple aura, orange aura. Which one do you prefer?")
     conv = 9
     
elseif isInArray(auras, msg) and focus == cid and conv == 9 then

       selfSay("Are you sure that you want to put a "..msg.." in your pokemon?")
       conv = 11 
       local d, e = msg:find('(.-) aura')
	   auraFinal = string.sub(msg, d -1, e - 5)
	   
elseif msgcontains(msg, "yes") and focus == cid and conv == 11 then        

     if getPlayerSlotItem(cid, 8).uid <= 0 then
        selfSay("Sorry, you don't have a pokemon in the main slot!")
        focus = 0
     return true
     end
     
     local pb = getPlayerSlotItem(cid, 8).uid
     if not getItemAttribute(pb, "boost") or getItemAttribute(pb, "boost") < 50 then
        selfSay("Sorry, your pokemon is not boosted +50!")
        focus = 0
     return true
     end
     
     if #getCreatureSummons(cid) >= 1 then 
        selfSay("Return your pokemon for your pokeball!")
        focus = 0
     return true
     end   
     
     doItemSetAttribute(pb, "aura", auraFinal)   
     selfSay("Done! Now your pokemon have a new elemental aura. Enjoy it!")
	 focus = 0
	 conv = 0
       
elseif conv == 3 and focus == cid then

	local tablee = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "x", "w", "y", "z", ".", ":", "'", '"', "~", "^", "@", "#", "$", "%", "&", "*", "(", ")", "-", "+", "_", "?", ">", "<", "•", ";", "°", "¹", "²", "³", "£", "¢", "¬", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}
	local table = {"'", '"', "!", "ã", "õ", "ç", "´", "`", "á", "à", "ó", "ò", "é", "è", "í", "ì", "ú", "ù", "¹", "²", "³", "£", "¢", "¬", "§", "°", "º", "ª", "•", "|"}

	for a = 1, #table do
		if string.find(msg, table[a]) then
			selfSay("Sorry, the nick has invalid symbols.")
		return true
		end
	end

	if string.len(msg) <= 1 or string.len(msg) >= 19 then
		selfSay("Sorry, that nick is too long or too short!")
	return true
	end

	local pokename = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke")


	selfSay("Are you sure that you want to change your's "..pokename.." name to \""..msge.."\"? This is going to cost you 10 hundred dollars.")
	conv = 5
	finalname = msge

elseif msgcontains(msg, "yes") and focus == cid and conv == 5 then

	if getPlayerSlotItem(cid, 8).uid <= 0 then
		selfSay("Where is your pokemon?! You have to keep it at the main slot!")
		focus = 0
	return true
	end


	local nick = ""..finalname..""
	local description = "Contains a "..getItemAttribute(getPlayerSlotItem(cid, 8).uid, "poke").."."
	selfSay("Done! Your pokemon now has a new name, enjoy it!")
	doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "nick", nick)
	local newdes = description.."\nIt's nickname is: "..finalname.."."
	doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "description", newdes)
	local hp = getItemAttribute(getPlayerSlotItem(cid, 8).uid, "happy")
	doItemSetAttribute(getPlayerSlotItem(cid, 8).uid, "happy", hp + 25)
	if #getCreatureSummons(cid) >= 1 then
		adjustStatus(getCreatureSummons(cid)[1], getPlayerSlotItem(cid, 8).uid)
	end
	focus = 0
	conv = 0
	end
end
 
local intervalmin = 38
local intervalmax = 70
local delay = 25
local number = 1
local messages = {"Want to give some nicknames to your pokemon? Talk to me!",
		  "Did you know your pokemon gets a little happier when you give him a nickname?",
		  "Every pokemon wants to have a nickname! Come talk to me!",
		  "Pokemons love nicknames, you should give yours one.",
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

		if (os.clock() - talk_start) > 45 then
			focus = 0
			selfSay("Come back some other time!")
		end

		if getDistanceToCreature(focus) > 3 then
			selfSay("Enjoy!")
			focus = 0
		return true
		end

		local dir = doDirectPos(npcpos, focpos)	
		selfTurn(dir)
	end


return true
end