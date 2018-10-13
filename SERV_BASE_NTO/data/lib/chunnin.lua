id_item_pergaminho_ar = 2222
id_item_pergaminho_terra = 2220

chunnin = {
    pos = {
        temple_wait = {x=1074, y=367, z=7}, 
        tp_create = {x=1031, y=907, z=7},
        tp_volta = {x=1072,y= 365,z= 7},
        wait_arena = { --la da floresta
                            from1 ={x=1113,y=372,z=7 },to1={x=1119,y=378,z=7}

                            },

        wait_arena2 = {  --arena das oitavas
                            from1 ={x=1158,y=359,z=7 },to1={x=1160,y=361,z=7}
                            },

        wait_arena3 = {   --arena das quartas
                            from1 ={x=1162,y=359,z=7 },to1={x=1164,y=361,z=7}
                            },

        wait_arena4 = {  --arena das semi 
                            from1 ={x=1158,y=363,z=7 },to1={x=1160,y=365,z=7}
                            },
        wait_arena5 = {  --arena da final mesma q oitavas
                            from1 ={x=1162,y=363,z=7 },to1={x=1164,y=365,z=7}
                            },

        zona_wait_cancel = {
                            from1 ={x=1061,y=363,z=7 },to1={x=1086,y=387,z=7}
                            },
        corredor = {
                            from1 ={x=1072,y=365,z=7 },to1={x=1076,y=386,z=7}
                    },
        zona = {    
                from1 ={x=1064,y=365,z=7 },to1={x=1070,y=369,z=7},                
                from2 ={x=1077,y=365,z=7 },to2={x=1084,y=369,z=7},
                from3 ={x=1077,y=371,z=7 },to3={x=1084,y=376,z=7}




                 },

        goflorest = {
                       team1 ={x=1100,y=374,z=7 },
                       team2 ={x=1116,y=359,z=7 },
                       team3 ={x=1134,y=375,z=7 },

                    },
        luta_oitavas = {
                         from1 ={x=1072,y=375,z=7 },to1={x=1075,y=379,z=7}

                        },
        luta_quartas = {
                         from1 ={x=1072,y=375,z=7 },to1={x=1075,y=379,z=7}

                        },
       luta_semi = {
                         from1 ={x=1072,y=375,z=7 },to1={x=1075,y=379,z=7}

                        },
       luta_final = {
                         from1 ={x=1072,y=375,z=7 },to1={x=1075,y=379,z=7}

                        },

    },

    quant_times = 1,
    days_open = {1, 2, 3, 4, 5, 6, 7},
    min_players = 1, 
    min_level = 1, 
    wait_time = 1, 
    block_mc = false, 

    delay_time = 3,
    pvp1 = {x=1178,y=360,z=7},
    pvp2 = {x=1180,y=360,z=7},
    pvp11 = {x=1178,y=360,z=7},
    pvp22 = {x=1180,y=360,z=7},
    pvp31 = {x=1178,y=360,z=7},
    pvp32 = {x=1180,y=360,z=7},
    pvp41 = {x=1178,y=360,z=7},
    pvp42 = {x=1180,y=360,z=7},

                        -- from1 ={x=1064,y=371,z=7 },to1={x=1070,y=376,z=7}

    townid = {x=1032,y=905,z=7},
    arenaid = {x=1064,y=371,z=7},
    arenaid2 = {x=1064,y=378,z=7},
    arenaid3 = {x=1077,y=378,z=7},
    arenaid4 = {x=1064,y=371,z=7},
    arenaid5 = {x=1032,y=905,z=7},



    pvp = { oitavas = 88888, quartas= 444444,semi = 222222, final = 11111111, campeao = 9999222 },
    reward_items = {6527, 6527},

    floresta = {
        pos = {
            a1 = {x=1097, y=374, z=7}, 
            a2 = {x=1115, y=355, z=7},
            a3 = {x=1137, y=375, z=7}
        },

        bau={
                from1 ={x=1097,y=373,z=7 },to1={x=1099,y=375,z=7},                
                from2 ={x=1114,y=354,z=7 },to2={x=1117,y=358,z=7},
                from3 ={x=1135,y=373,z=7 },to3={x=1139,y=376,z=7}

            }
       
    },



    storage = {
        ativo = 99222,
        rola1 = 190,
        rola2 = 191,
        rola3 = 192,
        somatoriotime = 290,
        somatoriotime2= 291,
        somatoriotime3= 292,

        bau1= 390,
        bau2 = 391,
        bau3 = 392,
        pergaminho = 4421,
        quant_player_tem_para_arena = 5421,
        msg_unica = 6322,

        arena_on = 18301,
        arena_aux_1 = 19301,
        arena_aux_2 = 19302,
        arena_aux_3 = 19303,
        arena_aux_4 = 19304,
        arena_aux_5 = 19305,
        arena_aux_6 = 19306,
        arena_aux_7 = 19307,
        arena_aux_8 = 19308,
        arena_aux_9 = 19309,
        arena_aux_10 = 19310,
        arena_aux_11 = 19311,

        inicio_arena = 303021,

        win = 87771, 
        kill_blue = 87775,
        kill_red = 87776, 
        tower_blue = 87777, 
        tower_red = 87778, 
        team_blue = 9998, 
        team_red = 9999, 
        buffvoc1 = 7001, 
        buffvoc2 = 7002, 
        buffvoc4 = 7004, 
        exp_bonus = 7005, 
        delay = 7006, 
    },

    msg = {
        win_team_blue = "[ChunniN] O time azul acabou de derrotar a Suprema Torre Vermelha e vencer o evento.",
        win_team_red = "[ChunniN] O time vermelho acabou de derrotar a Suprema Torre Azul e vencer o evento. ",
        reward = "[ChunniN] Seu time Venceu, voce recebeu como premio o dobro de experiencia por 4 horas automaticamente e 80 event coins, desejamos parabens.",
        no_reward = "[ChunniN] Derrota, confira as estatisticas da partida no site, desejamos mais sorte na proxima.",
        warning = "[ChunniN] Acabou de abrir, acesse o teleporte do templo principal para participar. Inicia em minutos...",
        start = "[ChunniN] Fechou o teleporte de entrada e iniciou o evento boa sorte aos times.",
        cancel = "[ChunniN] Fechou o teleporte de entrada e cancelou o evento por falta de jogadores.",
        faltatime = "[CHUNNIN] Fechou o teleporte e cancelou o evento por nao ter o num minimo de  times!"
    },
}

