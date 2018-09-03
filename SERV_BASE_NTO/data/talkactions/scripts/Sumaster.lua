function onSay(cid, words, param, channel)
if param == "" then
sendMsgToPlayer(cid, 20, "Fale !infos [pokes], [boost], [fish]")
return true
end
if param == "fish" then
sendMsgToPlayer(cid, 20, "Diga !fish proximo a agua, para pescar.")
end
end
