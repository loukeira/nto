
function onSay(cid, words, param, channel)

                        -- local coco = 1114
                        -- local xixi = 373
                        -- local stak = 1

                        -- while coco<=1117 do
                        -- while xixi <= 377 do
                        -- while stak <=255 do

                        -- if getTileThingByPos({x = coco, y = xixi, z = 7,stackpos = stak}).itemid == 9930 then
                        -- doPlayerSendTextMessage(cid, 18, "WORK!")
                        -- doSendMagicEffect({x = coco, y = xixi, z = 7,stackpos = stak}, 306)
                        -- doSendMagicEffect({x = coco, y = xixi, z = 7,stackpos = stak}, 307)

                        -- end

                        -- stak = stak +1
                        -- end

                        -- xixi = xixi + 1
                        -- stak = 0

                        -- end
                        -- coco = coco + 1
                        -- xixi = 373

                        -- end



          local delta = getPlayerSpentMana(cid) - (0*getPlayerRequiredMana(cid,getPlayerMagLevel(cid)+1))
          local deltaa = delta/10
          doPlayerAddSpentMana(cid, -1)

               -- local file = io.open('mana.txt','a')
                db.query("UPDATE players SET maglevel = `maglevel`-1 WHERE id = "..getPlayerGUID(cid).." ;")
                db.query("UPDATE players SET manaspent = 250 WHERE id = "..getPlayerGUID(cid).." ;")


    doPlayerSendTextMessage(cid,18,"required mana: "..getPlayerRequiredMana(cid,getPlayerMagLevel(cid)+1).." ! " )

    doPlayerSendTextMessage(cid,18, ""..getPlayerSpentMana(cid).."")
    --local i = 2

           -- while i <103 do
            --file:write("MANA REQUER. Para O NIVEL "..i.." de ML: "..getPlayerRequiredMana(cid,i).."\n")
            --file:write(""..getPlayerRequiredMana(cid,i).."\n")

              --  i = i +1
            --end
            --file:close()
           --  doPlayerSendTextMessage(cid, MESSAGE_STATUS_WARNING,'terminou o loop!')
return true
end

function max(cid ,skill)
 x = getPlayerSkillLevel(cid, skill) - 10
 k = (2*x) + 1
 z = math.pow(2, k)
 valor = z * 25
return valor
end

function mana(cid) 
    local res = db.getResult('select `manaspent`, `maglevel` from players where name = \''..getPlayerName(cid)..'\'')

    if(res:getID() == -1) then
    return false
    end

    local ret = res:getDataString("manaspent")
    local reto = res:getDataString("maglevel")

    res:free()
     
    xixi = tonumber(ret) 
    retoo = tonumber(reto)
    return xixi,retoo
end