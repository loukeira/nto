function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

  if not isPlayer(cid) then
   return true
  end

  local storage_mapmarks_konoha = 749732
  local id_acc = getPlayerAccountId(cid)
  local key, value = acc_stor(cid)

  if (item.actionid == 14101) then
        doPlayerSendTextMessage(cid,18,"key, value: "..key.." "..value.." !")

    if (key == nil)  then
            db.query("INSERT INTO `account_storage` (`account_id`, `key`, `value` ) VALUES ("..id_acc..", "..storage_mapmarks_konoha..",1);")
            mapmarks_konoha(cid, type, msg)
            doSendMagicEffect(getCreaturePosition(cid), 3)
    end

  end
 




--// 
 return true
end


function acc_stor(cid) -- xprank 
    local ult = db.getResult('select `key` , `value` from account_storage where account_id = \''..getPlayerAccountId(cid)..'\' ')

    if (ult:getID() == -1) then
    return false
    end

    local mamae = ult:getDataString("key")
    local papai = ult:getDataString("value")

    ult:free()

    caguei = tonumber(mamae)
    peidei = tonumber(papai)
    return caguei,peidei

end