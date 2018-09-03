local NPCBattle = {
["Brock"] = {artig = "He is", cidbat = "Pewter"},
["Misty"] = {artig = "She is", cidbat = "Cerulean"}, 
["Blaine"] = {artig = "He is", cidbat = "Cinnabar"},
["Sabrina"] = {artig = "She is", cidbat = "Saffron"},         --alterado v1.9 \/ peguem tudo!
["Kira"] = {artig = "She is", cidbat = "Viridian"},
["Koga"] = {artig = "He is", cidbat = "Fuchsia"},
["Erika"] = {artig = "She is", cidbat = "Celadon"},
["Surge"] = {artig = "He is", cidbat = "Vermilion"},
}
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
	  local heldname1 = {}
	  local heldname2 = {}
	  local heldname3 = {}

function onLook(cid, thing, position, lookDistance)                                                         
local str = {}                                            
if not isCreature(thing.uid) then
   local iname = getItemInfo(thing.itemid)
   local ditto = getItemAttribute(thing.uid, "ehditto")
   if isPokeball(thing.itemid) and getItemAttribute(thing.uid, "poke") then 
      unLock(thing.uid)
      local lock = getItemAttribute(thing.uid, "lock")        
      local pokename = getItemAttribute(thing.uid, "poke")
	  local boost = getItemAttribute(thing.uid, "boost") or 0
	  local held1 = getItemAttribute(thing.uid, "attackheld") or 0
	  local held2 = getItemAttribute(thing.uid, "defheld") or 0
	  local held3 = getItemAttribute(thing.uid, "regenheld") or 0
	  if held1 == 1 then
	  heldname1 = "Held 1: X-Attack"
	  else
	  heldname1 = "Held 1: Vazio"
	  end
	  if held2 == 1 then
	  heldname2 = "Held 2: X-Defense"
	  else
	  heldname2 = "Held 2: Vazio"
	  end
	  if held3 == 1 then
	  heldname3 = "Held 3: X-Regeneration"
	  else
	  heldname3 = "Held 3: Vazio"
	  end
      table.insert(str, "You see "..iname.article.." "..iname.name..".")   
      if getItemAttribute(thing.uid, "unique") then               
         table.insert(str, " It's an unique item.")   
      end
      if not pokesPrice[pokename] then
	  if ditto == 1 then
	  table.insert(str, "\nIt contains "..getArticle(pokename).." "..pokename.."(Ditto). Price: unsellable.\n")
	  else
	  table.insert(str, "\nIt contains "..getArticle(pokename).." "..pokename..". Price: unsellable.\n")
	  end
     else
	 local precocerto = ((pokesPrice[pokename].price) + (((gastostones[boost] * 5) * (100000 * 0.01))) + ((held1 * 0.1) * 10000000) + ((held2 * 0.1) * 10000000)+ ((held3 * 0.1) * 10000000))
