local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)            npcHandler:onCreatureAppear(cid)            end
function onCreatureDisappear(cid)        npcHandler:onCreatureDisappear(cid)            end
function onCreatureSay(cid, type, msg)        npcHandler:onCreatureSay(cid, type, msg)        end
function onThink()                npcHandler:onThink()                    end
 
-- QUEST --

local mapMarks = {
	[{x = 1112, y = 1066, z = 7}] = {MAPMARK_LOCK, 'DP'},
	[{x = 1083, y = 1055, z = 7}] = {MAPMARK_DOLLAR, 'Bank'},	
	[{x = 1113, y = 1023, z = 7}] = {MAPMARK_REDNORTH, 'Saida Norte'},
	[{x = 1125, y = 1164, z = 7}] = {MAPMARK_REDSOUTH, 'Saida Sul'},
	[{x = 1170, y = 1073, z = 7}] = {MAPMARK_REDEAST, 'Saida Leste'},
	[{x = 1026, y = 1054, z = 7}] = {MAPMARK_REDWEST, 'Saida Oeste'}
}



function MapInicio(cid, type, msg)
 

		npcHandler:say('Prontinho!.', cid)
		for pos, v in pairs(mapMarks) do
			doPlayerAddMapMark(cid, pos, v[1], v[2] or '')
		end
		
end
 
	local node1 = keywordHandler:addKeyword({'servidor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'O que voce quer saber mais especificadamente? {quests} , {itens} , {hunts} , {sistemas} , {eventos} , {mapa}, ou falar com o {ADM}. Lembrando que todas essas informacoes estao no {site} do servidor, e no nosso {wiki}! Caso nao queira nada, diga {nao}.'})
    node1:addChildKeyword({'nao'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Blz, Flw!', reset = true})
 
	local node2 = keywordHandler:addKeyword({'quests'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'A nossas quests estao espalhadas pelo mapa, algumas delas dao boas recompensas de {itens}, e existe a procura aos monstros, conhecidas como task tambem. As nossas quests sao mostradas no {questlog}!'})
    node2:addChildKeyword({'questlog'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'O questlog esta no seu menu a direita ( > ), na aba Quests/QuestLog.  Ele auxilia para ver o desenvolvimento das suas missoes!'})
	
	local node3 = keywordHandler:addKeyword({'itens'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Os nossos itens sao separados em 5 geracoes! A {primeira} e obtido in game, isso e tudo que eu sei. A {segunda} e obtida atraves do site do servidor. A {terceira} e {quarta} geracao sao obtidas em quests conhecidas. A {quinta} seria o restante dos itens, sendo acessado por npcs, coletados em monstros e etc.'})
		node3:addChildKeyword({'primeira'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'E serio, isso e tudo que eu sei! Podendo ser obtido in game de alguma forma!'})
 		node3:addChildKeyword({'segunda'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Voce pode acessar o site do servidor gran baiak, e ter maiores informacoes no shop do site!'})
		node3:addChildKeyword({'terceira'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Pode ser coletado em quest ja conhecida da maioria! Infelizmente nao sei onde se localiza, nem qual especificadamente! Ha rumores que deve obter os itens da quarta geracao para conseguir esses.... '})
		node3:addChildKeyword({'quarta'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Pode ser coletado em quest ja conhecida da maioria! Infelizmente nao sei onde se localiza, nem qual especificadamente!'})
		node3:addChildKeyword({'quinta'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'E uma categoria mais acessivel, podendo ser obtido por npcs, monstros, entre outros!'})

	local node4 = keywordHandler:addKeyword({'hunts'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'A nossas hunts estao espalhadas pelo {mapa}, ou nas {hunt castle} e {cave exclusiva}... Para saber algumas hunts iniciais, procure os NPCs guias, localizados no dp de cada cidade, que irao marcar no mapa para voce alguma delas !'})
    node4:addChildKeyword({'hunt castle'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'As hunts dos Castles sao acessadas apenas pela sua guild, e para isso voce deve conquista-lo(s) !  Para mais informacoes, digite {sistemas} !'})
    node4:addChildKeyword({'cave exclusiva'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'As caves exclusivas sao hunts privadas, com uma boa xp e bom loot, na qual apenas um jogador pode cacar por um determinado tempo. Para conseguir um ticket de acesso, basta trocar moedas conquistadas em {eventos} , no NPC EVENT, ou adquirindo no Shop do Site!'})

	local node5 = keywordHandler:addKeyword({'eventos'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Possuimos alguns eventos automaticos: Real team battle ({rtb}), Battlefield ({btf}), Capture the Flag ({ctf}), FireStorm ({fire}), Zombie Event ({zombie}), Desert War ({desert}), Defense the Towers ({dtt}) e Snowball ({snow})   E se iniciam no templo da cidade principal. Pode ter tambem eventos iniciados pelo {ADM}, e outros irao surgir conforme updates, podem ficar tranquilos!'})
		node5:addChildKeyword({'rtb'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Calma que vou colocar as recompensas aqui!'})
 		node5:addChildKeyword({'btf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Calma que vou colocar as recompensas aqui!'})
		node5:addChildKeyword({'ctf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Calma que vou colocar as recompensas aqui!'})
		node5:addChildKeyword({'fire'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Calma que vou colocar as recompensas aqui!'})
		node5:addChildKeyword({'zombie'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Calma que vou colocar as recompensas aqui!'})
		node5:addChildKeyword({'desert'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Calma que vou colocar as recompensas aqui!'})
		node5:addChildKeyword({'dtt'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Calma que vou colocar as recompensas aqui!'})
		node5:addChildKeyword({'snow'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Calma que vou colocar as recompensas aqui!'})

	local node6 = keywordHandler:addKeyword({'ADM'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ' Voce pode falar sobre esses assuntos com o ADM (pontos, reportbug, criticas e sugestoes):                                                                                                                                          Pagina do facebook Gran Baiak, ou diretamente via Whatsapp {+55 62 8220 8960}'})
	local node7 = keywordHandler:addKeyword({'adm'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = ' Voce pode falar sobre esses assuntos com o ADM (pontos, reportbug, criticas e sugestoes):                                                                                                                                          Pagina do facebook Gran Baiak, ou diretamente via Whatsapp {+55 62 8220 8960}'})

	local node8 = keywordHandler:addKeyword({'mapa'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Pois bem, nosso mapa e feito para um bom roleplay game, possuindo 5 {cidades} (Irao vir mais!) Acreditamos que ter um mapa com missoes, misterios, e um bom roleplay, possa auxiliar tanto para um bom entretenimento (pvp, exivar, etc) quanto para a boa jogabilidade do servidor! Pensamos em casar o bom e velho Baiak com uma jogabilidade 100%,  Feito para voces!!!'})
		node8:addChildKeyword({'cidade'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'No nosso mapa, temos atualmente 5 cidades: Norte , Sul , Leste (>) , Oeste (<)  e a Cidade Principal no meio! Elas possuem diversas hunts, e tambem alguns misterios escondidos! '})

	local node9 = keywordHandler:addKeyword({'sistemas'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Vou falar apenas um resumo dos sitemas que existem ok?! Mais informacoes temos no site ou wiki do servidor!  Temos o sistema do Bounty Hunter , My Friend, Falta preencher aqui'})


		
	local node10 = keywordHandler:addKeyword({'site'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'www.granbaiak.com'})
	local node11 = keywordHandler:addKeyword({'wiki'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'https://granbaiak.wixsite.com/gran-baiak'})

 
 
npcHandler:addModule(FocusModule:new())