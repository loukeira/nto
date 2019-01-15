local pos1 = {x=1000,y=1000,z=7}
local pos2 = {x=999,y=999,z=7}
local pos3 = {x=998,y=998,z=7}

local x = {1000,999, 998}
local y = {1000,999, 998}
local z = {7}

function isInLocal(cid,posx,posy,posz)
if(getPlayerPosition(cid).x) == posx and (getPlayerPosition(cid).y) == posy and (getPlayerPosition(cid).z) == posz then
return true
else
return false
end
end

function onStepIn(cid, item, item2, position, fromPosition)
local id_card = 7443


  if not isPlayer(cid) then
   return true
  end

local pos = getCreaturePosition(cid)


  if (item.actionid == 4540) then

			if isInArea(pos, pos1, pos1) and isPlayer(cid) == true then
			doPlayerSendTextMessage(cid,18,"Ja tem player!")
			doTeleportThing(cid,fromPosition)	
			doSendMagicEffect(getCreaturePosition(cid), 3)
				return true

			elseif isInArea(pos, pos2, pos2) and isPlayer(cid) == true then
			doPlayerSendTextMessage(cid,18,"Ja tem player!")
			doTeleportThing(cid,fromPosition)	
			doSendMagicEffect(getCreaturePosition(cid), 3)
				return true

			elseif isInArea(pos, pos3, pos3) and isPlayer(cid) == true then
			doPlayerSendTextMessage(cid,18,"Ja tem player!")
			doTeleportThing(cid,fromPosition)	
			doSendMagicEffect(getCreaturePosition(cid), 3)
				return true

			else

				if getPlayerItemCount(cid,id_card) >=1 then
				doPlayerSendTextMessage(cid,18,"VOCE TEM O CARD!")
				doSendMagicEffect(getCreaturePosition(cid), 3)
				else
				doPlayerSendTextMessage(cid,18,"VOCE NAO TEM O CARD!")
				doTeleportThing(cid,fromPosition)
				doSendMagicEffect(getCreaturePosition(cid), 3)
				return true
				end
			end
      
    end
				
return true
end



-- CARLIN WAR
-- local sto = 93122
-- if getGlobalStorageValue(sto) - os.time() < 0 then
-- 			setGlobalStorageValue(sto,os.time() + 5)
-- 		for _, pid in pairs(getPlayersOnline()) do
--                             if isInRange(getThingPos(pid), pos, pos1) then                            
--  							 doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "TRUE")
--   							break
--                             end
--         end
-- end