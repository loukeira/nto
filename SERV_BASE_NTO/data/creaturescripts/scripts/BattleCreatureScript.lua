function onLogin(cid)
if getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == -1 then
setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, 0)
setGlobalStorageValue(_Lib_Battle_Info.storage_count, 0)
end
registerCreatureEvent(cid, "BattleDeath")
return true
end

function onPrepareDeath(cid, deathList, lastHitKiller, mostDamageKiller)
if getPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage) >= 1 then
setPlayerStorageValue(cid, _Lib_Battle_Info.TeamOne.storage, -1)
setGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage, getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage)-1)
doRemoveCondition(cid, CONDITION_OUTFIT)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[Guerra Ninja] Voce foi Morto!")
if getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage) == 0 then
else
doBroadCastBattle(23,"[Guerra Jinchuriki] ".._Lib_Battle_Info.TeamOne.name.." "..getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage)..")
end
doRemoveCondition(cid, CONDITION_OUTFIT)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "[Guerra Jinchuriki] Voce foi Morto!")
getWinnersBattle(_Lib_Battle_Info.TeamOne.storage)
else
doBroadCastBattle(23,"[Guerra Jinchuriki] ".._Lib_Battle_Info.TeamOne.name.." "..getGlobalStorageValue(_Lib_Battle_Info.TeamOne.storage)..")
end
end
return true
end