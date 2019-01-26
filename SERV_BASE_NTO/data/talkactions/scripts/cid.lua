
function onSay(cid, words, param, channel,fromPosition)

--BUG
--XXX


-- local TYPE_EMPTY = 0
-- local TYPE_WATER = 1
-- local TYPE_BLOOD = 2
-- local TYPE_BEER = 3
-- local TYPE_SLIME = 4
-- local TYPE_MANA_FLUID = 7
-- local TYPE_LIFE_FLUID = 10
-- local TYPE_OIL = 11
-- local TYPE_WINE = 15
-- local TYPE_MUD = 19
-- local TYPE_LAVA = 26
-- local TYPE_RUM = 27
-- local TYPE_SWAMP = 28

-- table = {1,2,3,4,7,10,11,15,19,26,27,28 }
-- i = 0
-- for vod,ka in pairs(table) do

--     local position = {x = getCreaturePosition(cid).x + vod , y = getCreaturePosition(cid).y, z = getCreaturePosition(cid).z}
--     doCreateItem(2019, ka, position)


-- end


  doPlayerSendTextMessage(cid, 25, " Passou ")


-- while k < 10 do

-- repeat
--     if  (k%2 ==0) then
--     break
--     end
--      doPlayerSendTextMessage(cid, 18, ""..k.." : Passou ")


--                         for p =1, 2 do
--                         doPlayerSendTextMessage(cid, 18, " "..p.." : True ")
--                         end
-- until true

-- k = k + 1
-- end
-- local destino

            --doTeleportThing(cid, osition)
 --doTeleportThing(cid,fromPosition)

--if getPlayerCast(cid).status then






-- elseif tmp[1] == "ban" then
-- if not(tmp[2]) then
--   return doPlayerSendCancel(cid, "Specify a spectator that you want to ban.")
-- end
--
-- if doPlayerAddCastBan(cid, tmp[2]) then
--   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. tmp[2] .. "' has been banned.")
-- else
--   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. tmp[2] .. "' could not be banned.")
-- end
-- elseif tmp[1] == "unban" then
-- if not(tmp[2]) then
--   return doPlayerSendCancel(cid, "Specify the person you want to unban.")
-- end
--
-- if doPlayerRemoveCastBan(cid, tmp[2]) then
--   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. tmp[2] .. "' has been unbanned.")
-- else
--   doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. tmp[2] .. "' could not be unbanned.")
-- end


--doPlayerAddCastBan(cid, "Viewer 4")

--doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Foi")






   -- local tmp = param:explode(" ")
   --  if not(tmp[1]) then
   --      doPlayerSendCancel(cid, "Parameters needed")
   --      doPlayerPopupFYI(cid, "Available commands:\n\n/cast on - enables the stream\n/cast off - disables the stream\n/cast password {password} - sets a password on the stream\n/cast password off - disables the password protection\n/cast ban {name of spectator}, ex: /cast ban Viewer 1 - locks spectator IP from joining your stream\n/cast unban {name}, ex: /cast unban Viewer 1 - removes banishment lock\n/cast bans - shows banished spectators list\n/cast mute {name}, ex: /cast mute Viewer 1 - mutes selected spectator from chat\n/cast unmute {name}, , ex: /cast unmute Viewer 1 - removes mute\n/cast mutes - shows muted spectators list\n/cast show - displays the amount and nicknames of current spectators\n/cast status - displays stream status\n/cast update - refresh your stream status!")

   --      return true
   --  end

   --  if tmp[1] == "on"  and getPlayerCast(cid).status == false then
   --      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast has started.")
   --      doPlayerSetCastState(cid, true)
   --      doPlayerSave(cid)

   --  elseif tmp[1] == "on"  and getPlayerCast(cid).status == true then
   --      return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast has been started!!!")

   --  elseif tmp[1] == "off" and getPlayerCast(cid).status == true then
   --      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast has ended.")
   --      doPlayerSetCastState(cid, false)
   --              doPlayerSave(cid)

   --  elseif tmp[1] == "off" and getPlayerCast(cid).status == false then
   --      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast not is online!")
   --      doPlayerSetCastState(cid, false)
   --              doPlayerSave(cid)

   --  elseif isInArray({"pass", "password", "p"}, tmp[1]) then
   --      if not(tmp[2]) then
   --          return doPlayerSendCancel(cid, "You need to set a password")
   --      end

   --      if tmp[2]:len() > 10 then
   --          return doPlayerSendCancel(cid, "The password is too long. (Max.: 10 letters)")
   --      end

   --      if tmp[2] == "off" then
   --          doPlayerSetCastPassword(cid, "")
   --          doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast password has been removed.")
   --      else
   --          doPlayerSetCastPassword(cid, tmp[2])
   --          doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast password was set to: " .. tmp[2])
   --      end
   --  elseif isInArray({"desc", "description", "d"}, tmp[1]) then
   --      local d = param:gsub(tmp[1]..(tmp[2] and " " or ""), "")

   --      if not(d) or d:len() == 0 then
   --          return doPlayerSendCancel(cid, "You need to specify a description.")
   --      end

   --      if d:len() > 50 then
   --          return doPlayerSendCancel(cid, "The description is too long. (Max.: 50 letters)")
   --      end

   --      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Cast description was set to: ")
   --      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, d)
   --      doPlayerSetCastDescription(cid, d)
   --  elseif tmp[1] == "ban" then
   --      if not(tmp[2]) then
   --          return doPlayerSendCancel(cid, "Specify a spectator that you want to ban.")
   --      end

   --      local spectator = ""..tmp[2].." "..tmp[3]..""

   --      if doPlayerAddCastBan(cid,spectator) then
   --          doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. spectator .. "' has been banned.")
   --      else
   --          doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. spectator .. "' could not be banned.")
   --      end
   --  elseif tmp[1] == "unban" then
   --      if not(tmp[2]) then
   --          return doPlayerSendCancel(cid, "Specify the person you want to unban.")
   --      end
   --       local spectator = ""..tmp[2].." "..tmp[3]..""

   --      if doPlayerRemoveCastBan(cid, spectator) then
   --          doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. spectator .. "' has been unbanned.")
   --      else
   --          doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. spectator .. "' could not be unbanned.")
   --      end
   --  elseif param == "bans" then
   --      local t = getCastBans(cid)
   --      local text = "Cast Bans:\n\n"
   --      for k, v in pairs(t) do
   --          text = text .. "*" .. v.name .. "\n"
   --      end
   --      if text == "Cast Bans:\n\n" then
   --          text = text .. "No bans."
   --      end
   --      doShowTextDialog(cid, 5958, text)
   --  elseif tmp[1] == "mute" then
   --      if not(tmp[2]) then
   --          return doPlayerSendCancel(cid, "Specify a spectator that you want to mute.")
   --      end

   --       local spectator = ""..tmp[2].." "..tmp[3]..""

   --      if doPlayerAddCastMute(cid, spectator) then
   --          doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. spectator .. "' has been muted.")
   --      else
   --          doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. spectator .. "' could not be muted.")
   --      end
   --  elseif tmp[1] == "unmute" then
   --      if not(tmp[2]) then
   --          return doPlayerSendCancel(cid, "Specify the person you want to unmute.")
   --      end

   --      local spectator = ""..tmp[2].." "..tmp[3]..""

   --      if doPlayerRemoveCastMute(cid, spectator) then
   --          doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. spectator .. "' has been unmuted.")
   --      else
   --          doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Spectator '" .. spectator .. "' could not be unmuted.")
   --      end
   --  elseif param == "mutes" then
   --      local t = getCastMutes(cid)
   --      local text = "Cast Mutes:\n\n"
   --      for k, v in pairs(t) do
   --          text = text .. "*" .. v.name .. "\n"
   --      end
   --      if text == "Cast Bans:\n\n" then
   --          text = text .. "No mutes."
   --      end
   --      doShowTextDialog(cid, 5958, text)
   --  elseif param == "show" then
   --      local t = getCastViewers(cid)
   --      local text, count = "Cast Viewers:\n#Viewers: |COUNT|\n\n", 0
   --      for _,v in pairs(t) do
   --          count = count + 1
   --          text = text .. "*" .. v.name .."\n"
   --      end

   --      if text == "Cast Viewers:\n#Viewers: |COUNT|\n\n" then text = "Cast Viewers:\n\nNo viewers." end
   --      text = text:gsub("|COUNT|", count)
   --      doShowTextDialog(cid, 5958, text)
   --  elseif param == "status" then
   --      local t, c = getCastViewers(cid), getPlayerCast(cid)
   --      local count = 0
   --      for _,v in pairs(t) do count = count + 1 end

   --      doShowTextDialog(cid, 5958, "Cast Status:\n\n*Viewers:\n      " .. count .. "\n*Description:\n      "..(c.description == "" and "Not set" or c.description).."\n*Password:\n      " .. (c.password == "" and "Not set" or "Set - '"..c.password.."'"))
   --  elseif param == "update" then
   --      if getPlayerStorageValue(cid, 656544) > os.time() then
   --          return doPlayerSendCancel(cid, "You used this command lately. Wait: " .. (getPlayerStorageValue(cid, 656544)-os.time()) .. " sec.")
   --      end
   --      doPlayerSave(cid)
   --      doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "The cast settings have been updated.")
   --      doPlayerSetStorageValue(cid, 656544, os.time()+60)
   --  end


























