
--[[

- hora deve ser exata SERVER

- para fazer o raid tera que ser ex: 00 hour(horas) e 00 minu (minutos)

- para fazer a raid na data e hora no tempo exato, uso "exact"

- para fazer a raid ocorrer todas as semanas (pelo menos 1x na semana) uso "weekly"

- o nome dos dias sao ultilizados apenas para o tipo semanal que devera ser

- "monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"

- tambem devem estar dentro de uma matriz-> {}

]]


local raids =

	{

		[1] =

			{


				type = 'exact',

				data = {day=13,month=03},

				hour = 04,

				minu = 32

			},
			[2] =

			{


				type = 'weekly',

				days = {'sunday'},

				hour = 23,

				minu = 30

			}
			-- 			[3] =

			-- {


			-- 	type = 'weekly',

			-- 	days = {'thursday'},

			-- 	hour = 02,

			-- 	minu = 17

			-- }

			

		

	}


local last_execsutes = {}


function onThink(interval, lastExecution, thinkInterval)

	local static_time = os.time()

	for k, raid in ipairs(raids) do

		if (raid.type == 'weekly') then

			local day = os.date("%A", static_time):lower()

			if isInArray(raid.days, day) then

				local hour = tonumber(os.date("%H", static_time))

				if (raid.hour == hour) then

					local minute = tonumber(os.date("%M", static_time))

					if (raid.minu == minute) then

						local day_number = tonumber(os.date("%d", static_time))

						if (last_execsutes[k] ~= day_number) then

							last_execsutes[k] = day_number


-- function premiacaoxpsemanal(pos1,pos2,pos3,a,item1,quant1,item2,quant2)
-- local town = getTownName(1)
-- local mailBoxPos = {x = pos1, y = pos2, z = pos3}
-- local parcel1 = doCreateItemEx(2595)
-- local label1 = doAddContainerItem(parcel1, 2599)
-- doSetItemText(label1, a[1] .."\n".. town)
-- local carta1 = doAddContainerItem(parcel1, 1952) 

-- local hahaha = doAddContainerItem(parcel1, item1, quant1)
-- local goldingot = doAddContainerItem(parcel1, item2,quant2)

-- doItemSetAttribute(carta1, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..a[1].."\n\nRecompensa do "..a[2].." lugar no rank xp!")
-- coco =  doTeleportThing(parcel1, mailBoxPos)
-- return coco
-- end

 primeiro,segundo,terceiro = campeoes()


premiacaoxpsemanal(136,159,6,primeiro,12372,1000,9971,10) --primeiro colocado
premiacaoxpsemanal(137,159,6,segundo,12372,700,9971,7) -- segundo colocado	
premiacaoxpsemanal(138,159,6,terceiro,12372,500,9971,5) -- terceiro colocado
		
doBroadcastMessage("[XPRANK]: CLASSIFICACAO FINAL DESSA SEMANA:\n1 - "..primeiro[1].."\n2 - "..segundo[1].."\n3 - "..terceiro[1].."\nForam os 3 melhores ganhadores de xp! parabens! A recompensa de voces esta no DP da City Principal!")

db.executeQuery("UPDATE players SET xprank = 0 ;")
setGlobalStorageValue(STORAGEXPRANK, 0)
setGlobalStorageValue(STORAGEXPRANK, os.time() + (TEMPOSEMANAL))


						end

					end

				end

			end

		elseif (raid.type == 'exact') then

			local month = tonumber(os.date("%m", static_time))

			if (raid.data.month == month) then

				local day = tonumber(os.date("%d", static_time))

				if (raid.data.day == day) then

					local hour = tonumber(os.date("%H", static_time))

					if (raid.hour == hour) then

						local minute = tonumber(os.date("%M", static_time))

						if (raid.minu == minute) then

							if (last_execsutes[k] ~= day) then

							last_execsutes[k] = day

 							-- local a,b,c = nometotal()

							-- local town = getTownName(1)
				  	-- 		local mailBoxPos = {x = 136, y = 159, z = 6}
							-- local parcel1 = doCreateItemEx(2595)
						 --    local label1 = doAddContainerItem(parcel1, 2599)
 						-- 	doSetItemText(label1, a .."\n".. town)

							-- local carta1 = doAddContainerItem(parcel1, 1952) 
							-- local item_primeiro_um = doAddContainerItem(parcel1, 2160, 1) 
							-- local item_primeiro_dois = doAddContainerItem(parcel1, 8901) 
							-- local item_primeiro_tres = doAddContainerItem(parcel1, 12372)
							-- doItemSetAttribute(carta1, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..a.."\n\nRecompensa por ter conquistado o primeiro lugar no rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
							-- doTeleportThing(parcel1, mailBoxPos)

							-- local parcel2 = doCreateItemEx(2595)
						 --    local label2 = doAddContainerItem(parcel2, 2599)
 						-- 	doSetItemText(label2, b .."\n".. town)
							-- local carta2 = doAddContainerItem(parcel2, 1952) 
							-- local item_segundo_um = doAddContainerItem(parcel2, 2160, 2) 
							-- local item_segundo_dois = doAddContainerItem(parcel2, 8901) 
							-- local item_segundo_tres = doAddContainerItem(parcel2, 12372)

							-- doItemSetAttribute(carta2, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..b.."\n\nRecompensa por ter conquistado o primeiro lugar no rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
							-- doTeleportThing(parcel2, mailBoxPos)

							-- local parcel3 = doCreateItemEx(2595)
						 --    local label3 = doAddContainerItem(parcel3, 2599)
 						-- 	doSetItemText(label3, c .."\n".. town)
							-- local carta3 = doAddContainerItem(parcel3, 1952) 
							-- local item_terceiro_um = doAddContainerItem(parcel3, 2160, 3) 
							-- local item_terceiro_dois = doAddContainerItem(parcel3, 8901) 
							-- local item_terceiro_tres = doAddContainerItem(parcel3, 12372)
							-- doItemSetAttribute(carta3, "text", "[+] XP RANK SEMANAL [+]\n\nParabens "..c.."\n\nRecompensa por ter conquistado o primeiro lugar no rank xp semanal! parabens!\n\n[+] XP RANK SEMANAL [+]")
							-- doTeleportThing(parcel3, mailBoxPos)


							-- doBroadcastMessage("[XPRANK]: CLASSIFICACAO FINAL DESSA SEMANA:\n1 - "..a.."\n2 - "..b.."\n3 - "..c.."\nForam os 3 melhores ganhadores de xp! parabens! A recompensa de voces esta no DP da Baiak City!")

							-- db.executeQuery("UPDATE players SET xprank = 0 ;")
							-- setGlobalStorageValue(STORAGEGLOBAL, 0)
						 --    setGlobalStorageValue(STORAGEGLOBAL, os.time() + (TEMPOSEMANAL))



							end

						end

					end

				end

			end

		end

	end

	return true

end