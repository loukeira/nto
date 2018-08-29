
-- local itemtype = {9969,9933,5896,8929,8932,7388,8849,8906,2580}, itemtype[display]
local displayoutput = {"XPRANK"}

function onSay(cid, words, param)
    number = 1
    param = string.lower(param)
    skilllist = ""
    command = TRUE
                if param == "" then        
                    display = 1
                elseif param == "time" then
                     display = 2
                -- elseif param == "club" then
                    -- id = 1
                    -- display = 4
                -- elseif param == "sword" then
                    -- id = 2
                    -- display = 5
                -- elseif param == "axe" then
                    -- id = 3
                    -- display = 6
                -- elseif param == "distance" then
                    -- id = 4
                    -- display = 7
                -- elseif param == "shield" then
                    -- id = 5
                    -- display = 8
                else 
                     local erro = "Voce deve digitar {!xprank} para ver a classificacao ou, {!xprank time} para ver quanto tempo falta!"

                     doPlayerSendTextMessage(cid,18,erro)
                     command = FALSE
                     return true

                end

    if command ~= FALSE then
        if display == 1 then
            local player = db.getResult("SELECT `name`,`xprank` FROM `players` WHERE group_id < '2' ORDER BY `xprank` DESC LIMIT 15;")    
            if(player:getID() ~= -1) then
                while (true) do
                    local name = player:getDataString("name")
                    local level = player:getDataString("xprank")

                      skilllist = skilllist.. "\n#"..string.format("%5s",number.."  "..name.."  -  "..level)
                    number = number + 1
                    if not(player:next()) then
                        break
                    end
                end
                player:free()
            end
        elseif display == 2 then

            local stu,exhaust = 31570,5

            if (getPlayerStorageValue(cid, stu) <= os.time()) then
               setPlayerStorageValue(cid, stu, os.time()+ exhaust)
              
                if getGlobalStorageValue(STORAGEXPRANK) < os.time() then
                    doPlayerSendCancel(cid, "o sistema vai reiniciar")
                else
                    local time_model = "%d dia(s), %d hora(s), %d minuto(s) e %d segundo(s)."
                    local timeLeft = convertTime(getGlobalStorageValue(STORAGEXPRANK) - os.time())

                    doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'O sistema ira reiniciar daqui ' ..time_model:format(timeLeft.days, timeLeft.hours, timeLeft.minutes, timeLeft.seconds))
                            
                    doPlayerSendTextMessage(cid,27," O seu ganho de xp foi de: "..xp_rank(cid).." ate o momento! ")

                return true
                end
            else
               doPlayerSendTextMessage(cid,18, "Voce so pode usar o comando a  cada "..exhaust.." segundos")
               return true
            end
        end 
		
	local dialog  = "[+] 15 MELHORES 'RANK XP' NA SEMANA NTO GRAN [+]\n\n [+]  "..displayoutput[display].." Highscores:  [+]\n  "..skilllist.."\n\n [+]  "..displayoutput[display].." Highscores:  [+]\n\n"

	return doPlayerPopupFYI(cid, dialog)
    end    
end