function onLook(cid, thing, position, lookDistance)
if isPlayer(thing.uid) then
 if jin.getPlayerBijuu(thing.uid) ~= 0 then
  doPlayerSetSpecialDescription(thing.uid, "\nJinchuuriki de: ["..jin.getPlayerBijuu(thing.uid).."]")
 --else
  --doPlayerSetSpecialDescription(thing.uid, "\nNão é um Jinchuuriki.")
 end
end 
 return true
end

function onDeath(cid)
 if getPlayerStorageValue(cid, jin_StorageTime)-os.time() <= 0 and jin.getPlayerBijuu(cid) ~= 0 then
  jin.doPlayerRemoveJinchuuriki(cid)
 end

return true
end

function onLogin(cid)
registerCreatureEvent(cid, "JinSystemLook")
registerCreatureEvent(cid, "JinSystemDeath")

 if getPlayerStorageValue(cid, jin_StorageTime)-os.time() <= 0 and jin.getPlayerBijuu(cid) ~= 0 then
  jin.doPlayerRemoveJinchuuriki(cid)
 end
return true
end


function onLogout(cid)
 if getPlayerStorageValue(cid, jin_StorageTime)-os.time() <= 0 and jin.getPlayerBijuu(cid) ~= 0 then
  jin.doPlayerRemoveJinchuuriki(cid)
 end
return true
end