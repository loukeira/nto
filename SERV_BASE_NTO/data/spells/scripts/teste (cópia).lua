function onCastSpell(cid, var, isHotkey)
if not cid then
	return true
	end    
	--local cordenadas = {x=1010 , y=877 , z=7 }

local cordenadas = {x=1010 , y=877 , z=7 }
local position1 = getCreaturePosition(cid)
--local quadrantes = getCreatureLookDirection(cid)
local position = variantToPosition(var)

if getTileInfo(position).protection then

       		  doPlayerSendTextMessage(cid,18, "PZ ZONE!")
	return true
end

-- local variavelx = math.random(2,6)
-- local variavely = math.random(2,6)
-- local quadrantes = math.random(1,4)

-- if quadrantes == 1 then
-- position = {x= position1.x+variavelx,y = position1.y+variavely,z = position1.z}
-- elseif quadrantes == 2 then
-- 	variavelx,variavely = -variavelx, variavely
-- position = {x= position1.x-variavelx,y = position1.y+variavely,z = position1.z}
-- elseif quadrantes == 3 then
-- 	variavelx, variavely = -variavelx, -variavely
-- position = {x= position1.x-variavelx,y = position1.y-variavely,z = position1.z}
-- elseif quadrantes == 4 then
-- 	variavelx, variavely = variavelx, -variavely
-- position = {x= position1.x+variavelx,y = position1.y-variavely,z = position1.z}
-- end


-- METODO POR DIREÇAO DO OLHAR
-- if quadrantes == 0 then
-- 	lugar = math.random(1,3)
-- 	if lugar == 1 then variavelx = -variavelx elseif lugar == 2 then variavelx = 0 elseif lugar == 3 then variavelx = variavelx end
-- position = {x= position1.x+variavelx,y = position1.y-variavely,z = position1.z}

-- elseif quadrantes == 1 then
--  	lugar = math.random(1,3)
-- 	if lugar == 1 then variavely = -variavely elseif lugar == 2 then variavely = 0 elseif lugar == 3 then variavely = variavely end
-- position = {x= position1.x+variavelx,y = position1.y+variavely,z = position1.z}

-- elseif quadrantes == 2 then
-- 	lugar = math.random(1,3)
-- 	if lugar == 1 then variavelx = -variavelx elseif lugar == 2 then variavelx = 0 elseif lugar == 3 then variavelx = variavelx end
-- position = {x= position1.x+variavelx,y = position1.y+variavely,z = position1.z}

-- elseif quadrantes == 3 then
-- 	lugar = math.random(1,3)
-- 	if lugar == 1 then variavely = -variavely elseif lugar == 2 then variavely = 0 elseif lugar == 3 then variavely = variavely end
-- position = {x= position1.x-variavelx,y = position1.y+variavely,z = position1.z}
-- end

if not position then        
	return  true  
	 end   
		  
			local path = getCreaturePathTo(cid, position, 8 )  
		  	if path then  

		        --doPlayerSendTextMessage(cid,18, "quadr: "..quadrantes.."")
		         --doPlayerSendTextMessage(cid,18, "x: "..variavelx.."")
		         --doPlayerSendTextMessage(cid,18, "y: "..variavely.."")
		         --doPlayerSendTextMessage(cid,18, "lugar: "..lugar.."")

		   	  doTeleportThing(cid, position)
       		  doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		    return true 
		    else 
		 --    	local i = 1
		 --    	local j = 1
		 --    		while j < 5 do
		 --    					    	while i < 4 do

		 --    			if j == 1 then variavelx ,variavely = variavelx,variavely end
		 --    			if j == 2 then variavelx,variavely = -variavelx, variavely end
		 --    			if j == 3 then variavelx, variavely = -variavelx, -variavely end
		 --    			if j == 4 then variavelx, variavely = variavelx, -variavely end
		 --    			variavelx, variavely  = i,j
			-- position = {x= position1.x+variavelx,y = position1.y+variavely,z = position1.z}
			-- 										if getCreaturePathTo(cid, position, 4)   then break end
			-- 		    						i = i+ 1

			-- 							end
			-- 		j = j +1
			-- 		i = 1
		 --        end

	 -- doTeleportThing(cid, position)
       		 -- doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
       		  doPlayerSendTextMessage(cid,18, "NAO DEU!")
       		  		        -- doPlayerSendTextMessage(cid,18, "lugar: "..lugar.."")


		        doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
		      end  


		    end