--doPlayerSendTextMessage(cid, 18, "WORK")

--             local oi = math.floor(getGlobalStorageValue(sto_global_trainer_tempo[1]) - os.time() )


--                         doPlayerSendTextMessage(cid, 18, "Xau! Voce tem mais "..trainer_tempo(cid).." seg de trainer.")

-- if (getGlobalStorageValue(sto_global_acc_id[i]) == getPlayerAccountId(cid)) and (trainer_tempo(cid) > 0) then
--     doPlayerSendTextMessage(cid, 18, "TRUEE")

-- end








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
        -- local hpgain,hpticks,managain,manaticks = 0,0,0,0
        -- for i=1, 10 do
        --     --text = text.."\n"
        --     local item = getPlayerSlotItem(cid, i)


        --     if item.itemid > 0 then

        --                 if i == getItemInfo(item.itemid).wieldPosition then


        --             --text = text.." "..getItemNameById(item.itemid)
        --            local getitemhp = getItemInfo(item.itemid).abilities.healthGain
        --             local getitemhpticks = getItemInfo(item.itemid).abilities.healthTicks
        --             local getitemmana = getItemInfo(item.itemid).abilities.manaGain
        --              local getitemmanaticks = getItemInfo(item.itemid).abilities.manaTicks

        --             if getitemhp > 0 then
        --                 hpgain = hpgain + getitemhp
        --             end

        --             if getitemhpticks > 0 then
        --                 hpticks = hpticks + (getitemhpticks/1000)
        --             end

        --             if getitemmana > 0 then
        --                 managain = managain + getitemmana
        --             end

        --             if getitemmanaticks > 0 then
        --                 manaticks = manaticks + (getitemmanaticks/1000)
        --             end


        --            --text = text.." "..getItemNameById(item.itemid).." -"..getItemInfo(item.itemid).wieldPosition.." -"..hpgain.."- "..hpticks.."- "..managain.."- "..manaticks.."  "
        --      end
        --     end
        -- end
       -- doShowTextDialog(cid, 6528, text)





-- print(getVocationInfo(getPlayerVocation(cid)).id )
-- print(getVocationInfo(getPlayerVocation(cid)).name)




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
