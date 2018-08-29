
local ConfiG = {
			item = {
			   {2160, 100}, -- Itemid, count
			},
			outfit = 173, -- Outfit LookType
			addons = 3, -- 3 = FUll, 2 = Somente a segunda Addon, 1 = Primeira Addon, 0 = Sem Addons
			vocation = 317,
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, typea, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local msg = msg:lower()
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if msgcontains(msg, 'vocation') and (getPlayerStorageValue(cid, 72371) < 1) then
		for _, v in pairs(ConfiG.item) do
			if (getPlayerItemCount(cid, v[1]) < v[2]) then
				local msg = ""

				for _, v in pairs(ConfiG.item) do
					msg = msg .. ", " .. v[2] .. " ".. getItemNameById(v[1]) .. (v[2] > 1 and "s" or "")
				end

				return selfSay("Você não tem ".. msg:sub(3, #msg) .. ".", cid)
			end
		end

		selfSay("Aí está!", cid)
		setPlayerStorageValue(cid, 72371, 1)
		doPlayerAddOutfit(cid, ConfiG.outfit, ConfiG.addons)
		doPlayerSetVocation(cid, ConfiG.vocation)
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
