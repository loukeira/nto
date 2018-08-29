-- Load spell area's data.
dofile(getDataDir() .. "spells/lib/spells.lua")

-- Basic Config
local basic = {
	ownerName = "[Staff]Uffox" -- Your character name.
}

-- Healer Config
local healer = {
	enabled = TRUE,
	sayWord = TRUE,
	healthToHeal = 4000,
	min = 700,
	max = 1200
}
-- Mana Restore Config
local manaRestore = {
	enabled = TRUE,
	manaToRestore = 800,
	min = 150,
	max = 300
}
-- Rune Config
local rune = {
	enabled = TRUE,
	lastShoot = os.clock(), -- Don't touch!
	delay = 1,
	effect = 5,
	shootEffect = 5,
	combat = COMBAT_DEATHDAMAGE,
	min = 750,
	max = 1100
}
-- Spell Config
local spell = {
	enabled = TRUE,
	sayWord = TRUE,
	lastCast = os.clock(), -- Don't touch!
	delay = 3,
	combat = COMBAT_ICEDAMAGE,
	area = createCombatArea(AREA_CROSS5X5),
	word = "Konoha Senpuu",
	effect = 5,
	min = 700,
	max = 1000
}
-- Anty Paralyze
local antyPara = {
	enabled = TRUE
}

-- Don't touch below!
local owner = 0
local target = TRUE

local function findOwner()
	local list = getSpectators(getNpcPos(), 9, 9, false)
	if (#list > 0) then
		for i = 1, #list do
			local _target = list[i]
			if (_target ~= 0) then
				if (getCreatureName(_target) == basic.ownerName) then
					selfSay("Hi ".. basic.ownerName .."!")
					selfFollow(_target)
					owner = _target
				end
			end
		end
	end
end

local function doHealOwner()
	if (getCreatureHealth(owner) < healer.healthToHeal) then
		if (healer.sayWord) then
			doCreatureSay(getNpcCid(), "Exura Sio \"".. basic.ownerName, TALKTYPE_ORANGE_1)
		end
		doCreatureAddHealth(owner, math.random(healer.min, healer.max))
		doSendMagicEffect(getCreaturePosition(getNpcCid()), CONST_ME_MAGIC_BLUE)
		doSendMagicEffect(getCreaturePosition(owner), CONST_ME_MAGIC_GREEN)
	end
end

local function doRestoreMana()
	if (getPlayerMana(owner) < manaRestore.manaToRestore) then
		doPlayerAddMana(owner, math.random(manaRestore.min, manaRestore.max))
		doSendMagicEffect(getCreaturePosition(owner), CONST_ME_MAGIC_BLUE)
	end
end

local function doUseRune()
	target = FALSE
	local shooted = FALSE
	local r_list = getSpectators(getNpcPos(), 9, 9, false)
	if (#r_list > 0) then
		for i = 1, #r_list do
			local r_target = r_list[i]
			if (isPlayer(r_target) == FALSE and isNpc(r_target) == FALSE and getNpcCid() ~= r_target and shooted == FALSE) then
				local tPos = getCreaturePosition(r_target)
				doSendMagicEffect(tPos, rune.effect)
				doSendDistanceShoot(getCreaturePosition(getNpcCid()), tPos, rune.shootEffect)
				doTargetCombatHealth(getNpcCid(), r_target, rune.combat, -rune.min, -rune.max, rune.effect)
				shooted = TRUE
				target = TRUE
			end
		end
	end
end

local function doCastSpell()
	if (spell.sayWord) then
		doCreatureSay(getNpcCid(), spell.word, TALKTYPE_ORANGE_1)
	end

	doAreaCombatHealth(getNpcCid(), spell.combat, getCreaturePosition(getNpcCid()), spell.area, -spell.min, -spell.max, spell.effect)
end

local function doRemovePara()
	if (hasCondition(owner, CONDITION_PARALYZE)) then
		doRemoveCondition(owner, CONDITION_PARALYZE)
		doSendMagicEffect(getCreaturePosition(owner), CONST_ME_MAGIC_GREEN)
	end
end

function onCreatureDisappear(cid)
	if (cid == owner) then
		owner = 0
	end
end

function onCreatureSay(cid, type, msg)
	if (cid == owner) then
		if  (msg == "disappear") then
			selfSay("Good bye ;)")
			doHealOwner()
			doRestoreMana()
			doRemoveCreature(getNpcCid())
		elseif (msg == "kick") then
			doRemoveCreature(cid)
		end
	end
end

function onThink()
	-- Try to find owner, if he's not already found.
	if (owner == 0) then
		findOwner()
		return
	end

	-- Update following
	selfFollow(owner)

	-- On floor change ;)
	local myPos = getCreaturePosition(getNpcCid())
	local ownerPos = getCreaturePosition(owner)
	if (myPos.z ~= ownerPos.z) then
		doSendMagicEffect(myPos, CONST_ME_POFF)
		doTeleportThing(getNpcCid(), ownerPos)
		doSendMagicEffect(ownerPos, CONST_ME_TELEPORT)
	end

	-- Healer
	if (healer.enabled) then
		doHealOwner()
	end

	-- Mana Restore
	if (manaRestore.enabled) then
		doRestoreMana()
	end

	-- Shoot Rune
	if (rune.enabled and rune.lastShoot < os.clock()) then
		rune.lastShoot = (os.clock()+rune.delay)
		doUseRune()
	end

	-- Cast Spell
	if (spell.enabled and target ~= FALSE and spell.lastCast < os.clock()) then
		spell.lastCast = (os.clock()+spell.delay)
		doCastSpell()
	end

	-- Anty Paralyze
	if (antyPara.enabled) then
		doRemovePara()
	end
end