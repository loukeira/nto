local i = {
["00:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["01:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["02:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["03:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["04:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["05:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["06:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["07:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["08:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["09:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["10:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["11:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["12:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["13:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["14:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["15:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["16:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["17:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["18:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["19:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["20:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["21:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["22:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["23:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},
["24:00"] = {nome = "Lugia", pos = {x = 161, y = 1803, z = 7}, monster = {"2 Lugia"}},

}

function onThink(interval, lastExecution)
hours = tostring(os.date("%X")):sub(1, 5)
tb = i[hours]
if tb then
doBroadcastMessage(hours .. " - " .. tb.nome .. " Iniciou.")
for _,x in pairs(tb.monster) do
for s = 1, tonumber(x:match("%d+")) do
doSummonCreature(x:match("%s(.+)"), tb.pos)
end
end
end
return true
end