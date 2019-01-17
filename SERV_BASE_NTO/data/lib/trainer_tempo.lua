--ARQUIVOS USADOS:
--trainer_tempo.lua (ACTIONS)
--trainer_tempo.lua (MOVEMENTS) // ACTION ID USADO EM KONOHA: 4540
--trainer_tempo.lua (GLOBALEVENTS)
--if getPlayerItemCount(cid,item_card) == 0 then doPlayerSendTextMessage(cid, 25, "Vc nao tem o item! Adquira no NPC o CARD PRA TER ACESSO AOS TRAINERS!")  doTeleportThing(cid,fromPosition) return true end

tempo_de_trainer =  10 --segundos
tempo_de_trainer2 =  20 --segundos

aid_trainer= { ["1"] = 4541, ["2"] = 4542, ["3"] = 4543,}  --back quando nao é dono
--frompos_trainer= { ["1"] = {x=800,y=1257,z=7}, ["2"] = {x=802,y=1257,z=7}, ["3"] = {x=802,y=1261,z=7},}  --back quando nao é dono
trainer = { ["1"] = {x=798,y=1257,z=7},  ["2"] = {x=804,y=1257,z=7}, ["3"] = {x=804,y=1261,z=7}, ["4"] = {x=804,y=1261,z=7}  } -- local de treinamento
townpos = {x= 800,y= 1260,z =7}
trainer_auxiliar = 18211
sto_player_time = 11113
trainer_player_power = 13333

--sto_global_trainer_tempo = {1811001,811002,811003}

--sto_player_tempo = 1821001
--sto_player_ligado = 1831001

--sto_global_acc_id = {1841001,841002,841003}

--sto_cave_ligado = {1851001,851002,851003}

function trainer_tempo(cid) 
    local ult = db.getResult('select `trainer_tempo` from players where id = \''..getPlayerGUID(cid)..'\' ')

    if (ult:getID() == -1) then
    return false
    end

    local mamae = ult:getDataString("trainer_tempo")
    ult:free()

    caguei = tonumber(mamae)
    return caguei

end