 --[[ <(Advanced Reset System 2.0)>

           Autor: MarcelloMkez. Contato: (marcello_dirt@hotmail.com)
           Versão: 2.0
           Testado em: 8.50 e 8.60
           TFS: 0.3.6 and 0.4.0
           Fórum: http://www.xtibia.com/forum/topic/142463-advanced-reset-system-20/

       -=[Características]=-
        ~( Versão 2.0 )~

       - Resets agora Armazenados na DataBase; (Sem Valor de Storage)
       - Instala o System e cria a Tabela de Resets com o comando "/installreset";
       - Resets no Look do jogador ex: 22:10 You see Marcello [Reset 2] (Level 8). He is an elder druid.;
       - [STAGES] para "Premium Account" e "Free Account";  ]] 

--=[Functions]=--

-- installReset()'                    [Instala o Sistema.]
-- tableResetInstall()'               [Verifica Se o Sistema ja foi instaladao.]
-- nowReseting()'                     [Verifica, retorna o erro ou reseta.]
-- getPlayerReset(cid)'               [Pega numero de resets do player.]
-- checLevelStageReset(cid)'          [Verifica o Level para Resetar.]
-- newReset(cid)'                     [Verifica todas as Condições de Reset.]
-- addValue(value)'                   [Adiciona numero de resets.]

--=[Comandos de Jogadores]=--
--  "/installreset"   -- Só será usado uma vez, para instalar o sistema.
--  "!resetar"        -- Para Resetar.

function onSay(cid, words, param)

            if words =="!resetar" then

--[ Condições de Reset ] --
local coNdConf = {

needPz = true,                  -- Precisa estar em Pz pra resetar?               [true, false]
needPa = false,                 -- Precisa ser Premium Account Pra resetar?       [true, false]
withe = false,                  -- Players com Pk Withe podem resetar?            [true, false]
red = false,                    -- Players com Pk Red pode resetar?               [true, false]
battle = false,                 -- Players precisão estar sem battle pra resetar? [true, false]
teleport = true,                -- Teleportar Player para o templo após resetar?  [true, false]
look = false,                   -- Aparecer Resets no Look do Player?             [true, false]
pid = getPlayerGUID(cid),       -- Não Mexer.


--[ Configurações do Reset ] --
resetConf = {

Level = 400,                    -- Level Necessário para Resetar.                         [Valor]
backLvl = 8,                    -- Level que voltará após o Reset.                        [Valor]
time = 5,                       -- Tempo para o Player deslogar ao resetar, em segundos.  [Valor]

  },
}
          --[[>> STAGES <<]]--
x=true;X=true -- Não Mexer.
local stage = {Abilitar = {x}, Desabilitar = {},     --<< Abilitar Stages?? >>--            [{x};{}]

--      [RESETS]    |  [PREMMY]  |   [FREE]
 stage1= {resets= 4,  premmy= 330, free= 400},
 stage2= {resets= 9,  premmy= 340, free= 420},     -- EXPLICANDO e Configurando stages. (Se estiver Abilitado [Abilitar = {x}])
 stage3= {resets= 14, premmy= 355, free= 430},     -- resets = Número de resets para o Stage;
 stage4= {resets= 19, premmy= 360, free= 440},     -- premmy = Level necessário para Premium Accounts;
 stage5= {resets= 24, premmy= 370, free= 450},     -- free    = Level necessário para Free Accounts;
 stage6= {resets= 29, premmy= 380, free= 460},       -- Coloque em Ordem...
 stage7= {resets= 35, premmy= 400, free= 470},     -- [OBS: MARQUE UM "X" PARA ABILITAR OU DESABILITAR OS STAGES]
 stage8= {resets= 40, premmy= 410, free= 480},     -- EX: para desabilitar mude: Abilitar = {}, Desabilitar = {x}
 stage9= {resets= 45, premmy= 450, free= 500},
 stage10={resets= 50, premmy= 465, free= 510},

}
        --[[>> FIM STAGES <<]]--

