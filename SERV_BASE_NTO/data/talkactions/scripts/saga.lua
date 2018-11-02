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
-- KAKASHI ---
[1] = {9,10,11,12,13,14,15,16,17,effect = 3},
}




function get_saga(cid) -- pega a saga, pela database.
    local ult = db.getResult('select `saga` from player_saga where id = \''..getPlayerGUID(cid)..'\' ')

    if (ult:getID() == -1) then
    return false
    end

    local saga = ult:getDataString("saga")
    ult:free()

    valor_saga = tonumber(saga)
    return valor_saga

end

function onSay(cid, words, param, channel)




local waittime = 2
local storage_exhaust = 613432
if (getPlayerStorageValue(cid,storage_exhaust) <= os.time()) then
         doPlayerSendTextMessage(cid,18,"Voce so pode usar esse comando a cada "..waittime" segundos!" ) 
return true
end


 if(param == '') then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite {!saga up} para subir de saga, ou {!saga down} para descer de saga! ")
   setPlayerStorageValue(cid,storage_exhaust, os.time() + waittime)
 return true
 end

-- if not saga[getPlayerVocation(cid)] then
-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce nao pode trocar de saga.")
-- exhaustion.set(cid, storage_exhaust, 0.5) 
-- return true
-- end

 if(param == 'up') then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce subiu de saga!")
      setPlayerStorageValue(cid,storage_exhaust, os.time() + waittime)

doSetCreatureOutfit(cid, {lookType = saga[getPlayerVocation(cid)][tonumber(t[get_saga(cid)+1])]}, -1)
﻿doSendMagicEffect(getThingPos(cid), saga[getPlayerVocation(cid)].effect)

db.query("UPDATE `player_saga` SET `saga` = `saga`+1 WHERE id = "..getPlayerGUID(cid).." ;")


 return true
 end


 if(param == 'down') then
 doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Voce desceu de saga!")
         setPlayerStorageValue(cid,storage_exhaust, os.time() + waittime)

         doSetCreatureOutfit(cid, {lookType = saga[getPlayerVocation(cid)][tonumber(t[get_saga(cid)-1])]}, -1)
﻿doSendMagicEffect(getThingPos(cid), saga[getPlayerVocation(cid)].effect)

db.query("UPDATE `player_saga` SET `saga` = `saga`-1 WHERE id = "..getPlayerGUID(cid).." ;")


 return true
 end

-- local t = string.explode(param, ",")


--  if(t[2]) then
--   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Could not understand.")
--   return true
--  end


--  if not (tonumber(t[1])) then
--   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Digite o número da saga que você deseja.")
--  exhaustion.set(cid, 120, 0.5) 
--  return true
--  end


-- if tonumber(t[1]) > #saga[getPlayerVocation(cid)] or tonumber(t[1]) < 1  then
-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Essa saga não existe.")
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
-- doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Desculpe, você precisa de level "..(tonumber(t[1]) * level).." usar essa saga.")
-- end


return true
end