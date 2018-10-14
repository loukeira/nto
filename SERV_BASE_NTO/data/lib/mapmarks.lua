local mapmarks_konoha = {
    [{x = 1112, y = 1066, z = 7}] = {MAPMARK_LOCK, 'DP'},
    [{x = 1001, y = 868, z = 7}] = {MAPMARK_DOLLAR, 'Templo'},   
    [{x = 1053, y = 888, z = 7}] = {MAPMARK_DOLLAR, 'Trainers'},   
    --[{x = 1113, y = 1023, z = 7}] = {MAPMARK_REDNORTH, 'Saida Norte'},
    [{x = 1017, y = 940, z = 7}] = {MAPMARK_REDSOUTH, 'Saida Sul'},
    --[{x = 1170, y = 1073, z = 7}] = {MAPMARK_REDEAST, 'Saida Leste'},
    [{x = 976, y = 905, z = 7}] = {MAPMARK_REDWEST, 'Saida Oeste'}
}




function mapmarks_konoha(cid, type, msg)
 
        for pos, v in pairs(mapmarks_konoha) do
            doPlayerAddMapMark(cid, pos, v[1], v[2] or '')
        end
        doPlayerSendTextMessage(cid,18,"Sua conta agr esta com as marcacoes de Konoha registradas!")

end

function getacc_stor(cid) -- xprank 
    local ult = db.getResult('select `key` , `value` from account_storage where account_id = \''..getPlayerAccountId(cid)..'\' ')

    if (ult:getID() == -1) then
    return false
    end

    local mamae = ult:getDataString("key")
    local papai = ult:getDataString("value")

    ult:free()
    caguei = tonumber(mamae)
    peidei = tonumber(papai)

    return caguei,peidei

end

function acc_stor(cid)
 local player = db.getResult("SELECT * FROM `account_storage`;") 
 local simm = 0   
            if(player:getID() ~= -1) then
                while (true) do

                  local id = ult:getDataString("account_id")
                    if getPlayerAccountId(cid) == tonumber(id) then
                        simm = 1
                        break
                    end
    
                    if not(player:next()) then
                        break
                    end
                end
                

            end
         player:free()
         sim = tonumber(simm)
             return sim
end