function chunnin.resetGlobalStorages()
    setGlobalStorageValue(chunnin.storage.somatoriotime, -1)


    setGlobalStorageValue(chunnin.storage.rola1, -1)
    setGlobalStorageValue(chunnin.storage.rola2, -1)
    setGlobalStorageValue(chunnin.storage.rola3, -1)

    setGlobalStorageValue(chunnin.storage.bau1,-1)
    setGlobalStorageValue(chunnin.storage.ativo,-1)
    setGlobalStorageValue(chunnin.storage.quant_player_tem_para_arena,-1)
    setGlobalStorageValue(chunnin.storage.msg_unica,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_1,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_2,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_3,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_4,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_5,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_6,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_7,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_8,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_9,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_10,-1)
    setGlobalStorageValue(chunnin.storage.arena_aux_11,-1)
    setGlobalStorageValue(chunnin.storage.arena_on,-1)
    setGlobalStorageValue(chunnin.storage.inicio_arena,-1)

    setGlobalStorageValue(chunnin.storage.kill_red, 0)
    setGlobalStorageValue(chunnin.storage.tower_blue, 0)
    setGlobalStorageValue(chunnin.storage.tower_red, 0)
    print("[CHUNNIN] Todos os globais storages foram resetados...")
    return true
end

function chunnin.resetPlayerStorages()
    if chunnin.getPlayersInEvent() then
        for _, index in ipairs(chunnin.getPlayersInEvent()) do
            doPlayerSetStorageValue(index.pid, chunnin.storage.rola1, -1)
            doPlayerSetStorageValue(index.pid, chunnin.storage.rola2, -1)
            doPlayerSetStorageValue(index.pid, chunnin.storage.rola3, -1)

            doPlayerSetStorageValue(index.pid, chunnin.storage.pergaminho, -1)
            -- setPlayerStorageValue(index.pid,chunnin.pvp.oitavas,-1)
            -- setPlayerStorageValue(index.pid,chunnin.pvp.quartas,-1)
            -- setPlayerStorageValue(index.pid,chunnin.pvp.semi,-1)
            -- setPlayerStorageValue(index.pid,chunnin.pvp.final,-1)
            setPlayerStorageValue(index.pid,quantplayer,-1)

            doPlayerSetStorageValue(index.pid, chunnin.storage.team_red, 0)
            doPlayerSetStorageValue(index.pid, chunnin.storage.buffvoc1, 0)
            doPlayerSetStorageValue(index.pid, chunnin.storage.buffvoc2, 0)
            doPlayerSetStorageValue(index.pid, chunnin.storage.buffvoc3, 0)
            doPlayerSetStorageValue(index.pid, chunnin.storage.buffvoc4, 0)
        end
        print("[ChunniN] Todos os players storages foram resetados...")  
        return true
    else
        print("[ChunniN] Tabela vazia...")  
    end
    return true
