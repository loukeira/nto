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