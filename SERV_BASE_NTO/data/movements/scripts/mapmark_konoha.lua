function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)

  if not isPlayer(cid) then
   return true
  end
  local storage_mapmarks_konoha = 892732

  local id_acc = getPlayerAccountId(cid)

  if (item.actionid == 14101) then
    if getPlayerStorageValue(cid,storage_mapmarks_konoha) == -1 then
            --db.query("INSERT INTO `account_storage` (`account_id`, `key`, `value` ) VALUES ("..id_acc..", "..storage_mapmarks_konoha..",1);")
            mapmarks_konoha(cid, type, msg)
            doSendMagicEffect(getCreaturePosition(cid), 10)
            setPlayerStorageValue(cid,storage_mapmarks_konoha,1)
    end
  end
 




--// 
 return true
end


