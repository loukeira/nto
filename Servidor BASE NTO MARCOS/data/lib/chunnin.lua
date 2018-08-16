chunnin = {
    pos = {
        temple_wait = {x=1074, y=367, z=7}, 
        tp_create = {x=1031, y=907, z=7},
        zona_wait_cancel = {
                            from1 ={x=1061,y=363,z=7 },to1={x=1086,y=387,z=7}
                            },
        corredor = {
                            from1 ={x=1072,y=365,z=7 },to1={x=1076,y=386,z=7}
                    },
        zona = {    from1 ={x=1064,y=365,z=7 },to1={x=1070,y=369,z=7}


                 }
    },

    quant_times = 1,
    days_open = {1, 2, 3, 4, 5, 6, 7},
    min_players = 1, 
    min_level = 1, 
    wait_time = 2, 
    block_mc = false, 

    delay_time = 10,
    townid = {x=1032,y=905,z=7},


    reward_items = {6527, 6527},

    floresta = {
        pos = {
            a1 = {x=396, y=1138, z=6}, 
            a2 = {x=429, y=1107, z=6},
            a3 = {x=430, y=1135, z=6}
        }
       
    },

    storage = {
        rola1 = 1690,
        rola2 = 1691,
        rola3 = 1692,
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
        faltatime = "[CHUNNIN] Fechou o teleporte e cancelou o evento por nao ter pelo menos 2 times!"
    },
}

	function chunnin.open()
    local time = os.date("*t")
    local timeopen1 = math.ceil(chunnin.wait_time / 4)
    local timeopen2 = math.ceil(chunnin.wait_time / 2)
    if (isInArray(chunnin.days_open, time.wday)) then
        local tp = doCreateItem(1387, chunnin.pos.tp_create)
        doItemSetAttribute(tp, "aid", 981) 
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
    doRemoveItem(tp) 
    if (chunnin.min_players <= chunnin.countPlayers()) then
        if getGlobalStorageValue(15900) >= chunnin.quant_times then
        chunnin.sendPlayersToEvent()
        doBroadcastMessage(chunnin.msg.start)

             for _, pid in pairs(getPlayersOnline()) do
                 if isInArea(getThingPos(pid), chunnin.pos.corredor.from1, chunnin.pos.corredor.to1) then
                        doTeleportThing(pid, chunnin.townid)
                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi retirado do exame por nao ter ficado em nenhum time!")

                 end
            end

            if (getGlobalStorageValue(rola1) <3) then
            for _, pid in pairs(getPlayersOnline()) do
                if isInArea(getThingPos(pid), chunnin.pos.zona.from1, chunnin.pos.zona.to1) then
                        doTeleportThing(pid, chunnin.townid)
                        doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce foi retirado do exame por nao ter 3 componentes no time 1!")
                        setPlayerStorageValue(pid,rola1,-1)

                end
            end
            setGlobalStorageValue(rola1,0)
            end

        else
            doBroadcastMessage(chunnin.msg.faltatime)
            for _, pid in pairs(getPlayersOnline()) do
            if isInArea(getThingPos(pid), chunnin.pos.zona_wait_cancel.from1, chunnin.pos.zona_wait_cancel.to1) then
             doTeleportThing(pid, chunnin.townid)     
            end
            end
             chunnin.resetPlayerStorages()
             chunnin.resetGlobalStorages()
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
    end
    return true
end



function chunnin.sendPlayersToEvent()

    
    for _, index in ipairs(chunnin.getPlayersInEvent()) do
        if (index.team == 1) then
            doTeleportThing(index.pid, chunnin.floresta.pos.a1)
            doPlayerSetStorageValue(index.pid, chunnin.storage.team_blue, 1)
        end
        if (index.team == 2) then
            doTeleportThing(index.pid, chunnin.floresta.pos.a2)
            doPlayerSetStorageValue(index.pid, chunnin.storage.team_red, 1)
        end
         if (index.team == 3) then
            doTeleportThing(index.pid, chunnin.floresta.pos.a3)
            doPlayerSetStorageValue(index.pid, chunnin.storage.team_red, 1)
        end
    end 

    return true
end