end

	function chunnin.open()
    local time = os.date("*t")
    local timeopen1 = math.ceil(chunnin.wait_time / 4)
    local timeopen2 = math.ceil(chunnin.wait_time / 2)
    if (isInArray(chunnin.days_open, time.wday)) then
        local tp = doCreateItem(1387, chunnin.pos.tp_create)
        doItemSetAttribute(tp, "aid", 981) 
        local tpvolta = doCreateItem(1387, chunnin.pos.tp_volta)
        doItemSetAttribute(tpvolta, "aid", 982) 
        chunnin.resetGlobalStorages()
        chunnin.resetPlayerStorages()
        chunnin.trucatePlayersInEvent()
        doBroadcastMessage(chunnin.msg.warning)
        addEvent(doBroadcastMessage, timeopen1*1000*60, "[CHUNNIN] - Resta(m) ".. timeopen2 .." minuto(s) para iniciar o evento!")
        if (timeopen2 ~= timeopen1) then
            addEvent(doBroadcastMessage, timeopen2*1000*60, "[CHUNNIN] - Resta(m) ".. timeopen1 .." minuto(s) para iniciar o evento!")
        end
        addEvent(chunnin.start, chunnin.wait_time*1000*60,nil)
    end
    return true
end


function chunnin.countPlayers()
    local result = db.getResult("SELECT * FROM `chunnin_players`;")
    local qntPlayers = 0
    if result:getID() ~= -1 then
        repeat
            qntPlayers = (qntPlayers+1)
        until(not result:next())
    end
    return qntPlayers
end

