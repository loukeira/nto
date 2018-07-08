
function onSay(cid, words, param, channel)


   	local atual = getCreaturePosition(cid)
		local posaura = {
			{x=(atual.x)+1, y=atual.y, z=atual.z},

	}




doSendMagicEffect({x=posaura[1].x, y=posaura[1].y, z=posaura[1].z}, 207-1)

doPlayerSendTextMessage(cid,18, "SUSANO!!")

return true
end