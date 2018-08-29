local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function doBuyPokemonWithCasinoCoins(cid, poke) npcHandler:onSellpokemon(cid) end
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)

if(not npcHandler:isFocused(cid)) then
return false
end

-----------------------------------
--id dos itens{Trace of ghost, Ice orb, Gosme, Pot of Lava, Electric box, Ruby, Water pendant, Belt of champion, Bug venom, Bug antena}
local itens = {12194, 12204, 12201, 12202, 12152, 12176, 12188, 12170, 12195, 12185, 12184} 
---------
local function checkDex(cid)
local unlock = 0
	for i = 1, #oldpokedex do
		if getPlayerInfoAboutPokemon(cid, oldpokedex[i][1]).dex then
		unlock = unlock + 1
		end
	end
return unlock
end
--------------
local function checkFosseis(cid)
local poke = ""

for a = 1138, 1142 do
    if not getPlayerInfoAboutPokemon(cid, oldpokedex[a-1000][1]).dex then
       if a == 1142 then
          poke = poke..oldpokedex[a-1000][1].."."
       else
          poke = poke..oldpokedex[a-1000][1]..", "
       end
    end       
end
return poke
end
--------------
local function checkItens(cid, itens)
local check = 0
    for i = 1, #itens do
        if getPlayerItemCount(cid, itens[i]) >= 10 then
           check = check + 1
        end       
    end
return check
end
-------------------------------------
if getPlayerStorageValue(cid, 659875) == 6 then
   selfSay("You already completed my missions...", cid)
   talkState[cid] = 0
   return false 
end   

if msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659875) == -1 then
    selfSay("You need catch atleast 30 pokemons, can you do it?", cid)
    talkState[cid] = 1

elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[cid] == 1 and getPlayerStorageValue(cid, 659875) == -1 then
local list = getCatchList(cid)
   if #list >= 30 then 
      selfSay("Thank you very much, let me know if you want another mission...", cid)
      setPlayerStorageValue(cid, 659875, 1)
   else
      selfSay("You haven't caught 30 pokemons yet, come back when you do that...", cid)
      talkState[cid] = 0
      return true
   end
   
elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659875) == 1 then
       selfSay("You need atleast 50 pokemons in your pokedex, can you do it?", cid)
       talkState[cid] = 2
       
elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[cid] == 2 and getPlayerStorageValue(cid, 659875) == 1 then

local check = checkDex(cid)
	if check >= 50 then
       selfSay("Thank you very much, let me know if you want another mission...", cid)
       setPlayerStorageValue(cid, 659875, 2)
    else
       selfSay("You haven't 50 pokemons in your pokedex yet, come back when you do that...", cid)
       talkState[cid] = 0
       return true
    end 

elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659875) == 2 then
       selfSay("You need have Kabuto, Kabutops, Omanyte, Omastar and Aerodactyl in your pokedex can you do it?", cid)
       talkState[cid] = 3
       
elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[cid] == 3 and getPlayerStorageValue(cid, 659875) == 2 then

local check2 = checkFosseis(cid)
       if check2 == "" then
          selfSay("Thank you very much, let me know if you want another mission.", cid)
          setPlayerStorageValue(cid, 659875, 3)
       else
          selfSay("You haven't this pokes in your pokedex yet: "..check2, cid)
          talkState[cid] = 0
          return true
       end
       
elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659875) == 3 then
       selfSay("You need be atleast level 60 and have level 50 of fishing, can you do it?", cid)
       talkState[cid] = 4       

elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[cid] == 4 and getPlayerStorageValue(cid, 659875) == 3 then
       if getPlayerSkill(cid, 6) >= 50 and getPlayerLevel(cid) >= 60 then
          selfSay("Thank you very much, let me know if you want another mission.", cid)
          setPlayerStorageValue(cid, 659875, 4)
       else
          selfSay("You haven't level 50 of fishing or don't have level 60...", cid)
          talkState[cid] = 0
          return true
       end 
          
elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659875) == 4 then
      selfSay("You need 10 Future orb, 10 Trace of ghost, 10 Ice orb, 10 Gosme, 10 Pot of Lava, 10 Electric box, 10 Ruby, 10 Water pendant, 10 Belt of champion, 10 Bug venom, 10 Bug antena, can you bring it?", cid)
      talkState[cid] = 5
  
elseif (msgcontains(msg, 'sim') or msgcontains(msg, 'yes')) and talkState[cid] == 5 and getPlayerStorageValue(cid, 659875) == 4 then

local check3 = checkItens(cid, itens)
    if check3 == #itens then
       for a = 1, #itens do
           doPlayerRemoveItem(cid, itens[a], 10)
       end
       selfSay("Thank you very much, let me know if you want another mission.", cid)
       setPlayerStorageValue(cid, 659875, 5)
    else
       selfSay("You don't have some item which i asked for you...", cid)
       talkState[cid] = 0
       return true
    end      

elseif msgcontains(msg, 'mission') and getPlayerStorageValue(cid, 659875) == 5 then
       selfSay("You need atleast 140 pokemons in your pokedex, can you do it?", cid)
       talkState[cid] = 6
       
elseif (msgcontains(msg, 'yes') or msgcontains(msg, 'sim')) and talkState[cid] == 6 and getPlayerStorageValue(cid, 659875) == 5 then

local check4 = checkDex(cid)
	if check4 >= 140 then
       selfSay("Thank you very much, take it as a reward...", cid)
       setPlayerStorageValue(cid, 659875, 6)
       doPlayerAddItem(cid, 11640, 1) --premio box 3.. altere como quiser...
    else
       selfSay("You haven't 140 pokemons in your pokedex yet, come back when you do that...", cid)
       talkState[cid] = 0
       return true
    end 
    
elseif (msgcontains(msg, 'no') or msgcontains(msg, 'nao')) then
     selfSay("So good bye...", cid)
     talkState[cid] = 0
     return false 
end

end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())