function chunnin.start()

    local tp = getTileItemById(chunnin.pos.tp_create, 1387).uid 
    local tpvolta = getTileItemById(chunnin.pos.tp_volta, 1387).uid 
    doRemoveItem(tp) 
    doRemoveItem(tpvolta) 
    setGlobalStorageValue(chunnin.storage.ativo, 1)

    if (chunnin.min_players <= chunnin.countPlayers()) then
        if getGlobalStorageValue(chunnin.storage.somatoriotime) >= chunnin.quant_times then

             for _, pid in pairs(getPlayersOnline()) do
                 if isInArea(getThingPos(pid), chunnin.pos.corredor.from1, chunnin.pos.corredor.to1) then
                        doTeleportThing(pid, chunnin.townid)
                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi retirado do exame por nao ter ficado em nenhum time!")

                 end
            end

            -- TIME 1
            if (getGlobalStorageValue(chunnin.storage.rola1) <3) then
            for _, pid in pairs(getPlayersOnline()) do
                if isInArea(getThingPos(pid), chunnin.pos.zona.from1, chunnin.pos.zona.to1) then
                        doTeleportThing(pid, chunnin.townid)
                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi retirado do exame por nao ter 3 componentes no time 1!")
                        setPlayerStorageValue(pid,chunnin.storage.rola1,-1)
                        db.query("UPDATE chunnin_players SET team = 0 WHERE name = '"..getPlayerName(pid).."' ;")
                end
            end
            setGlobalStorageValue(chunnin.storage.rola1,0)
            end

            --TIME 2

            if (getGlobalStorageValue(chunnin.storage.rola2) <3) then
            for _, pid in pairs(getPlayersOnline()) do
                if isInArea(getThingPos(pid), chunnin.pos.zona.from2, chunnin.pos.zona.to2) then
                        doTeleportThing(pid, chunnin.townid)
                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi retirado do exame por nao ter 3 componentes no time 1!")
                        setPlayerStorageValue(pid,chunnin.storage.rola2,-1)
                        db.query("UPDATE chunnin_players SET team = 0 WHERE name = '"..getPlayerName(pid).."' ;")
                end
            end
            setGlobalStorageValue(chunnin.storage.rola2,0)
            end

            -- TIME3
            if (getGlobalStorageValue(chunnin.storage.rola3) <3) then
            for _, pid in pairs(getPlayersOnline()) do
                if isInArea(getThingPos(pid), chunnin.pos.zona.from3, chunnin.pos.zona.to3) then
                        doTeleportThing(pid, chunnin.townid)
                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi retirado do exame por nao ter 3 componentes no time 1!")
                        setPlayerStorageValue(pid,chunnin.storage.rola3,-1)
                        db.query("UPDATE chunnin_players SET team = 0 WHERE name = '"..getPlayerName(pid).."' ;")
                end
            end
            setGlobalStorageValue(chunnin.storage.rola3,0)
            end

                    doBroadcastMessage(chunnin.msg.start)
                    chunnin.sendPlayersToEvent()


        else
            doBroadcastMessage(chunnin.msg.faltatime)
            for _, pid in pairs(getPlayersOnline()) do
            if isInArea(getThingPos(pid), chunnin.pos.zona_wait_cancel.from1, chunnin.pos.zona_wait_cancel.to1) then
             doTeleportThing(pid, chunnin.townid)     
            end
            end
             chunnin.resetPlayerStorages()
             chunnin.resetGlobalStorages()
             chunnin.trucatePlayersInEvent()
        return true
        end

    else
        doBroadcastMessage(chunnin.msg.cancel)
         for _, pid in pairs(getPlayersOnline()) do
              if isInArea(getThingPos(pid), chunnin.pos.zona_wait_cancel.from1, chunnin.pos.zona_wait_cancel.to1) then
             doTeleportThing(pid, chunnin.townid)     

          end
        end
            chunnin.resetPlayerStorages()
             chunnin.resetGlobalStorages()
            chunnin.trucatePlayersInEvent()
    end
    return true
end



function chunnin.sendPlayersToEvent()

    
    for _, index in ipairs(chunnin.getPlayersInEvent()) do
        if (index.team == 1) then
            doTeleportThing(index.pid, chunnin.floresta.pos.a1)
            --doPlayerSetStorageValue(index.pid, chunnin.storage.team_blue, 1)
        end
        if (index.team == 2) then
            doTeleportThing(index.pid, chunnin.floresta.pos.a2)
            --doPlayerSetStorageValue(index.pid, chunnin.storage.team_red, 1)
        end
         if (index.team == 3) then
            doTeleportThing(index.pid, chunnin.floresta.pos.a3)
           -- doPlayerSetStorageValue(index.pid, chunnin.storage.team_red, 1)
        end
    end 

    return true
end

-- function chunnin.sendPlayersToFlorest()
--     chunnin.setTeam()
--     chunnin.resetPlayerStorages()
--     for _, index in ipairs(chunnin.getPlayersInEvent()) do
--         if (index.team == 1) then
--             doTeleportThing(index.pid, chunnin.floresta.pos.a1)
--             doPlayerSetStorageValue(index.pid, chunnin.storage.team_blue, 1)
--         end
--         if (index.team == 2) then
--             doTeleportThing(index.pid, chunnin.floresta.pos.a2)
--             doPlayerSetStorageValue(index.pid, chunnin.storage.team_red, 1)
--         end
--          if (index.team == 3) then
--             doTeleportThing(index.pid, chunnin.floresta.pos.a3)
--             doPlayerSetStorageValue(index.pid, chunnin.storage.team_red, 1)
--         end
--     end 
--     return true
-- end

-- function chunnin.setTeam()
-- 	zona_wait_team = {
-- 	from1 = {x = 300, y = 525, z = 1},
-- 	to1 = {x = 460, y = 650, z = 1},
-- 	from2 = {x = 300, y = 525, z = 2},
-- 	to2 = {x = 460, y = 650, z = 2},
-- 	from3 = {x = 300, y = 525, z = 3},
-- 	to3 = {x = 460, y = 650, z = 3}
-- 	}

-- 	new_zona_bau = {
-- 	um = {x = 300, y = 525, z = 1},
-- 	dois = {x = 460, y = 650, z = 1},
-- 	tres = {x = 300, y = 525, z = 2}
-- 	}

