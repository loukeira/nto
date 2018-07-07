function onCombat(cid, target)
if not isPlayer(target) then return true end
if getTileInfo(getThingPos(cid)).pvp then return true end
	if (getPlayerGuildId(cid) ~= getPlayerGuildId(target)) or isPlayer(target) == FALSE or getPlayerGuildId(cid) == nil or getPlayerGuildId(cid) <= 0 then
			return TRUE
	end
			doPlayerSendCancel(cid, "Voce nao pode atacar players da mesma guild.")
			return FALSE
end