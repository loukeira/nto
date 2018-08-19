

function onThink(cid, interval)
	if(not isCreature(cid)) then
		return true
	end


--5 minutos
local minutos = 5
local tempo_arena = 60*minutos

local quantplayer = chunnin.storage.quant_player_tem_para_arena


if (getGlobalStorageValue(chunnin.storage.arena_aux_1) == 1) and (getGlobalStorageValue(chunnin.storage.arena_aux_3) == -1) then
		for _, pid in pairs(getPlayersOnline()) do
			if isInArea(getThingPos(pid), chunnin.pos.wait_arena2.from1, chunnin.pos.wait_arena2.to1) then
				if getGlobalStorageValue(chunnin.storage.arena_aux_4) == -1 then setGlobalStorageValue(chunnin.storage.arena_aux_4,0) end
				if getGlobalStorageValue(chunnin.storage.arena_aux_4) < 2 then
					setGlobalStorageValue(chunnin.storage.arena_aux_4,getGlobalStorageValue(chunnin.storage.arena_aux_4)+1)
					if getGlobalStorageValue(chunnin.storage.arena_aux_4)==1 then
					doTeleportThing(pid, chunnin.pvp1)
				    setPlayerStorageValue(pid,chunnin.pvp.oitavas,1)

					doCreatureSetNoMove(pid, true)
			        addEvent(chunnin.enableMove, 4000, pid)



					elseif getGlobalStorageValue(chunnin.storage.arena_aux_4) ==2 then
					doTeleportThing(pid, chunnin.pvp2)
					doCreatureSetNoMove(pid, true)
					addEvent(chunnin.enableMove, 4000, pid)
					setPlayerStorageValue(pid,chunnin.pvp.oitavas,1)




					end
				end
			else
			setGlobalStorageValue(chunnin.storage.arena_aux_3,1)
			end
		end
				


elseif (getGlobalStorageValue(chunnin.storage.arena_aux_3) ==1 ) and (getGlobalStorageValue(chunnin.storage.arena_aux_5)== -1) then
		for _, pid in pairs(getPlayersOnline()) do
			if isInArea(getThingPos(pid), chunnin.pos.wait_arena3.from1, chunnin.pos.wait_arena3.to1) then
				if getGlobalStorageValue(chunnin.storage.arena_aux_6) == -1 then setGlobalStorageValue(chunnin.storage.arena_aux_6,0) end
				if getGlobalStorageValue(chunnin.storage.arena_aux_6) < 2 then
					setGlobalStorageValue(chunnin.storage.arena_aux_6,getGlobalStorageValue(chunnin.storage.arena_aux_6)+1)
					if getGlobalStorageValue(chunnin.storage.arena_aux_6)==1 then
					doTeleportThing(pid, chunnin.pvp21)
					doCreatureSetNoMove(pid, true)
			        addEvent(chunnin.enableMove, 4000, pid)
					setPlayerStorageValue(pid,chunnin.pvp.quartas,1)

					elseif getGlobalStorageValue(chunnin.storage.arena_aux_6) ==2 then
					doTeleportThing(pid, chunnin.pvp22)
					doCreatureSetNoMove(pid, true)
					addEvent(chunnin.enableMove, 4000, pid)
					setPlayerStorageValue(pid,chunnin.pvp.quartas,1)




					end
				end
			else
			setGlobalStorageValue(chunnin.storage.arena_aux_5,1)
			end
		end

elseif (getGlobalStorageValue(chunnin.storage.arena_aux_5) ==1 ) and (getGlobalStorageValue(chunnin.storage.arena_aux_7)== -1) then
		for _, pid in pairs(getPlayersOnline()) do
			if isInArea(getThingPos(pid), chunnin.pos.wait_arena4.from1, chunnin.pos.wait_arena4.to1) then
				if getGlobalStorageValue(chunnin.storage.arena_aux_8) == -1 then setGlobalStorageValue(chunnin.storage.arena_aux_8,0) end
				if getGlobalStorageValue(chunnin.storage.arena_aux_8) < 2 then
					setGlobalStorageValue(chunnin.storage.arena_aux_8,getGlobalStorageValue(chunnin.storage.arena_aux_8)+1)
					if getGlobalStorageValue(chunnin.storage.arena_aux_8)==1 then
					doTeleportThing(pid, chunnin.pvp31)
					doCreatureSetNoMove(pid, true)
			        addEvent(chunnin.enableMove, 4000, pid)
			    	setPlayerStorageValue(pid,chunnin.pvp.semi,1)


					elseif getGlobalStorageValue(chunnin.storage.arena_aux_8) ==2 then
					doTeleportThing(pid, chunnin.pvp32)
					doCreatureSetNoMove(pid, true)
					addEvent(chunnin.enableMove, 4000, pid)
					setPlayerStorageValue(pid,chunnin.pvp.semi,1)




					end
				end
			else
			setGlobalStorageValue(chunnin.storage.arena_aux_7,1)
			end
		end

elseif (getGlobalStorageValue(chunnin.storage.arena_aux_7) ==1 ) and (getGlobalStorageValue(chunnin.storage.arena_aux_9)== -1) then
		for _, pid in pairs(getPlayersOnline()) do
			if isInArea(getThingPos(pid), chunnin.pos.wait_arena5.from1, chunnin.pos.wait_arena5.to1) then
				if getGlobalStorageValue(chunnin.storage.arena_aux_10) == -1 then setGlobalStorageValue(chunnin.storage.arena_aux_10,0) end
				if getGlobalStorageValue(chunnin.storage.arena_aux_10) < 2 then
					setGlobalStorageValue(chunnin.storage.arena_aux_10,getGlobalStorageValue(chunnin.storage.arena_aux_10)+1)
					if getGlobalStorageValue(chunnin.storage.arena_aux_10)==1 then
					doTeleportThing(pid, chunnin.pvp41)
					doCreatureSetNoMove(pid, true)
			        addEvent(chunnin.enableMove, 4000, pid)
			     	setPlayerStorageValue(pid,chunnin.pvp.final,1)


					elseif getGlobalStorageValue(chunnin.storage.arena_aux_10) ==2 then
					doTeleportThing(pid, chunnin.pvp42)
					doCreatureSetNoMove(pid, true)
					addEvent(chunnin.enableMove, 4000, pid)
					setPlayerStorageValue(pid,chunnin.pvp.final,1)




					end
				end
			else
			setGlobalStorageValue(chunnin.storage.arena_aux_9,1)
			end
		end




end




	
	return true
end