--=[Pega Valor de Resets]=--
function getPlayerReset(cid)
local qr = db.getResult("SELECT `reset` FROM `players` WHERE `id`= "..coNdConf.pid..";")
rss = qr:getDataInt("reset", coNdConf.pid)
if rss < 0 then
rss = 0
end
return rss
end

local success = "                   ~~ Sucesso! ~~ \nVocê tem agora "..(getPlayerReset(cid)+1).." resets. \nVocê será deslogado em "..coNdConf.resetConf.time.." segundos." ;err = doPlayerSendTextMessage
local qrt = db.getResult("SELECT `reset` FROM `players` WHERE `id`= "..coNdConf.pid..";");rss_db = qrt:getDataInt("reset", coNdConf.pid)
local lvl_query = "UPDATE `players` SET `level` = "..(coNdConf.resetConf.backLvl)..", `experience` = 0 WHERE `id`= " .. coNdConf.pid .. ";"
local reset_query = "UPDATE `players` SET `reset` = "..(getPlayerReset(cid)+(1)).." WHERE `id`= " .. coNdConf.pid .. ";"
local nolook_query = "UPDATE `players` SET `description` = '' WHERE `players`.`id`= " .. coNdConf.pid .. ";"
local look_query = "UPDATE `players` SET `description` = ' [Reset "..(getPlayerReset(cid)+(1)).."]' WHERE `players`.`id`= " .. coNdConf.pid .. ";"

--=[Reseta]=--
function addValue(value)
if coNdConf.look == false then
  doRemoveCreature(cid)
 db.executeQuery(lvl_query);db.executeQuery(reset_query);db.executeQuery(nolook_query)
else
  doRemoveCreature(cid)
   db.executeQuery(lvl_query);db.executeQuery(reset_query);db.executeQuery(look_query)
  return LUA_NO_ERROR
 end
end

function nowReseting()
if (getPlayerLevel(cid) < coNdConf.resetConf.Level) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "- Level Necessário Para o Reset ["..coNdConf.resetConf.Level.."]. Faltam "..coNdConf.resetConf.Level-getPlayerLevel(cid).." level's para você Resetar. -")
  return true
end
if getPlayerLevel(cid) >= coNdConf.resetConf.Level and (coNdConf.teleport == false) then
      doPlayerPopupFYI(cid, success)
      addEvent(addValue, coNdConf.resetConf.time*1000, value)
    else
      doPlayerPopupFYI(cid, success)
      addEvent(doTeleportThing, coNdConf.resetConf.time*900, cid, getTownTemplePosition(getPlayerTown(cid)))
      addEvent(addValue, coNdConf.resetConf.time*1000, value)
  return true
 end
end

--[STAGES Nao mexer em nada.]--
function checkLevelStageReset(cid)

local stages = {
    {resets= stage.stage1.resets, premmy= stage.stage1.premmy, free= stage.stage1.free},
    {resets= stage.stage2.resets, premmy= stage.stage2.premmy, free= stage.stage2.free},
    {resets= stage.stage3.resets, premmy= stage.stage3.premmy, free= stage.stage3.free},
    {resets= stage.stage4.resets, premmy= stage.stage4.premmy, free= stage.stage4.free},
    {resets= stage.stage5.resets, premmy= stage.stage5.premmy, free= stage.stage5.free},
    {resets= stage.stage6.resets, premmy= stage.stage6.premmy, free= stage.stage6.free},
    {resets= stage.stage7.resets, premmy= stage.stage7.premmy, free= stage.stage7.free},
    {resets= stage.stage8.resets, premmy= stage.stage8.premmy, free= stage.stage8.free},
    {resets= stage.stage9.resets, premmy= stage.stage9.premmy, free= stage.stage9.free},
    {resets=stage.stage10.resets, premmy=stage.stage10.premmy, free=stage.stage10.free},
}
    local resets = getPlayerReset(cid)
        for i, tab in ipairs(stages) do
            if resets <= tab.resets then
                coNdConf.resetConf.Level = isPremium(cid) and tab.premmy or tab.free
                break
            end
        end
