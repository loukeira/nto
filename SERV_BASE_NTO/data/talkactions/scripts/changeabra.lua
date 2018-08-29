function onSay(cid, words, param, channel)   
   local pokechange = getPlayerSlotItem(cid, CONST_SLOT_FEET)   
   if param == "" then
sendMsgToPlayer(cid, 20, "fale !abrachange [light] ou !abrachange [dark]")
  end

     if param == "light" then
	  if (getItemAttribute(pokechange.uid, "poke") ~= "Shiny Abra") then
	    return true
  end
  doItemSetAttribute(pokechange.uid, "poke",  "Light Abra")
  sendMsgToPlayer(cid, 20, "Light Abra!")
  end
      
     if param == "dark" then
	 if (getItemAttribute(pokechange.uid, "poke") ~= "Light Abra") then
	 return true
	 end
doItemSetAttribute(pokechange.uid, "poke",  "Shiny Abra")
  sendMsgToPlayer(cid, 20, "Dark Abra!")
  end
  end  