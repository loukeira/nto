local config = {
 loginMessage = getConfigValue('loginMessage'),
 useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
 

 local accountManager = getPlayerAccountManager(cid)
 if(accountManager == MANAGER_NONE) then
  local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage
  if(lastLogin > 0) then
   doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
   str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
  end

  doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, str)
 elseif(accountManager == MANAGER_NAMELOCK) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, it appears that your character has been namelocked, what would you like as your new name?")
 elseif(accountManager == MANAGER_ACCOUNT) then
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to manage your account and if you want to start over then type 'cancel'.")
 else
  doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Hello, type 'account' to create an account or type 'recover' to recover an account.")
 end


  local insere_db_player_saga = 28392
  
  if getPlayerStorageValue(cid, insere_db_player_saga) == -1 then
  db.query("INSERT INTO `player_saga` (`id` , `name` , `vocation` , `saga` ) VALUES ("..getPlayerGUID(cid)..", ""..getPlayerName(cid).."",""..getPlayerVocationName(cid).."",1);")
  setPlayerStorageValue(cid,insere_db_player_saga,1)
  end

 if(not isPlayerGhost(cid)) then
  doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
 end
    registerCreatureEvent(cid, "aol_protect_iniciante")

   registerCreatureEvent(cid, "aol")
  registerCreatureEvent(cid, "aol_donate")

  registerCreatureEvent(cid, "iniciante")
 registerCreatureEvent(cid, "xprank")
 registerCreatureEvent(cid, "Mail")
 registerCreatureEvent(cid, "GuildMotd")
  registerCreatureEvent(cid, "guildsemanal")


 registerCreatureEvent(cid, "Idle")
 if(config.useFragHandler) then
  registerCreatureEvent(cid, "SkullCheck")
 end
 registerCreatureEvent(cid, "DeathHP")
        registerCreatureEvent(cid, "ChunninThink")

        registerCreatureEvent(cid, "ProtDeath")
           registerCreatureEvent(cid, "Biohazard")
           registerCreatureEvent(cid, "ZombieAttack")
           registerCreatureEvent(cid, "WeaponMana")
     registerCreatureEvent(cid, "showVoc")       
        registerCreatureEvent(cid, "ReportBug")
        registerCreatureEvent(cid, "AdvanceSave")
 registerCreatureEvent(cid, "Outfit")
 registerCreatureEvent(cid, "MonsteDeath")
registerCreatureEvent(cid, "ExameJouninDead")
        registerCreatureEvent(cid, "ExameJouninBoss")
setPlayerStorageValue(cid, 8855, -1)
registerCreatureEvent(cid, "Senha")
registerCreatureEvent(cid, "eventotimes")
registerCreatureEvent(cid, "report")
registerCreatureEvent(cid, "Niwdeath")
return true
end