function chunnin.sendPlayersToFlorest()
    chunnin.setTeam()
    chunnin.resetPlayerStorages()
    for _, index in ipairs(chunnin.getPlayersInEvent()) do
        if (index.team == 1) then
            doTeleportThing(index.pid, chunnin.floresta.pos.a1)
            doPlayerSetStorageValue(index.pid, chunnin.storage.team_blue, 1)
        end
        if (index.team == 2) then
            doTeleportThing(index.pid, chunnin.floresta.pos.a2)
            doPlayerSetStorageValue(index.pid, chunnin.storage.team_red, 1)
        end
         if (index.team == 3) then
            doTeleportThing(index.pid, chunnin.floresta.pos.a3)
            doPlayerSetStorageValue(index.pid, chunnin.storage.team_red, 1)
        end
    end 
    return true
end

function chunnin.setTeam()
	zona_wait_team = {
	from1 = {x = 300, y = 525, z = 1},
	to1 = {x = 460, y = 650, z = 1},
	from2 = {x = 300, y = 525, z = 2},
	to2 = {x = 460, y = 650, z = 2},
	from3 = {x = 300, y = 525, z = 3},
	to3 = {x = 460, y = 650, z = 3}
	}

	new_zona_bau = {
	um = {x = 300, y = 525, z = 1},
	dois = {x = 460, y = 650, z = 1},
	tres = {x = 300, y = 525, z = 2}
	}

    for _, pid in pairs(getPlayersOnline()) do
       if isInArea(getThingPos(pid), zona_wait_team.from1, zona_wait_team.to1) then
             doTeleportThing(pid, new_zona_bau.um)
             doPlayerSetStorageValue(pid, sto_team, 1)
             doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce faz part do time 1!")
             local cont = getPlayerStorageValue(sto_team)
             db.query("UPDATE players SET team = "..cont.." WHERE id = "..getPlayerGUID(pid).." ;")
       end
       if isInArea(getThingPos(pid), zona_wait_team.from2, zona_wait_team.to2) then
             doTeleportThing(pid, new_zona_bau.dois)
             doPlayerSetStorageValue(pid, sto_team, 2)
             doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce faz part do time 2!")
             local cont = getPlayerStorageValue(sto_team)
             db.query("UPDATE players SET team = "..cont.." WHERE id = "..getPlayerGUID(pid).." ;")
       end
       if isInArea(getThingPos(pid), zona_wait_team.from3, zona_wait_team.to3) then
             doTeleportThing(pid, new_zona_bau.tres)
             doPlayerSetStorageValue(pid, sto_team, 3)
             doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce faz part do time 3!")
             local cont = getPlayerStorageValue(sto_team)
             db.query("UPDATE players SET team = "..cont.." WHERE id = "..getPlayerGUID(pid).." ;")
       end
    end
	return true
end

function chunnin.resetPlayerStorages()
    if chunnin.getPlayersInEvent() then
        for _, index in ipairs(chunnin.getPlayersInEvent()) do
            doPlayerSetStorageValue(index.pid, chunnin.storage.rola1, -1)
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

function chunnin.getPlayersInEvent()
    local result = db.getResult("SELECT * FROM `chunnin_players`;")
    CACHE_PLAYERS = {}
    if result:getID() ~= -1 then
        repeat
            pid  = tonumber(result:getDataInt("pid"))
            team  = tonumber(result:getDataInt("team")) 
            ip  = tonumber(result:getDataInt("ip"))
            table.insert(CACHE_PLAYERS, {["pid"]=pid,["team"]=team,["ip"]=ip }) 
        until(not result:next())
        result:free()
        return CACHE_PLAYERS
    end
    return false 
end

function chunnin.resetGlobalStorages()
    setGlobalStorageValue(15900, -1)
    setGlobalStorageValue(chunnin.storage.rola1, -1)
    setGlobalStorageValue(chunnin.storage.kill_red, 0)
    setGlobalStorageValue(chunnin.storage.tower_blue, 0)
    setGlobalStorageValue(chunnin.storage.tower_red, 0)
    print("[CHUNNIN] Todos os globais storages foram resetados...")
    return true
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
    doPlayerSendCancel(cid, "[ChunniN] GO GO GO! seu time o aguarda.")         
    setPlayerStorageValue(cid, chunnin.storage.delay, 0)
    return true
end

function chunnin.setDelay(cid)
    doPlayerSetStorageValue(cid, chunnin.storage.delay, os.time()+(60*chunnin.delay_time))
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

local pos = {x=123,y=456,z=789}

function doRemoveCorpse(pos)
for i = 1, 255 do
corp = {x=pos.x, y=pos.y, z=pos.z, stackpos=i}
if isCorpse(getThingFromPos(corp).uid) then
break
end
end
doRemoveItem(getThingFromPos(corp).uid, 1)
end