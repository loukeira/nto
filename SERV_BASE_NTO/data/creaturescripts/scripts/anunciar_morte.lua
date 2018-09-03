function onKill(cid, target, lastHit)

	if not isPlayer(target) or not isPlayer(cid) then
		return true
	end

	doBroadcastMessage(""..getCreatureName(target).."["..getPlayerLevel(target).."] acabou de ser humilhado pelo jogador "..getCreatureName(cid).."["..getPlayerLevel(cid).."].", MESSAGE_STATUS_CONSOLE_ORANGE)
    return true
end