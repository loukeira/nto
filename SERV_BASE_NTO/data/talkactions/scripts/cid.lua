
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
                   local skill = 0    

    while skill < 6 do

    doPlayerSendTextMessage(cid,18,"oi "..getPlayerSkillTries(cid,skill).." / "..max(cid,skill).." "..skill.." ")

    skill = skill +1
    end
function max(cid ,skill)
 x = getPlayerSkillLevel(cid, skill) - 10
 k = (2*x) + 1
 z = math.pow(2, k)
 valor = z * 25
return valor
end
return true
end