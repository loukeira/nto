function onSay(cid, words, param)
	if doPlayerRemoveMoney(cid, 20000) == TRUE then
			doPlayerAddItem(cid, 11781, 1)
	        doSendMagicEffect(getPlayerPosition(cid), 5)
			doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,'Aol!') 
	else
	     doPlayerSendCancel(cid, "You need 2 GB to buy jashin amulet!")
    end
	return true
end
