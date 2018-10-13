

function onThink(cid, interval)
	if(not isCreature(cid)) then
		return true
	end


--if (getGlobalStorageValue(chunnin.storage.ativo) == -1 ) then return true end


local tempoo = 1230

if (getGlobalStorageValue(tempoo) < os.time()) then
		setGlobalStorageValue(tempoo, os.time() + 3)


			            for _, pid in pairs(getPlayersOnline()) do

			if (getPlayerItemCount(pid,id_item_pergaminho_ar)>=1) or (getPlayerItemCount(pid,id_item_pergaminho_terra)>=1) then
				        doSendMagicEffect(getCreaturePosition(pid), 306)
                        --doSendMagicEffect(getCreaturePosition(cid), 307)
            end
        end


            	local pos = {  from = {x =1096 , y =353 , stackpos = 1 },   to = { x =1146 , y =402 , stackpos =10 }  }
            	--local pos = {  from = {x =1096 , y =353 , stackpos = 1 },   to = { x =1100 , y =365 , stackpos =2 }  }

			            local coco = pos.from.x
                        local xixi = pos.from.y
                        local stak = pos.from.stackpos

                while coco<=pos.to.x do
                    while xixi <= pos.to.y do
	                        while stak <=pos.to.stackpos do

		                        if (getTileThingByPos({x = coco, y = xixi, z = 7,stackpos = stak}).itemid == id_item_pergaminho_ar) or (getTileThingByPos({x = coco, y = xixi, z = 7,stackpos = stak}).itemid == id_item_pergaminho_terra) then
				                        doSendMagicEffect({x = coco, y = xixi, z = 7,stackpos = stak}, 306)
				                        doSendMagicEffect({x = coco, y = xixi, z = 7,stackpos = stak}, 307)
		                        end

	                        stak = stak +1
	                        end

                    xixi = xixi + 1
                    stak = pos.from.stackpos
                    end

                coco = coco + 1
                xixi = pos.from.y
                end
	
		else 
	return true
	end


	
	return true
end


