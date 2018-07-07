function onSay(cid, words, param, channel)   
   local pokechange = getPlayerSlotItem(cid, CONST_SLOT_FEET)   
   if param == "" then
sendMsgToPlayer(cid, 20, "fale !changepoke male ou !changepoke female")
  end
     if param == "male" then
  doItemSetAttribute(pokechange.uid, "gender", 4)
  sendMsgToPlayer(cid, 20, "AGORA SABAGAÇA É MACHO!")
  end
     if param == "female" then
  doItemSetAttribute(pokechange.uid, "gender", SEX_FEMALE)
  sendMsgToPlayer(cid, 20, "MAIS UM GAY NO MUNDO!")
  end
  end  