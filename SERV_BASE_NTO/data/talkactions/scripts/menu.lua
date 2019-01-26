

function onSay(cid, words, param, channel)

	file = io.open('data/menu.txt','r')
	notice = file:read(-1)
	--doShowTextDialog(cid,7528,notice)

	doPlayerPopupFYI(cid, notice)
	file:close()

	return true
end
