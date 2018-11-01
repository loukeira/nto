
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


local waittime = 3
local storage = 113007


-- if (getPlayerStorageValue(cid,storage) <= os.time()) then
--         setPlayerStorageValue(cid,storage, os.time() + waittime)
--         doPlayerSendTextMessage(cid,18,"coco!" ) 
-- end
--if exhaustion.check(cid, storage) then
--doPlayerSendTextMessage(cid,18, "Aguarde " .. exhaustion.get(cid, storage) .. " segundos para usar a spell novamente.")
--doPlayerSendTextMessage(cid,18, "Aguarde " .. exhaustion.check(cid, storage) .. " segundos para usar a spell novamente.")
--return false
--end

local condition = createConditionObject(CONDITION_MANASHIELD)
setConditionParam(condition, CONDITION_PARAM_TICKS, 2000)
setCombatCondition(combat, condition)

   doPlayerSendTextMessage(cid,18,"coco!" ) 

     


return true
end

