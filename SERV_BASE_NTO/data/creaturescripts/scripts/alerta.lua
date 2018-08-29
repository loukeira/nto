function onLogin(cid)
if getPlayerGroupId(cid) > 5 then
if getGlobalStorageValue(28212) == 0 then
doShowTextDialog(cid, 1952, "1 player reportaram para ver o report abra o log de reports")
setGlobalStorageValue(28212, -1)
return true
end
if getGlobalStorageValue(28212) ~= -1 then
doShowTextDialog(cid, 1952, ""..getGlobalStorageValue(28212).." player reportaram para ver o report abra o log de reports")
setGlobalStorageValue(28212, -1)
return true
end
return true
end
return true
end