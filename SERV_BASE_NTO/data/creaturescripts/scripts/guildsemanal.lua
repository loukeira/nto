local minutos = 10
local segundos = 60
local tempototal = minutos*segundos

function onKill(cid, target, lastHit)
if not isPlayer(cid) then return true end
if not isPlayer(target) then return true end


if getPlayerGuildId(cid) == 0 then return true
end

-- -- -- -- -- -- O PLAYER JA TIVER MORRIDO PRA ALGUEM DA GUILD -> RETURN TRUE
-- -- -- -- -- -- SE GET GLOBAL STORAGE VALUE(ID DO PLAYER Q MORREU) < OS.TIME() THEN 
-- -- -- -- -- -- ELSE
-- -- -- -- -- -- SET GLOBAL STORAGE VALUE (ID DO PLAYER Q MORREU, + TEMPO DE 1 HORA)
-- -- -- -- -- -- db.executeQuery("UPDATE `guilds` SET `frags_semana` = `frags_semana` + 5 WHERE `id` = " .. getPlayerGuildId(cid) .. ";")
if getPlayerIp(target) ~= getPlayerIp(cid) then
if isPlayer(target) and isPlayer(cid) then
if getPlayerGuildId(target) ~= getPlayerGuildId(cid) then

    if getPlayerStorageValue(target,getPlayerGuildId(cid)) <= os.time() then

                setPlayerStorageValue(target,getPlayerGuildId(cid), os.time() + tempototal)
                doPlayerSendTextMessage(cid,19,"[GUILD RANK]: A guild "..getPlayerGuildName(cid).." tera q esperar "..minutos.." min pra ganhar pontos em cima de "..getCreatureName(target).." novamente")


                if (getPlayerGuildId(target) ~= 0) then
                     db.executeQuery("UPDATE `guilds` SET `frags_semana` = `frags_semana` + 3 WHERE `id` = " .. getPlayerGuildId(cid) .. ";")
                     doPlayerSendTextMessage(cid,19,"[GUILD RANK]: + 3 PONTOS pela morte do player "..getCreatureName(target).." (TEM GUILD!)") 
                 else
                     db.executeQuery("UPDATE `guilds` SET `frags_semana` = `frags_semana` + 1 WHERE `id` = " .. getPlayerGuildId(cid) .. ";")
                     doPlayerSendTextMessage(cid,19,"[GUILD RANK]: + 1 PONTO pela morte do player "..getCreatureName(target).." (NAO TEM GUILD!)")
                 end

    else

            local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
            local timeLeft = convertTime(getPlayerStorageValue(target,getPlayerGuildId(cid)) - os.time())

            doPlayerSendTextMessage(cid,19,"[GUILD RANK]: NAO SOMOU PONTOS, mate o "..getCreatureName(target).."novamente em "..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds).." para CONTAR PONTOS NO GUILD RANK !")
        return true
    end 
end
end
end
return true
end


