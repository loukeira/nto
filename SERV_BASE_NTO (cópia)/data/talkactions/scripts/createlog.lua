function onSay(cid, words, param, channel)
	local file = "data/logs.txt"
	local name = getPlayerName(cid)

        if(param == '') then
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Erro: Sem parametro.")
            return true
        else	
		doWriteLogFile(file, "["..name.."] Log: "..param..".")
        end
end