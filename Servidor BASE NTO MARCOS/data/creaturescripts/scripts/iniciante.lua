local config = {
	onlypremium = false, -- se precisa ser premium para não perder nada
	exp = false, -- se ao morrer o jogador irá perder exp
	skills = true, -- se ao morrer vai perder skills
	magic = true, -- se vai perder magic level
	loot = false, -- se ao morrer o jogador irá perder o loot
	level = 15 -- até que level irá proteger o player
}

function onDeath(cid, corpse, deathList)
	if isPlayer(cid) and (getPlayerLevel(cid) <= config.level) then
		if config.onlypremium == true and isPremium(cid) then
			if config.loot == false then doCreatureSetDropLoot(cid, false) end
			if config.magic == false then doPlayerSetLossPercent(cid, PLAYERLOSS_MANA, 0) end
			if config.skills == false then doPlayerSetLossPercent(cid, PLAYERLOSS_SKILLS, 0) end
			if config.exp == false then doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, 0) end
		end
	end
	return true
end