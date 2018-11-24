--- Kakashi Storage śpells 

-- BUFF/FUNCTION 001 ---
sharingan1 = 113001 -- MUDAR ESSA STORAGE.. CUIDADO COM A SEQUENCIA...
sharingan2 = 113002 --MUDAR ESSA STORAGE... CUIDADO COM A SEQUENCIA.. 
-- BUFF/FUNCTION 002 --
kakashimangekyou1 = 113003
kakashimangekyou2 = 113004
-- BUFF/FUNCTION 003 --
kakashisusano1 = 113005
kakashisusano2 = 113006

-- SPELL/RAIKIRI --
Raikiri = 113007
-- SPELL/RAITON RAIJU TSUIGA --
Raiton_Raiju_Tsuiga = 113008
-- SPELL/KAMUI ATTACK --
Kamui_Attack = 113009
-- SPELL/KAMUI SHURIKEN --
Kamui_Shuriken = 113010
-- SPELL/KAMUI RAIKIRI --
Kamui_Raikiri = 113011
-- SPELL/RAITON BUSHIN --
Raiton_Bushin = 113012
-- SPELL/DOTON PRISION --
Doton_Prision = 113013
-- SPELL/KUCHYOSE --
Kuchyose = 113014
-- SPELL/KAMUI GO--
Kamui_Go = 113015

--- Naruto Storage śpells 

-- BUFF/FUNCTION 004 ---
sennin1 = 113016 -- MUDAR ESSA STORAGE.. CUIDADO COM A SEQUENCIA...
sennin2 = 113017 --MUDAR ESSA STORAGE... CUIDADO COM A SEQUENCIA.. 
-- BUFF/FUNCTION 005 --
kuramachakra1 = 113018
kuramachakra2 = 113019
-- BUFF/FUNCTION 006 --
narutorikudo1 = 113020
narutorikudo2 = 113021

-- SPELL/RASENGAN --
Rasengan = 113022
-- SPELL/ODAMA RASENGAN --
Odama_Rasengan = 113023
-- SPELL/FUUTON RASENSHURIKEN --
Fuuton_Rasenshuriken = 113024
-- SPELL/ODAMA RASENSHURIKEN --
Odama_Rasenshuriken = 113025
-- SPELL/YOTON RASENSHURIKEN --
Yoton_Rasenshuriken = 113026
-- SPELL/KAGE BUSHIN  --
Kage_Bushin = 113027
-- SPELL/TAIJU KAGE BUSHIN  --
Taiju_Kage_Bushin = 113028
-- SPELL/KUCHYOSE  --
Kuchyose = 113029
-- SPELL/KIIROI SENKO --
Kiiroi_Senko = 113030

--- Sasuke Storage śpells 

-- BUFF/FUNCTION 007 ---
sasukemangekyou1 = 113031 -- MUDAR ESSA STORAGE.. CUIDADO COM A SEQUENCIA...
sasukemangekyou2 = 113032 --MUDAR ESSA STORAGE... CUIDADO COM A SEQUENCIA.. 
-- BUFF/FUNCTION 008 --
sasukesusano1 = 113033
sasukesusano2 = 113034

-- SPELL/CHIDORI --
Chidori = 113035
-- SPELL/CHIDORI NAGASHI --
Chidori_Nagashi = 113036
-- SPELL/AMATERASU --
Amaterasu = 113037
-- SPELL/ENTON SUSANOO KAGUTSUCHI --
Enton_Susano_Kagutsuchi = 113038
-- SPELL/KIRIN --
Kirin = 113039
-- SPELL/GENJUTSU TRAP  --
Genjutsu_Trap = 113040
-- SPELL/AMATERASU ENTENKA  --
Amaterasu_Entenka = 113041
-- SPELL/KUCHYOSE --
Kuchyose = 113042
-- SPELL/NINJUTSU ESPACO-TEMPO  --
Ninjutsu_Espaco_Tempo = 113043

--- Sakura Storage śpells 

-- BUFF/FUNCTION 009 ---
sozosaisei1 = 113044 -- MUDAR ESSA STORAGE.. CUIDADO COM A SEQUENCIA...
sozosaisei2 = 113045 --MUDAR ESSA STORAGE... CUIDADO COM A SEQUENCIA.. 
-- BUFF/FUNCTION 010 --
byakugo1 = 113046
byakugo2 = 113047
-- BUFF/FUNCTION 011 --
ninposozosaisei1 = 113048
ninposozosaisei2 = 113049

-- SPELL/KONGOKEN --
Kongoken = 113050
-- SPELL/OKASHO --
Okasho = 113051
-- SPELL/PASENTO SHINGURUPANCHI --
Pasento_Shingurupanchi = 113052
-- SPELL/SEIKENTSUKI --
Seikentsuki = 113053
-- SPELL/HYAKU CHIKARA  --
Hyaku_Chikara = 113054
-- SPELL/SHOSEN NO JUTSU --
Shosen_No_Jutsu = 113055
-- SPELL/INFUIN KAI --
Infuin_kai = 113056
-- SPELL/KUCHYOSE  --
Kuchyose = 113057
-- SPELL/CHAKURA TENSO  --
Chakura_Tenso = 113058


buff = {

["kakashi"] = {sharingan1,sharingan2,kakashimangekyou1,kakashimangekyou2,kakashisusano1,kakashisusano2},

["naruto"] = {sennin1,sennin2,kuramachakra1,kuramachakra2,narutorikudo1,narutorikudo2},

["sasuke"] = {sharingan1, sharingan2, sasukemangekyou1,sasukemangekyou2, sasukesusano1,sasukesusano2},

["sakura"] = {sozosaisei1, sozosaisei2, byakugo1,byakugo2, ninposozosaisei1,ninposozosaisei2},


}


function get_buff_on(cid)
 	local i = 0

	for mar,cos in pairs(buff[getPlayerVocationName(cid)]) do
		if getPlayerStorageValue(cid, cos ) == 1 then
			i = i + 1
		end
	end


 return i
end