if (getPlayerLevel(cid) < coNdConf.resetConf.Level) then
err(cid, MESSAGE_STATUS_CONSOLE_BLUE, "- Level Necessário Para o Reset ["..coNdConf.resetConf.Level.."]. Faltam "..coNdConf.resetConf.Level-getPlayerLevel(cid).." level's para você Resetar. -")
return TRUE
end

  if getPlayerLevel(cid) >= coNdConf.resetConf.Level and (coNdConf.teleport == false) then
     doPlayerPopupFYI(cid, success)
     addEvent(addValue, coNdConf.resetConf.time*1000, value)
   else
   doPlayerPopupFYI(cid, success)
   addEvent(addValue, coNdConf.resetConf.time*1000, value)
   addEvent(doTeleportThing, coNdConf.resetConf.time*900, cid, getTownTemplePosition(getPlayerTown(cid)))
    return true
  end
end
    function newReset(cid)
    if(coNdConf.needPz == true) and (getTilePzInfo(getCreaturePosition(cid)) == LUA_ERROR) then
     err(cid,MESSAGE_STATUS_CONSOLE_BLUE,"- Você Precisa estar em Protection Zone Para Resetar. -") return TRUE end
    if(coNdConf.needPa == true) and not isPremium(cid) then
     err(cid,MESSAGE_STATUS_CONSOLE_BLUE,"- Você Precisa ser Premium Account para Resetar. -") return TRUE end
    if(coNdConf.withe == false) and (getCreatureSkullType(cid) == 3) then
     err(cid,MESSAGE_STATUS_CONSOLE_BLUE,"- Você não pode resetar em condições de PK Withe. -") return TRUE end
    if(coNdConf.red == false) and (getCreatureSkullType(cid) == 4) then
     err(cid,MESSAGE_STATUS_CONSOLE_BLUE,"- Você não pode resetar em condições de PK Red. -") return TRUE end
    if(coNdConf.battle == true) and (getCreatureCondition(cid, CONDITION_INFIGHT) == TRUE) then
     err(cid,MESSAGE_STATUS_CONSOLE_BLUE,"- Você Precisa estar sem Battle para Resetar. -") return TRUE end

local xy = {true,false}
table.insert(stage.Abilitar, false)
table.insert(stage.Desabilitar, false)
if stage.Abilitar[1] == xy[1] and stage.Desabilitar[1] == xy[2] then
checkLevelStageReset(cid)
elseif stage.Abilitar[1] == xy[2] and stage.Desabilitar[1] == xy[1] then
nowReseting()
else
doPlayerPopupFYI(cid, "LUA_ERROR; Configure corretamente o Sistema de STAGES!")
end
return true
end
    function tableResetInstall()
     print(not rss_db  and LUA_ERROR or "Tabela de Resets: Instalada ... [success] ")
     addEvent(newReset, 1000, cid)
     return false
     end
    if tableResetInstall() then
  end
