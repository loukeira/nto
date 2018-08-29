function onSay(cid, words, param)
if param == "" then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Oi! Sou o Tutor Automatico do NOMEDOSERVER. Posso lhe ajudar em algumas duvidas. Digite (!tutor numerodaduvida) para obter informacoes sobre o NOMEDOOT.\n1 - Como doar.\n2 - Premium account.\n3 - Quantidade de frags.\n4 - Experience rates.\n5 - Reportar player ou bug, entrar em contato com nossa Equipe, sugestoes, reclamacoes.\n6 - Eventos gerais.\n7 - Comandos do servidor.\n8 - Como recuperar sua account.\n\nUtilize o comando (!tutor numerodaduvida - Exemplo: "tutor 1")')
elseif param == "1" then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Para realizar uma doacao basta acessar nosso website (NOMEDOOT.Com) e clicar em (Comprar Points). Siga as instrucoes e nao esqueca de confirmar a sua doacao atraves do e-mail (EMAIL).')
elseif param == "2" then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Os benefícios de ter uma VIP TIME nada mais nada menos é de ter acesso a TODAS as cidades VIPs disponíveis no jogo. O acesso fica localizado no barco de THAIS. Cidades Vips: Pyre, Oken, Gengia, Ethno, Vengard, Ashmura, Materos, Datios.')
elseif param == "3" then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Red Skull 10 Kills e Black Skull 12 Kills ~ 1 Dia para sair Red e 2 Dias para sair Black.')
elseif param == "4" then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Para ver as rates e informações do servidor utilize o link: http://NOMEDOOT.Com/...opic=serverinfo')
elseif param == "5" then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Perguntar no HELP.')
elseif param == "6" then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Temos alguns dos eventos mais famosos, são eles: War of Emperium entre outros. Para maiores informações sobre quaisquer acesse o menu Events em http://IPDOOT.COM/')
elseif param == "7" then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Para comprar uma casa, digite !buyhouse. Para vender para outro player !sell house nomedoplayer e para abandoná-la digite !leavehouse')
elseif param == "8" then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, 'Para recuperar uma conta você deve conter a Recovery Key da mesma e ir no site no menu Lost Account, lembrando que todo o sistema é automático também. Em hipótese nenhuma será recuperada contas que não tiverem uma Recovery Key. Não insista, pois você poderá ser banido.')
end

return true
end
