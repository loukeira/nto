function onSay(cid, words, param)

        if words == "!twitt" then
                if getGlobalStorageValue(30070) == -1 then
                        db.executeQuery("ALTER TABLE `players` ADD twits VARCHAR(255) NOT NULL DEFAULT 'twitter';")
                        setGlobalStorageValue(30070, 1)
                end
                if param == "" then
                        doPlayerSendCancel(cid, "Param required.")
                        doSendMagicEffect(getCreaturePosition(cid), 2)
                else
                        local datas = db.getResult("SELECT `twits` FROM `players` WHERE `id` = ".. getPlayerGUID(cid) .. ";")
                        local sentense = datas:getDataString("twits") .. "\n" ..  tostring(param) .. " " .. os.date("%c")
                        db.executeQuery("UPDATE `players` SET `twits` = '".. sentense .. "' WHERE `id` = ".. getPlayerGUID(cid) .. ";")
                return TRUE
                end
        end

        if words == "!follow" then
                if param == "" then
                        doPlayerSendCancel(cid, "Param required.")
                        doSendMagicEffect(getCreaturePosition(cid), 2)
                else
                        local id = player_existe(tostring(param)) and getPlayerGUIDByName(tostring(param)) or getPlayerGUID(cid)
                        local datas = db.getResult("SELECT `twits` FROM `players` WHERE `id` = ".. id .. ";")
                        local name = id == getPlayerGUID(cid) and getCreatureName(cid) or param
                        doShowTextDialog(cid, 1951, name .. " " .. datas:getDataString("twits"))
                end
        end

return TRUE
end