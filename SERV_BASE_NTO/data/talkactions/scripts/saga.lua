local saga = {
-- Orochimaru ---
[26] = {},
-- Kankuro ---
[25] = {309,312,311,324,319,326,328},
-- Temari ---
[24] = {378,379,380,381,382},
-- Kisame ---
[23] = {411,412,414,422,693,603,748},
-- Raikage ---
[22] = {401,402,656,749},
-- Yamato ---
[21] = {791,796,794,795,796},
-- Nagato ---
[20] = {691,692,528,797},
-- Tobirama ---
[19] = {736,737,738,739,735},
-- Hashirama ---
[18] = {623,624,625,626,758},
-- Tsunade ---
[17] = {591,592,593,594,596,635,636,637,638,639},
-- Madara ---
[16] = {715,716,717,717,719,720,721,723,726,874},
-- Minato ---
[15] = {728,729,730.731,732,733,734,757},
-- Obito ---
[14] = {477,478.479,482,484,486,755,751,620},
-- Itachi ---
[13] = {706,707,708,709,710,711,712,713},
-- Kiba ---
[12] = {69,70,196,197,198,199},
-- Gaara ---
[11] = {63,67,72,173,58,57,538},
-- Sakura ---
[10] = {174,173,665,667,664,666,668,669,670,793},
-- Bee ---
[9] = {861,862,863,864,865,866,868,869,870},
-- Kakashi ---
[8] = {633,585,586,587,588,750},
-- Hinata ---
[7] = {295,296,857,858,860,600,859,855,856,598},
-- Tenten ---
[6] = {815,816,817,818,819,820,821,822},
-- Neji ---
[5] = {833,834,835,836,837,830,831,838},
-- Shikamaru ---
[4] = {824,825,826,823,827,828},
-- Lee ---
[3] = {844,848,846,845,850,847,851,852,606,756},
-- Sasuke ---
[2] = {93,689,690,658,659,660,661,654,663,873}, 
-- Naruto ---
[1] = {840,91,841,676,842,40,842,40,305,677,686,179,683,397,607,752,875},
}


local level = 5 -- Limite para liberar uma saga nova


function onSay(cid, words, param, channel)

local storage_exhaust = 183023

if exhaustion.get(cid, storage_exhaust) >= 0 then
doPlayerSendCancel(cid, "You are exhausted.")
doSendMagicEffect(getCreaturePosition(cid), 3)
return true
end


 if(param == '') then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite {!saga up} para subir de saga, ou {!saga down} para descer de saga! "..exhaustion.get(cid,storage_exhaust).." ")
 exhaustion.set(cid, storage_exhaust, 2000) 
 return true
 end


-- if not saga[getPlayerVocation(cid)] then
-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode trocar de saga.")
-- exhaustion.set(cid, storage_exhaust, 0.5) 
-- return true
-- end

 if(param == 'up') then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce subiu de saga!")
 exhaustion.set(cid, storage_exhaust, 2000) 
 return true
 end

 if(param == 'down') then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce desceu de saga!")
 exhaustion.set(cid, storage_exhaust, 2000) 
 return true
 end

-- local t = string.explode(param, ",")


--  if(t[2]) then
--   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Could not understand.")
--   return true
--  end


--  if not (tonumber(t[1])) then
--   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o n�mero da saga que voc� deseja.")
--  exhaustion.set(cid, 120, 0.5) 
--  return true
--  end


-- if tonumber(t[1]) > #saga[getPlayerVocation(cid)] or tonumber(t[1]) < 1  then
-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa saga n�o existe.")
-- exhaustion.set(cid, 120, 0.5)
-- return true
-- end




-- if getPlayerLevel(cid) >= (tonumber(t[1])*level) then
-- doCreatureChangeOutfit(cid, {lookType = saga[getPlayerVocation(cid)][tonumber(t[1])]})
-- doSendMagicEffect(getThingPos(cid), saga[getPlayerVocation(cid)].effect)
-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce escolheu uma nova saga!")
-- doPlayerSay(cid, "Saga!!", TALKTYPE_ORANGE_1)
-- exhaustion.set(cid, 120, 0.5)
-- else
-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Desculpe, voc� precisa de level "..(tonumber(t[1]) * level).." usar essa saga.")
-- end


return true
end