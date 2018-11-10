jin_bijuus = {
["shukaku"] = {sto = 1, spells = {""}, bijuu_outfit = 323, skill_p = 10, time_buff = 30, effBuff = 3},
["nibi"] = {sto = 2, spells = {""}, bijuu_outfit = 323, skill_p = 10, time_buff = 60, effBuff = 3},
["sanbi"] = {sto = 3, spells = {""}, bijuu_outfit = 323, skill_p = 10, time_buff = 60, effBuff = 3},
["yonbi"] = {sto = 4, spells = {""}, bijuu_outfit = 323, skill_p = 10, time_buff = 60, effBuff = 3},
["gobi"] = {sto = 5, spells = {""}, bijuu_outfit = 323, skill_p = 10, time_buff = 60, effBuff = 3},
["rokubi"] = {sto = 6, spells = {""}, bijuu_outfit = 323, skill_p = 10, time_buff = 60, effBuff = 3},
["shichibi"] = {sto = 7, spells = {""}, bijuu_outfit = 323, skill_p = 10, time_buff = 60, effBuff = 3},
["hachibi"] = {sto = 8, spells = {""}, bijuu_outfit = 323, skill_p = 10, time_buff = 60, effBuff = 3},
["kyuubi"] = {sto = 9, spells = {""}, bijuu_outfit = 323, skill_p = 10, time_buff = 15, effBuff = 3}
}

id_name = {
-- id da storage refrente ao monstro na primeira tabela, lembrando que se for adicionar mais, a variável sto tem que dar um valor de storage referente ao novo monstro adicionado
[1] = "Shukaku",
[2] = "Nibi",
[3] = "Sanbi",
[4] = "Yonbi",
[5] = "Gobi",
[6] = "Rokubi",
[7] = "Shichibi",
[8] = "Hachibi",
[9] = "Kyuubi"
}



jin_Storage = 1234255 -- Storage que armazena o Jinchuuriki
jin_StorageTime = 1234256 -- Storage de quanto tempo o player tem de Jinchuuriki 
jin_TimeDay = 2 -- Tempo em dias que o player ficará com a Bijuu selada nele
jin_percentHp = 20 -- Porcentagem que precisa para selar o Bijuu
jin_cond_id = 23 -- Sub-Id da condição do buff, assim não da conflito com outros buffs.
jin_cond_id = 24 -- Sub-Id da condição do outfit, assim não da conflito com outros buffs.

jin = {
-- jin.getPlayerBijuu(uid)
getPlayerBijuu = function(uid) -- retorna o nome da biju do player em string.
if getPlayerStorageValue(uid, jin_Storage) == -1 then
  return 0
 end
return id_name[getPlayerStorageValue(uid, jin_Storage)]
end,

-- jin.setPlayerBijuu(uid, BijuuId)
setPlayerBijuu = function(uid, BijuuId) -- Set no player a Bijuu tornando-o um Jinchuuriki.
return doCreatureSetStorage(uid, jin_Storage, BijuuId)
end,

-- jin.setBijuuTime(uid, days)
setBijuuTime = function(uid, days) -- Seta a quantidade de dias que o player ficará com a bijuu.
return doCreatureSetStorage(uid, jin_StorageTime, os.time()+days*24*60*60)
end,

-- jin.getPlayerBijuuTime(uid)
getPlayerBijuuTime = function(uid) -- Retorna tempo e hora que falta pra acabar o Jinchuuriki do Player.
if getPlayerStorageValue(uid, jin_StorageTime)-os.time() <= 0 then
return "Tempo restante é de 0 dias, 0 horas e 0 segundos."
end
local tempo = getPlayerStorageValue(uid, jin_StorageTime)-os.time()
local segundos =  tempo % 60
local minutos =  math.floor(tempo%3600/60)
local horas = math.floor(tempo%86400/3600)
local dias = math.floor(tempo%604800/86400)
return "Tempo restante é de "..dias.." dia"..(dias > 1 and "s" or "")..", "..horas.." hora"..(horas > 1 and "s" or "")..", "..minutos.." minuto"..(minutos > 1 and "s"or "").." e "..segundos.." segundo"..(segundos > 1 and "s" or "")..""
end,



-- jin.doPlayerSetSpells(uid, spells)
doPlayerSetSpells = function(uid, spells) -- Faz o player aprender mais de 1 spells.
if type(spells) == "table" then
for i = 1, #spells do
doPlayerLearnInstantSpell(uid, spells[i])
end
else
doPlayerLearnInstantSpell(uid, spells)
end
end,


-- jin.doPlayerRemoveSpells(uid, spells)
doPlayerRemoveSpells = function(uid, spells) -- Remove todas as spells aprendidas do player.
if type(spells) == "table" then
for i = 1, #spells do
doPlayerUnlearnInstantSpell(uid, spells[i])
end
else
doPlayerUnlearnInstantSpell(uid, spells)
end
end,


-- jin.doPlayerRemoveJinchuuriki(uid)
doPlayerRemoveJinchuuriki = function(uid) -- Remove o Jinchuuriki do player.
if jin.getPlayerBijuu(uid) ~= 0 then
jin.doPlayerRemoveSpells(uid, jin_bijuus[jin.getPlayerBijuu(uid):lower()].spells)
doCreatureSetStorage(uid, jin_StorageTime, -1)
doCreatureSetStorage(uid, jin_Storage, -1)
end
end
}