--     for _, pid in pairs(getPlayersOnline()) do
--        if isInArea(getThingPos(pid), zona_wait_team.from1, zona_wait_team.to1) then
--              doTeleportThing(pid, new_zona_bau.um)
--              doPlayerSetStorageValue(pid, sto_team, 1)
--              doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce faz part do time 1!")
--              local cont = getPlayerStorageValue(sto_team)
--              db.query("UPDATE players SET team = "..cont.." WHERE id = "..getPlayerGUID(pid).." ;")
--        end
--        if isInArea(getThingPos(pid), zona_wait_team.from2, zona_wait_team.to2) then
--              doTeleportThing(pid, new_zona_bau.dois)
--              doPlayerSetStorageValue(pid, sto_team, 2)
--              doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce faz part do time 2!")
--              local cont = getPlayerStorageValue(sto_team)
--              db.query("UPDATE players SET team = "..cont.." WHERE id = "..getPlayerGUID(pid).." ;")
--        end
--        if isInArea(getThingPos(pid), zona_wait_team.from3, zona_wait_team.to3) then
--              doTeleportThing(pid, new_zona_bau.tres)
--              doPlayerSetStorageValue(pid, sto_team, 3)
--              doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce faz part do time 3!")
--              local cont = getPlayerStorageValue(sto_team)
--              db.query("UPDATE players SET team = "..cont.." WHERE id = "..getPlayerGUID(pid).." ;")
--        end
--     end
-- 	return true
-- end



function chunnin.getPlayersInEvent()
    local result = db.getResult("SELECT * FROM `chunnin_players`;")
    CACHE_PLAYERS = {}
    if result:getID() ~= -1 then
        repeat
            pid  = tonumber(result:getDataInt("pid"))
            team  = tonumber(result:getDataInt("team")) 
            ip  = tonumber(result:getDataInt("ip"))
            name = tostring(result:getDataString("name"))
            pos_oitavas = tonumber(result:getDataInt("pos_oitavas"))
            oitavas = tonumber(result:getDataInt("oitavas"))
            pos_quartas = tonumber(result:getDataInt("pos_quartas"))
            quartas = tonumber(result:getDataInt("quartas"))
            pos_semi = tonumber(result:getDataInt("pos_semi"))
            semi = tonumber(result:getDataInt("semi"))
            pos_final = tonumber(result:getDataInt("pos_final"))
            final = tonumber(result:getDataInt("final"))

            table.insert(CACHE_PLAYERS, {["pid"]=pid,["team"]=team,["ip"]=ip,["name"]=name ,["pos_oitavas"]=pos_oitavas,["pos_quartas"]=pos_quartas,["pos_semi"]=pos_semi,["pos_final"]=pos_final,["oitavas"]=oitavas,["quartas"]=quartas,["semi"]=semi,["final"]=final}) 
        until(not result:next())
        result:free()
        return CACHE_PLAYERS
    end
    return false 
end

function chunnin.getFight(cid)
    local result = db.getResult("SELECT * FROM `chunnin_players` WHERE name = '"..getCreatureName(cid).."';")
    CACHE_PLAYERS = {}
    if result:getID() ~= -1 then
        repeat
            oit = tonumber(result:getDataInt("oitavas")) 
            qua  = tonumber(result:getDataInt("quartas")) 
            semi  = tonumber(result:getDataInt("semi")) 
            final  = tonumber(result:getDataInt("final")) 

            CACHE_PLAYERS[1] = tonumber(oit)
            CACHE_PLAYERS[2] = tonumber(qua)            
            CACHE_PLAYERS[3] = tonumber(semi)
            CACHE_PLAYERS[4] = tonumber(final)
        until(not result:next())
        result:free()
        return CACHE_PLAYERS
    end
    return false 
end


function chunnin.getTeam(cid)
    local result = db.getResult("SELECT team FROM `chunnin_players` WHERE name = '"..getCreatureName(cid).."';")
    CACHE_PLAYERS = 0
    if result:getID() ~= -1 then
        repeat
            team  = tonumber(result:getDataInt("team")) 

            CACHE_PLAYERS = tonumber(team)
        until(not result:next())
        result:free()
        return CACHE_PLAYERS
    end
    return false 
