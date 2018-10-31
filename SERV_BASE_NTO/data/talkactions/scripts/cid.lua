
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


                   local position = {x=getPlayerPosition(cid).x + 2 , y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
                            doSendMagicEffect(position, 291) 

                            doPlayerSendTextMessage(cid,18,""..getPlayerStorageValue(cid,kakashisusano1).."/"..getPlayerStorageValue(cid,kakashisusano2).."/"..getPlayerStorageValue(cid,mangenkyousharingan1).."/"..getPlayerStorageValue(cid,mangenkyousharingan2).."")

return true
end

