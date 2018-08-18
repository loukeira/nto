
function onSay(cid, words, param, channel)

        --local ar = 9930
        --local a = {x=1114,y=373,z=7}
        --local b = {x=1118,y=377,z=7}
        --local r1 = {x = 1117, y = 377, z = 7,stackpos = 1}
       -- q1 = getThingfromPos(r1)
               -- if isInArea(getThingPos(cid), a, b) then
                        local coco = 1114
                        local xixi = 373
                        local stak = 1

                        while coco<=1117 do
                        while xixi <= 377 do
                        while stak <=255 do

                        if getTileThingByPos({x = coco, y = xixi, z = 7,stackpos = stak}).itemid == 9930 then
                        doPlayerSendTextMessage(cid, 18, "WORK!")
                        doSendMagicEffect({x = coco, y = xixi, z = 7,stackpos = stak}, 306)
                        doSendMagicEffect({x = coco, y = xixi, z = 7,stackpos = stak}, 307)

                        end

                        stak = stak +1
                        end

                        xixi = xixi + 1
                        stak = 0

                        end
                        coco = coco + 1
                        xixi = 373

                        end
                        
                                  --doPlayerSendTextMessage(cid, 18, "entro no area")

               -- end
            
            

                        doPlayerSendTextMessage(cid, 18, "ok")


return true
end