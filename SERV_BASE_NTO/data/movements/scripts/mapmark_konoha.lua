function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

  if not isPlayer(cid) then
   return true
  end
  local storage_mapmarks_konoha = 749732

  local id_acc = getPlayerAccountId(cid)
  local sim = acc_stor(cid)

  if (item.actionid == 14101) then
    if (sim == 0) then
            db.query("INSERT INTO `account_storage` (`account_id`, `key`, `value` ) VALUES ("..id_acc..", "..storage_mapmarks_konoha..",1);")
            mapmarks_konoha(cid, type, msg)
            doSendMagicEffect(getCreaturePosition(cid), 3)

    end
  end
 




--// 
 return true
end


