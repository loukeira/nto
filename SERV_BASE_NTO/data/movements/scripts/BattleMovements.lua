function onStepIn(cid, item, position, fromPosition)
if getPlayerAccess(cid) > 3 then
doTeleportThing(cid, _Lib_Battle_Info.TeamOne.pos) return false
elseif getGlobalStorageValue(_Lib_Battle_Info.storage_count) > 0 then
setGlobalStorageValue(_Lib_Battle_Info.storage_count, getGlobalStorageValue(_Lib_Battle_Info.storage_count)-1)
end
if getGlobalStorageValue(_Lib_Battle_Info.storage_count) >= 0 then
if getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) < getGlobalStorageValue(_Lib_Battle_Info.TeamTwo.storage) then
setPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage, 1)
doAddCondition(cid, conditionBlack)
setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage)+1)
doTeleportThing(cid, _Lib_Battle_Info.TeamOne.pos)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Voce entrou no Time " .. _Lib_Battle_Info.TeamOne.name .. "!")
else
if getGlobalStorageValue(_Lib_Battle_Info.storage_count) == 0 then
removeBattleTp()
doBroadcastMessage("a Batalha Guerra Jinchuriki Esta Aberta Go")
addEvent(doBroadcastMessage, 1*60*1000-500, "Guerra Jinchuriki Iniciada!")
addEvent(OpenWallBattle, 1*60*1000)
end
return true
end