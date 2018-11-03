
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


--            db.query("UPDATE `players` SET `my_saga_max` = `my_saga_max`+1 WHERE id = "..getPlayerGUID(cid).." ;")

-- if type(my_saga_max) == "number" then
--       doPlayerSendTextMessage(cid,18,"true")
-- else
--       doPlayerSendTextMessage(cid,18,"false")
-- end

--   doPlayerSendTextMessage(cid,18, "Digite {!saga up} para subir de saga, ou {!saga down} para descer de saga!\nA sua saga atual e a: [ "..saga.." / "..my_saga_max.." ] da vocation "..getPlayerVocationName(cid).."")





--doCreatureSetLookDirection(cid, getDirectionTo(getPlayerPosition(cid), getPlayerPosition(target)))
-- if getDistanceBetween(getPlayerPosition(cid), getPlayerPosition(target)) > 1 then
-- return true
-- end
        --local tmp = getCreatureOutfit(cid)
        --if sagas[getPlayerVocationName(cid)][9] then
                --local tmp = sagas[getPlayerVocationName(cid)][9]
                  
                  -- INICIO SPELL COM OUTFIT -- 12,15
                  -- local saga,my_saga_max = get_saga(cid)
                  -- local tempo_duracao = 3  -- TEMPO EM SEGUNDOS
                  --  doSetCreatureOutfit(cid, {lookType = 691} , -2)
                  --  doSetCreatureOutfit(cid, {lookType = 691} , tempo_duracao*1000)

                  --  local maximo = (#sagas[getPlayerVocationName(cid)]) -1

                  --                 if (getPlayerStorageValue(cid,storage_akatsuki) == 1) and (saga >= maximo) then
                  --                   --addEvent(doSetCreatureOutfit, (tempo_duracao*1000)+1, cid,{lookType = 13}, -2)
                  --                    addEvent(doSetCreatureOutfit, (tempo_duracao*1000)+2, cid,{lookType = sagas[getPlayerVocationName(cid)][saga+1]},-1)
                  --                   else
                  --                  addEvent(doSetCreatureOutfit, (tempo_duracao*1000)+2, cid,{lookType = sagas[getPlayerVocationName(cid)][saga]},-1)
                  --                 end
                  -- FIM --


                                    setPlayerStorageValue(cid,storage_anbu,1)
                                    setPlayerStorageValue(cid,storage_akatsuki,-1)
   doPlayerSendTextMessage(cid,18,"anbu! "..getPlayerStorageValue(cid, storage_anbu).." " ) 
   doPlayerSendTextMessage(cid,18,"akatsuki! "..getPlayerStorageValue(cid, storage_akatsuki).." " ) 



   doPlayerSendTextMessage(cid,18,"SAgas "..#sagas[getPlayerVocationName(cid)].." " ) 

                  -- doSetCreatureOutfit(cid, {lookType = sagas[getPlayerVocationName(cid)][9]}, 900)

                --doSetCreatureOutfit(cid, tmp, 900)

        --end
local tempo_de_intervalo_da_effect = 1000

addEvent(teste, 1000, tempo_de_intervalo_da_effect, cid)

return true
end

function voltar( cid,looktype,time2,time1)

      doSetCreatureOutfit(cid,{lookType = looktype},time2)
      doSetCreatureOutfit(cid,{lookType = looktype},time1)

end


function teste(tempo_de_intervalo_da_effect ,cid)

                        if (isCreature(cid)) then
                  
                      
--mudar aqui \/        
addEvent(teste, tempo_de_intervalo_da_effect , tempo_de_intervalo_da_effect, cid)
        
                            local position = {x=getPlayerPosition(cid).x , y=getPlayerPosition(cid).y, z=getPlayerPosition(cid).z}
                            doSendMagicEffect(position, effect) 

                   addEvent(doSetCreatureOutfit, tempo_de_intervalo_da_effect, cid, {lookType = 12} , -2) )
                   addEvent(doSetCreatureOutfit, tempo_de_intervalo_da_effect, cid, {lookType = 12} , 499) )

                   addEvent(doSetCreatureOutfit, tempo_de_intervalo_da_effect, cid, {lookType = 15} , -2) )
                   addEvent(doSetCreatureOutfit, tempo_de_intervalo_da_effect, cid, {lookType = 15} , 499) )

 


                            end

end