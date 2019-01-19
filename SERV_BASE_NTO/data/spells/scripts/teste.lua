
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)

--setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -50.2, 1, -80.2, 1)

function onCastSpell(cid, var)
   
local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

doSendMagicEffect(position1, 196)

	--local cordenadas = {x=1010 , y=877 , z=7 }
--local quadrantes = getCreatureLookDirection(cid)
--local position = variantToPosition(var)


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


doCreatureSay(cid, "Pau no seu cu!", TALKTYPE_MONSTER)

return doCombat(cid, combat, var)
			
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
       		  		        -- doPlayerSendTextMessage(cid,18, "lugar: "..lugar.."")

--local position1 = {x=getThingPosition(getCreatureTarget(cid)).x, y=getThingPosition(getCreatureTarget(cid)).y, z=getThingPosition(getCreatureTarget(cid)).z}

--doSendMagicEffect(position1, 69)
		      --return true


		    end


