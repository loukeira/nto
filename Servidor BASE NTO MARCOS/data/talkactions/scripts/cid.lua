
function onSay(cid, words, param, channel)


--    	local atual = getCreaturePosition(cid)
-- 		local posaura = {
-- 			{x=(atual.x)+1, y=atual.y, z=atual.z},

-- 	}




-- doSendMagicEffect({x=posaura[1].x, y=posaura[1].y, z=posaura[1].z}, 207-1)

-- doPlayerSendTextMessage(cid,18, "SUSANO!!")
local coco = getCreaturePosition(cid)
local k = 1
                for a,i in pairs(coco) do
                	if k == 1 then
                	y = i
                end
                if k == 2 then
                	x = i 
                end
                if k == 4 then
                	z = i
                end

                	k = k+1
                end
            
 doPlayerSendTextMessage(cid,18, "  "..x.." , "..y..", "..z.." ")


return true
end