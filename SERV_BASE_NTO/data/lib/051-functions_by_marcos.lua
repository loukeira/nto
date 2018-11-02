
function get_saga(cid) -- pega a saga, pela database.
    local ult = db.getResult('select `saga`, `my_saga_max` from players where id = \''..getPlayerGUID(cid)..'\' ')

    if (ult:getID() == -1) then
    return false
    end

    local my_saga_max = ult:getDataString("my_saga_max")
    local saga = ult:getDataString("saga")
    ult:free()

    saga = tonumber(saga)
    my_saga_max = tonumber(my_saga_max)

    return saga, my_saga_max --retorna dois valores, o valor da saga atual, eo valor da saga maxima "conquistada"

end

sagas = {
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
["kakashi"] = {9,10,11,12,13,14,15,16,17},
}

