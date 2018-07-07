function onLogin(cid)

local config = {
-- naruto --
[1] = {839}, -- dentro do [ ] coloque o numero da vocaçao e { } coloque o numero da looktype
-- sasuke --
[17] = {688},
-- lee --
[27] = {843},
-- shikamaru --
[39] = {824},
-- neji --
[46] = {832},
-- tenten --
[55] = {814},
-- hinata --
[64] = {295},
-- kakashi --
[76] = {9},
-- killer bee --
[84] = {861},
-- sakura --
[96] = {175},
-- gaara --
[111] = {52},
-- kiba --
[123] = {853},
-- yamato --
[211] = {792},
-- temari --
[231] = {378},
-- kankuro --
[239] = {309}
}

local voc = config[getPlayerVocation(cid)]

	if voc then
		if getPlayerStorageValue(cid, 13000) < 0 then
		local newtype = {lookType = voc[1]}
		doCreatureChangeOutfit(cid, newtype)
		setPlayerStorageValue(cid, 13000, 1)
	end
	end
	return TRUE
end