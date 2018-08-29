function onThink(interval, lastExecution)
_Lib_Battle_Days = {
["Monday"] = {
["15:00"] = {players = 9},
["21:00"] = {players = 9}
},
["Wednesday"] = {
["17:00"] = {players = 30}
},
["Thursday"] = {
["11:00"] = {players = 10},
["20:30"] = {players = 20}
}
}
if _Lib_Battle_Days[os.date("%A")] then
hours = tostring(os.date("%X")):sub(1, 5)
tb = _Lib_Battle_Days[os.date("%A")][hours]
if tb and (tb.players % 2 == 0) then
local tp = doCreateItem(5023, 1, _Lib_Battle_Info.tpPos)
doItemSetAttribute(tp, "aid", 45000)
CheckEvent(_Lib_Battle_Info.limit_Time)
doBroadcastMessage("Guerra Jinchuriki Foi Aberto "..tb.players.." Players! Os participantes serao randimicamente escolhidos para os time, serao "..((tb.players)/2).." VS "..((tb.players)/2))
return setGlobalStorageValue(_Lib_Battle_Info.storage_count, tb.players)
end
end
return true
end