if ditto then 
table.insert(str, "\nIt contains "..getArticle(pokename).." "..pokename.."(Ditto). Price: $"..precocerto..".\n")
else
table.insert(str, "\nIt contains "..getArticle(pokename).." "..pokename..". Price: $"..precocerto..".\n") 
end	  
	  end  
      if lock and lock > 0 then
         table.insert(str, "It will unlock in ".. os.date("%d/%m/%y %X", lock)..".\n")  
      end
      local boost = getItemAttribute(thing.uid, "boost") or 0
      if boost > 0 then
         table.insert(str, "Boost level: +"..boost..".\n")
      end
      if getItemAttribute(thing.uid, "nick") then
         table.insert(str, "It's nickname is: "..getItemAttribute(thing.uid, "nick")..".\n")
      end
		 if getItemAttribute(thing.uid, "attackheld") ~= -1 or getItemAttribute(thing.uid, "defheld") ~= -1 or getItemAttribute(thing.uid, "regenheld") ~= -1 then
         table.insert(str, ""..heldname1..". "..heldname2..". "..heldname3..".\n")
		 else
		 table.insert(str, "Nao possui nenhum held.\n")
      end
      if getItemAttribute(thing.uid, "gender") == SEX_MALE then
         table.insert(str, "It is male.")
      elseif getItemAttribute(thing.uid, "gender") == SEX_FEMALE then
         table.insert(str, "It is female.")
      else
         table.insert(str, "It is genderless.")
      end
      doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
      return false
      
   elseif string.find(iname.name, "fainted") or string.find(iname.name, "defeated") then     

      table.insert(str, "You see a "..string.lower(iname.name)..". ")     
      if isContainer(thing.uid) then
         table.insert(str, "(Vol: "..getContainerCap(thing.uid)..")")
      end
      table.insert(str, "\n")
      if getItemAttribute(thing.uid, "gender") == SEX_MALE then
         table.insert(str, "It is male.")
      elseif getItemAttribute(thing.uid, "gender") == SEX_FEMALE then
         table.insert(str, "It is female.")
      else
         table.insert(str, "It is genderless.")
      end
      doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
      return false

   elseif isContainer(thing.uid) then     --containers

      if iname.name == "dead human" and getItemAttribute(thing.uid, "pName") then
         table.insert(str, "You see a dead human (Vol:"..getContainerCap(thing.uid).."). ")
         table.insert(str, "You recognize ".. getItemAttribute(thing.uid, "pName")..". ".. getItemAttribute(thing.uid, "article").." was killed by a ")
         table.insert(str, getItemAttribute(thing.uid, "attacker")..".")
      else   
         table.insert(str, "You see "..iname.article.." "..iname.name..". (Vol:"..getContainerCap(thing.uid)..").")
      end
      if getPlayerGroupId(cid) >= 4 and getPlayerGroupId(cid) <= 6 then
         table.insert(str, "\nItemID: ["..thing.itemid.."]")     
         local pos = getThingPos(thing.uid)
         table.insert(str, "\nPosition: [X: "..pos.x.."][Y: "..pos.y.."][Z: "..pos.z.."]")  
      end
      doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
      return false
      
   elseif getItemAttribute(thing.uid, "unique") then    
      local p = getThingPos(thing.uid)
   
      table.insert(str, "You see ")
      if thing.type > 1 then
         table.insert(str, thing.type.." "..iname.plural..".")
      else
         table.insert(str, iname.article.." "..iname.name..".")
      end
      table.insert(str, " It's an unique item.\n"..iname.description)
      
      if getPlayerGroupId(cid) >= 4 and getPlayerGroupId(cid) <= 6 then
         table.insert(str, "\nItemID: ["..thing.itemid.."]")
         table.insert(str, "\nPosition: ["..p.x.."]["..p.y.."]["..p.z.."]")
      end
   
      sendMsgToPlayer(cid, MESSAGE_INFO_DESCR, table.concat(str))
      return false
   else
      return true
   end
   end

local npcname = getCreatureName(thing.uid)
if ehNPC(thing.uid) and NPCBattle[npcname] then    --npcs duel
   table.insert(str, "You see "..npcname..". "..NPCBattle[npcname].artig.." leader of the gym from "..NPCBattle[npcname].cidbat..".")
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
   return false
end
if getPlayerStorageValue(thing.uid, 697548) ~= -1 then    
   table.insert(str, getPlayerStorageValue(thing.uid, 697548))                                   
   local pos = getThingPos(thing.uid)
   if youAre[getPlayerGroupId(cid)] then
      table.insert(str, "\nPosition: [X: "..pos.x.."][Y: "..pos.y.."][Z: "..pos.z.."]")
   end
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))  
   return false
end

if not isPlayer(thing.uid) and not isMonster(thing.uid) then    --outros npcs
   table.insert(str, "You see "..getCreatureName(thing.uid)..".")
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
   return false
end

if isPlayer(thing.uid) then     --player
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, getPlayerDesc(cid, thing.uid, false))  
return false
end

if getCreatureName(thing.uid) == "Evolution" then return false end

if not isSummon(thing.uid) then   --monstros
   
   table.insert(str, "You see a wild "..string.lower(getCreatureName(thing.uid))..".\n")
   table.insert(str, "Hit Points: "..getCreatureHealth(thing.uid).." / "..getCreatureMaxHealth(thing.uid)..".\n")
   if getPokemonGender(thing.uid) == SEX_MALE then
      table.insert(str, "It is male.")
   elseif getPokemonGender(thing.uid) == SEX_FEMALE then
      table.insert(str, "It is female.")
   else
      table.insert(str, "It is genderless.")
   end
   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
   return false

elseif isSummon(thing.uid) and not isPlayer(thing.uid) then  --summons

   local boostlevel = getItemAttribute(getPlayerSlotItem(getCreatureMaster(thing.uid), 8).uid, "boost") or 0
   if getCreatureMaster(thing.uid) == cid then
      local myball = getPlayerSlotItem(cid, 8).uid
      table.insert(str, "You see your "..string.lower(getCreatureName(thing.uid))..".")
      if boostlevel > 0 then
         table.insert(str, "\nBoost level: +"..boostlevel..".")
      end
      table.insert(str, "\nHit points: "..getCreatureHealth(thing.uid).."/"..getCreatureMaxHealth(thing.uid)..".")
      table.insert(str, "\n"..getPokemonHappinessDescription(thing.uid))
      doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, table.concat(str))
   else
      doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You see a "..string.lower(getCreatureName(thing.uid))..".\nIt belongs to "..getCreatureName(getCreatureMaster(thing.uid))..".")
   end
   return false
end
return true
end