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
-- SPELL/DOTON PRISION --
Doton_Prision = 113012

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
-- SPELL/KIIROI SENKO  --
Kiiroi_Senko = 113027

--- Sasuke Storage śpells 

-- BUFF/FUNCTION 007 ---
sasukemangekyou1 = 113028 -- MUDAR ESSA STORAGE.. CUIDADO COM A SEQUENCIA...
sasukemangekyou2 = 113029 --MUDAR ESSA STORAGE... CUIDADO COM A SEQUENCIA.. 
-- BUFF/FUNCTION 008 --
sasukesusano1 = 113030
sasukesusano2 = 113031

-- SPELL/CHIDORI --
Chidori = 113032
-- SPELL/CHIDORI NAGASHI --
Chidori_Nagashi = 113033
-- SPELL/AMATERASU --
Amaterasu = 113034
-- SPELL/ENTON SUSANOO KAGUTSUCHI --
Enton_Susano_Kagutsuchi = 113035
-- SPELL/KIRIN --
Kirin = 113036
-- SPELL/AMATERASU ENTENKA  --
Amaterasu_Entenka = 113037


buff = {

["kakashi"] = {sharingan1,sharingan2,kakashimangekyou1,kakashimangekyou2,kakashisusano1,kakashisusano2},

["naruto"] = {sennin1,sennin2,kuramachakra1,kuramachakra2,narutorikudo1,narutorikudo2},

["sasuke"] = {sharingan1, sharingan2, sasukemangekyou1,sasukemangekyou2, sasukesusano1,sasukesusano2},



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