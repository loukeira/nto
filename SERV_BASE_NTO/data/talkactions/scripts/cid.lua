
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


      
        --local text = " "  
        local hpgain,hpticks,managain,manaticks = 0,0,0,0
        for i=1, 10 do 
            --text = text.."\n" 
            local item = getPlayerSlotItem(cid, i) 
      

            if item.itemid > 0 then 

                        if i == getItemInfo(item.itemid).wieldPosition then


                    --text = text.." "..getItemNameById(item.itemid)  
                   local getitemhp = getItemInfo(item.itemid).abilities.healthGain 
                    local getitemhpticks = getItemInfo(item.itemid).abilities.healthTicks
                    local getitemmana = getItemInfo(item.itemid).abilities.manaGain 
                     local getitemmanaticks = getItemInfo(item.itemid).abilities.manaTicks                      

                    if getitemhp > 0 then
                        hpgain = hpgain + getitemhp
                    end

                    if getitemhpticks > 0 then
                        hpticks = hpticks + (getitemhpticks/1000)
                    end

                    if getitemmana > 0 then
                        managain = managain + getitemmana
                    end

                    if getitemmanaticks > 0 then
                        manaticks = manaticks + (getitemmanaticks/1000)
                    end


                   --text = text.." "..getItemNameById(item.itemid).." -"..getItemInfo(item.itemid).wieldPosition.." -"..hpgain.."- "..hpticks.."- "..managain.."- "..manaticks.."  "  
             end
            end 
        end 
       -- doShowTextDialog(cid, 6528, text) 
    




print(getVocationInfo(cid).id)
print(getVocationInfo(cid).name)




 --                                    --setPlayerStorageValue(cid,storage_anbu,1)
 --                                    --setPlayerStorageValue(cid,storage_akatsuki,-1)
 --   doPlayerSendTextMessage(cid,18,"anbu! "..getPlayerStorageValue(cid, storage_anbu).." " ) 
 --   doPlayerSendTextMessage(cid,18,"akatsuki! "..getPlayerStorageValue(cid, storage_akatsuki).." " ) 
         
 --      --db.query("UPDATE `players` SET `my_saga_max` = `my_saga_max`+10 WHERE id = "..getPlayerGUID(cid).." ;")
 --            --db.query("UPDATE `players` SET `vocation` = `vocation`+1 WHERE id = "..getPlayerGUID(cid).." ;")

 --   doPlayerSendTextMessage(cid,18," ITEM INFO: "..getItemInfo(11459).abilities.healthGain.." " )
 --      doPlayerSendTextMessage(cid,18," ITEM INFO: "..getItemInfo(11459).abilities.healthTicks.." " )

 --   doPlayerSendTextMessage(cid,18," ITEM INFO: "..getItemInfo(11459).abilities.manaGain .." " )
 --   doPlayerSendTextMessage(cid,18," ITEM INFO: "..getItemInfo(11459).abilities.manaTicks.." " )

 --      doPlayerSendTextMessage(cid,18," COCO INFO: "..getPlayerSlotItem(cid,i).itemid.." " )



 --        --             local getitemhp = getItemInfo(item.id).abilities.healthGain 
 --        --              local getitemhpticks = getItemInfo(item.id).abilities.healthTicks
 --        --             local getitemmana = getItemInfo(item.id).abilities.manaGain 
 --        --              local getitemmanaticks = getItemInfo(item.id).abilities.manaTicks 


 --      -- setField(L, "speed", item->abilities.speed);
 --      -- setField(L, "healthGain", item->abilities.healthGain);
 --      -- setField(L, "healthTicks", item->abilities.healthTicks);
 --      -- setField(L, "manaGain", item->abilities.manaGain);
 --      -- setField(L, "manaTicks", item->abilities.manaTicks);

 --   doPlayerSendTextMessage(cid,18,"Classe: "..getVocationInfo(getPlayerVocation(cid)).healthGainAmount.." " ) 
 -- doPlayerSendTextMessage(cid,18,"Classe: "..getVocationInfo(getPlayerVocation(cid)).healthGainTicks.." " ) 


 --   --doPlayerSendTextMessage(cid,18,"buff: "..get_buff_on(cid).." " ) 
 --   doPlayerSendTextMessage(cid,18,"Vocation "..getPlayerVocationName(cid).." " ) 
 --   doPlayerSendTextMessage(cid,18,"SAgas "..#sagas[getPlayerVocationName(cid)].." " ) 

                  -- doSetCreatureOutfit(cid, {lookType = sagas[getPlayerVocationName(cid)][9]}, 900)

                --doSetCreatureOutfit(cid, tmp, 900)

        --end

return true
end

      function getItemsInContainer(cont, sep) 
    local text = "" 
    local tsep = "" 
    local count = "" 
    for i=1, sep do 
        tsep = tsep.."-" 
    end 
    tsep = tsep..">" 
    for i=0, getContainerSize(cont.uid)-1 do 
        local item = getContainerItem(cont.uid, i) 
        if isContainer(item.uid) == FALSE then 
            if item.type > 0 then 
                count = "("..item.type.."x)" 
            end 
            text = text.."\n"..tsep..getItemNameById(item.itemid).." "..count 
        else 
            if getContainerSize(item.uid) > 0 then 
                text = text.."\n"..tsep..getItemNameById(item.itemid)  
                text = text..getItemsInContainer(item, sep+2) 
            else 
                text = text.."\n"..tsep..getItemNameById(item.itemid) 
            end 
        end 
    end 
    return text 
end 

