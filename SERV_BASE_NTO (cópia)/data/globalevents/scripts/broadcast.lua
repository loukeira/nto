CONFIG = {
[1] = {message = "Nao esqueca de dizer !selfsave depois de qualquer feito importante.", color = 18},
[2] = {message = "Diga !infos para informacoes.", color = 19},
[3] = {message = "Mapa: https://drive.google.com/file/d/0B5qD0i7PcFV3WHctQkpaaFFnMWM/edit?usp=sharing", color = 18},
[4] = {message = "Mapa Outland: https://drive.google.com/file/d/0B5qD0i7PcFV3QWN2LW4zNms4blE/edit?usp=sharing", color = 18},
}

function onThink()
getRandom = math.random(1, #CONFIG)
return doBroadcastMessage(CONFIG[getRandom].message, CONFIG[getRandom].color)
end