end
    --=[Install System]=--
       function installReset()
        if db.executeQuery("ALTER TABLE `players` ADD reset INT(11) NOT NULL DEFAULT 0;") then
                print("[MarcelloMkez] -= Advanced Reset System 2.0 por DataBase =- Instalado com sucesso!")
                return TRUE
        end
        print('[Advanced Reset System/MarcelloMkez] Não foi possível instalar o Sistema.')
        return FALSE
     end
        local tt = {
           "Preparando Instalação...",
           "Instalando: TableReset Db...",
           "Instalando: getPlayerReset()...",
           "Instalando: addValue()...",
           "Instalando: checkLevelStageReset()...",
           "Instalando: newReset() and nowReseting()...",
           "Finalizando Instalação...",
           "...",
           success = {
           "Iniciando...",
           "function: TableReset Db...    [success]",
           "function: getPlayerReset()...    [success]",
           "function: addValue(value)...       [success]",
           "function: checkLevelStageReset()... [success]",
           "function: newReset() and nowReseting()...     [success]",
           "Fim da Instalação.  ",
           "by: ~~ MarcelloMkez ~~              \nContato: marcello_dirt@hotmail.com",
           inst = {"MarcelloMkez","Advanced Reset System 2.0 por DataBase"

           },

         },

        }
     if words == "/installreset" and getPlayerAccess(cid) >= 3 then
            function install()
            if installReset() then
                print(""..tt.success[7].."")
                   doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,""..tt.success[8].."")
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "["..tt.success.inst[1].."] -="..tt.success.inst[2].."=- Instalado com sucesso!")
           else
                print("["..tt.success.inst[1].."]  FALHA NA INSTALAÇÃO! [O sistema ja foi instalado].")
                  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "["..tt.success.inst[1].."] FALHA NA INSTALAÇÃO! [O sistema ja foi instalado].")
            end
            return 1
        end
          function concl(cid)
            local typetx = MESSAGE_STATUS_CONSOLE_BLUE
                print(""..tt.success[7].."")
                 print(""..tt[8].."")
                doPlayerSendTextMessage(cid, typetx,""..tt.success[7].."")
                doPlayerSendTextMessage(cid, typetx,""..tt[8].."")
                addEvent(install, 1000,cid)
            end
            function finall(cid)
                local typetx = MESSAGE_STATUS_CONSOLE_BLUE
                print(""..tt.success[6].."")
                print(""..tt[7].."")
                doPlayerSendTextMessage(cid, typetx,""..tt.success[6].."")
                doPlayerSendTextMessage(cid, typetx,""..tt[7].."")
                addEvent(concl, 3000,cid)
            end
             function installDd(cid)
               local typetx = MESSAGE_STATUS_CONSOLE_BLUE
                print(""..tt.success[5].."")
                print(""..tt[6].."")
                doPlayerSendTextMessage(cid, typetx,""..tt.success[5].."")
                doPlayerSendTextMessage(cid, typetx,""..tt[6].."")
                addEvent(finall, 1000,cid)
            end
            function installCc(cid)
               local typetx = MESSAGE_STATUS_CONSOLE_BLUE
                print(""..tt.success[4].."")
                print(""..tt[5].."")
                doPlayerSendTextMessage(cid, typetx,""..tt.success[4].."")
                doPlayerSendTextMessage(cid, typetx,""..tt[5].."")
              addEvent(installDd, 1000,cid)
            end
            function installBb(cid)
               local typetx = MESSAGE_STATUS_CONSOLE_BLUE
                print(""..tt.success[3].."")
                print(""..tt[4].."")
                doPlayerSendTextMessage(cid, typetx,""..tt.success[3].."")
              doPlayerSendTextMessage(cid, typetx,""..tt[4].."")
            addEvent(installCc, 1000,cid)
            end
            function installAa(cid)
              local typetx = MESSAGE_STATUS_CONSOLE_BLUE
                print(""..tt.success[2].."")
                print(""..tt[3].."")
                doPlayerSendTextMessage(cid, typetx,""..tt.success[2].."")
                doPlayerSendTextMessage(cid, typetx,""..tt[3].."")
                addEvent(installBb, 1000,cid)
            end
            function toInstall()
              local typetx = MESSAGE_STATUS_CONSOLE_BLUE
                print(""..tt.success[1].."")
                print(""..tt[2].."")
                doPlayerSendTextMessage(cid, typetx,""..tt.success[1].."")
                doPlayerSendTextMessage(cid, typetx,""..tt[2].."")
               addEvent(installAa, 1000,cid)
              end
            function preparation()
              local typetx = MESSAGE_STATUS_CONSOLE_BLUE
               print(""..tt[1].."")
             doPlayerSendTextMessage(cid, typetx,""..tt[1].."")
            addEvent(toInstall, 3000,cid)
        end
            if preparation() then
            end
        end
return 1
end
--=[By: MarcelloMkez]=-- 