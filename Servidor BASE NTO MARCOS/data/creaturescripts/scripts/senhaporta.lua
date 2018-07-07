local uniqueids = {8049, 8050}

local passwords = {
["madara"] = {doorpos = {x = 1031, y = 928, z = 12}, doorid = 1225, blackboardpos = {x = 1033, y = 929, z = 12}, blackboardid = 1811, uniqueid = 8049, doorclosetime = 10}
}

function onTextEdit(cid, item, newText)

local x = passwords[newText]

local function onCloseDoor()
if(getTileItemById(x.doorpos,x.doorid+1).uid) > 0 then
doTransformItem(getTileItemById(x.doorpos,x.doorid+1).uid, x.doorid)
doSendMagicEffect(x.doorpos, CONST_ME_MAGIC_RED)
end
end

for _, check in pairs(uniqueids) do
if item.uid == check then
if x and item.uid == x.uniqueid then
if(getTileItemById(x.doorpos,x.doorid).uid) > 0 then
doTransformItem(getTileItemById(x.doorpos,x.doorid).uid, x.doorid + 1)
doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_GREEN)
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Sua Senha "'..newText..'" esta correta, voce pode entrar.')
addEvent(onCloseDoor,x.doorclosetime*1000)
doRemoveItem(item.uid, 1)
local blackboard = doCreateItem(x.blackboardid,1,x.blackboardpos)
doItemSetAttribute(blackboard, "uid", x.uniqueid)
else
doRemoveItem(item.uid, 1)
local blackboard = doCreateItem(x.blackboardid,1,x.blackboardpos)
doItemSetAttribute(blackboard, "uid", x.uniqueid)
doPlayerSendCancel(cid, 'A porta ja esta aberta, feche-a ou espera ela se fechar.')
end
else
doSendMagicEffect(getThingPos(cid), CONST_ME_POFF)
doPlayerSendCancel(cid, 'Sua senha "'..newText..'" esta incorreta.')
end
end
end
return true
end