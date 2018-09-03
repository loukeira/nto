local message = [[Vocations Minato,Itachi,Kisame,Kakuzu,Raikage Para Eventos Se Tu Ganha Os Eventos Points Tu Podera Ganha Items e Vocations]]
function onLogin(cid)
    local accountManager = getPlayerAccountManager(cid)
    if(accountManager == MANAGER_NEW) then
        doPlayerPopupFYI(cid, message)
    end
    return true
end