end


function chunnin.trucatePlayersInEvent()
    local result = db.getResult("SELECT * FROM `chunnin_players`;")
    if result:getID() ~= -1 then
        db.query("TRUNCATE TABLE `chunnin_players`;")  
        print("[ChunniN] Todos dados da tabela 'chunnin_players' foram apagados...")
    end
    return true
end

function chunnin.enableMove(cid)
    doCreatureSetNoMove(cid, false)
    doPlayerSendTextMessage(cid,18, "[ChunniN] GO GO GO! ")         
    --setPlayerStorageValue(cid, chunnin.storage.delay, 0)
    return true
end

function chunnin.setDelay(cid)
    doPlayerSetStorageValue(cid, chunnin.storage.delay, os.time()+(chunnin.delay_time))
    return true
end

function chunnin.getDelay(cid)
    local statsDelay = getPlayerStorageValue(cid, chunnin.storage.delay)
    if (statsDelay - os.time() > 0) then
        local delay = 0
        local times = chunnin.delay_time
        doCreatureSetNoMove(cid, true)
        for i = times, 0, -1 do
            if isPlayer(cid) then
                addEvent(doPlayerSendCancel, delay, cid, "[ChunniN] Volte para a arena em "..i..".")
            end
            delay = 2000 + delay                 
            if (i == 0) and (isPlayer(cid)) then
                addEvent(chunnin.enableMove, (delay+1000), cid)
            end
         end
    else
        return false
    end
    return true
end

function chunnin.reward(pid)
    local random_item = chunnin.reward_items[math.random(1, #chunnin.reward_items)]
    doPlayerAddItem(pid, 6527, 80)
    chunnin.setBonusExp(pid)
    doPlayerSendTextMessage(pid, 25, chunnin.msg.reward)   
    return true
end



function chunnin.resultBattle()
    local frags_blue = getGlobalStorageValue(chunnin.storage.kill_blue)
    local frags_red = getGlobalStorageValue(chunnin.storage.kill_red)
    local towers_blue = getGlobalStorageValue(chunnin.storage.tower_blue)
    local towers_red = getGlobalStorageValue(chunnin.storage.tower_red)
    local hora = os.date("%X")
    local data = os.date("%x")
    db.query("INSERT INTO `dtt_results`  VALUES ('', ".. frags_blue ..  ",".. frags_red ..", ".. towers_blue ..", ".. towers_red ..", ".. db.escapeString(data) ..", ".. db.escapeString(hora) ..");")  
    return true
end

function chunnin.close()
    for _, index in ipairs(chunnin.getPlayersInEvent()) do
        doRemoveCondition(index.pid, CONDITION_INFIGHT)
        doPlayerSetPzLocked(index.pid, false)
        if (getGlobalStorageValue(chunnin.storage.win) == "blue") then
            if (index.team == 0) then 
                doPlayerSetTown(index.pid, chunnin.townid)   
                doTeleportThing(index.pid, getTownTemplePosition(chunnin.townid))
                chunnin.reward(index.pid)
            else
                doPlayerSetTown(index.pid, chunnin.townid)   
                doTeleportThing(index.pid, getTownTemplePosition(chunnin.townid))
                doPlayerSendTextMessage(index.pid, 25, chunnin.msg.no_reward)
            end
        end
        if (getGlobalStorageValue(chunnin.storage.win) == "red") then
            if (index.team == 1) then 
                doPlayerSetTown(index.pid, chunnin.townid)   
                doTeleportThing(index.pid, getTownTemplePosition(chunnin.townid))
                chunnin.reward(index.pid)
            else
                doPlayerSetTown(index.pid, chunnin.townid)   
                doTeleportThing(index.pid, getTownTemplePosition(chunnin.townid))
                doPlayerSendTextMessage(index.pid, 25, chunnin.msg.no_reward)
            end
        end
    end
    chunnin.resetPlayerStorages()
    return true
end

-- local pos = {x=123,y=456,z=789}

-- function doRemoveCorpse(pos)
-- for i = 1, 255 do
-- corp = {x=pos.x, y=pos.y, z=pos.z, stackpos=i}
-- if isCorpse(getThingFromPos(corp).uid) then
-- break
-- end
-- end
-- doRemoveItem(getThingFromPos(corp).uid, 1)
-- end