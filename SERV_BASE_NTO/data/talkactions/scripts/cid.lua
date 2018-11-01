
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

local exhaust = createConditionObject(CONDITION_EXHAUST) 
setConditionParam(exhaust, CONDITION_PARAM_TICKS, 2000)) 

--doPlayerSendCancel(cid, "You are exhausted.?")
--doSendMagicEffect(getCreaturePosition(cid), 3)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, " DIGITE CID!")
   



        if(hasCondition(cid, CONDITION_EXHAUST_HEAL)) then 
            --doPlayerSendTextMessage(cid, RETURNVALUE_YOUAREEXHAUSTED) 
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, " se foder ")

                return true
        end 

        doAddCondition(cid, exhaust) 


return true
end

