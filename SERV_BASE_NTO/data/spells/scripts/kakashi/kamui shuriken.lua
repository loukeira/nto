local config = {
	effectx = 3, --- efeito de distancia
	effectz = 196, --- efeito ao acertar o player
	percent = 100, --- porcentagem de ir pra outro target apos hitar
	delay = 300 --- velocidade com que se move (milisegundos)
}

function onCastSpell(cid, var)
local maglevel, level, mana = getPlayerMagLevel(cid), getPlayerLevel(cid), getCreatureMana(cid)
local axe, sword, club, distance = getPlayerSkillLevel(cid, 3), getPlayerSkillLevel(cid, 2), getPlayerSkillLevel(cid, 1), getPlayerSkillLevel(cid, 4)
local shield, health = getPlayerSkillLevel(cid, 5), getCreatureHealth(cid)

	local formula = {
	min = ((level + maglevel)/5 + axe + sword + club + shield + (mana/1000))/3, --- formula de dano minimo
	max = ((level + maglevel)/5 + axe + sword + club + shield + ((mana + health)/1000))/3 --- formula de dano maximo
	}
	
local pos = getCreaturePosition(cid)
doCreatureSay(cid, "Chain Lightning", 20, false, 0, pos)
hits = math.ceil(getPlayerMagLevel(cid)/10) - (math.random(0, (math.floor(getPlayerMagLevel(cid)/10))) - 1) 
target = getCreatureTarget(cid)
doBlast(cid, target, config.delay, config.effectx, config.effectz, config.percent, formula.min, formula.max, 2, hits, getCreaturePosition(cid), nil)
return true
end