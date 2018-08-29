local uniqueids = {8049, 8050, 8051, 8052, 8053, 8054, 8055, 8056, 8057, 8058, 8059, 8060, 8061, 8062, 8063, 8064, 8065, 8066, 8067, 8068, 8069, 8070, 8071, 8072, 8073, 8074, 8075, 8076}

local passwords = {
["madara"] = {doorpos = {x = 1031, y = 928, z = 12}, doorid = 1225, blackboardpos = {x = 1033, y = 929, z = 12}, blackboardid = 1811, uniqueid = 8049, doorclosetime = 10},
["TK"] = {doorpos = {x = 1000, y = 1000, z = 7}, doorid = 1213, blackboardpos = {x = 1000, y = 1000, z = 7}, blackboardid = 1811, uniqueid = 8050, doorclosetime = 10},
["rikkudou sennin"] = {doorpos = {x = 1135, y = 873, z = 13}, doorid = 1225, blackboardpos = {x = 1136, y = 874, z = 13}, blackboardid = 1811, uniqueid = 8051, doorclosetime = 10},
["TK"] = {doorpos = {x = 1000, y = 1000, z = 7}, doorid = 1225, blackboardpos = {x = 1000, y = 1000, z = 7}, blackboardid = 1811, uniqueid = 8050, doorclosetime = 10},
["rikkudou sennin"] = {doorpos = {x = 1135, y = 873, z = 13}, doorid = 1225, blackboardpos = {x = 1136, y = 874, z = 13}, blackboardid = 1811, uniqueid = 8051, doorclosetime = 10},
["uchiha madara"] = {doorpos = {x = 1135, y = 860, z = 13}, doorid = 1225, blackboardpos = {x = 1137, y = 861, z = 13}, blackboardid = 1811, uniqueid = 8052, doorclosetime = 10},
["naruto"] = {doorpos = {x = 1135, y = 846, z = 13}, doorid = 1225, blackboardpos = {x = 1137, y = 847, z = 13}, blackboardid = 1811, uniqueid = 8053, doorclosetime = 10},
["sasuke"] = {doorpos = {x = 1135, y = 832, z = 13}, doorid = 1225, blackboardpos = {x = 1137, y = 833, z = 13}, blackboardid = 1811, uniqueid = 8054, doorclosetime = 10},
["hashirama"] = {doorpos = {x = 1135, y = 821, z = 13}, doorid = 1225, blackboardpos = {x = 1137, y = 822, z = 13}, blackboardid = 1811, uniqueid = 8055, doorclosetime = 10},
["tobirama"] = {doorpos = {x = 1135, y = 808, z = 13}, doorid = 1225, blackboardpos = {x = 1137, y = 809, z = 13}, blackboardid = 1811, uniqueid = 8056, doorclosetime = 10},
["sarutobi"] = {doorpos = {x = 1135, y = 794, z = 13}, doorid = 1225, blackboardpos = {x = 1137, y = 795, z = 13}, blackboardid = 1811, uniqueid = 8057, doorclosetime = 10},
["minato"] = {doorpos = {x = 1135, y = 781, z = 13}, doorid = 1225, blackboardpos = {x = 1137, y = 782, z = 13}, blackboardid = 1811, uniqueid = 8058, doorclosetime = 10},
["tsunade"] = {doorpos = {x = 1140, y = 769, z = 13}, doorid = 1225, blackboardpos = {x = 1139, y = 771, z = 13}, blackboardid = 1811, uniqueid = 8059, doorclosetime = 10},
["danzou"] = {doorpos = {x = 1157, y = 769, z = 13}, doorid = 1225, blackboardpos = {x = 1156, y = 771, z = 13}, blackboardid = 1811, uniqueid = 8060, doorclosetime = 10},
["kakashi"] = {doorpos = {x = 1172, y = 769, z = 13}, doorid = 1225, blackboardpos = {x = 1171, y = 771, z = 13}, blackboardid = 1811, uniqueid = 8061, doorclosetime = 10},
["yakihito"] = {doorpos = {x = 1189, y = 769, z = 13}, doorid = 1225, blackboardpos = {x = 1188, y = 771, z = 13}, blackboardid = 1811, uniqueid = 8062, doorclosetime = 10},
["hashirama"] = {doorpos = {x = 1207, y = 769, z = 13}, doorid = 1225, blackboardpos = {x = 1206, y = 771, z = 13}, blackboardid = 1811, uniqueid = 8063, doorclosetime = 10},
["itachi"] = {doorpos = {x = 1224, y = 769, z = 13}, doorid = 1225, blackboardpos = {x = 1223, y = 771, z = 13}, blackboardid = 1811, uniqueid = 8064, doorclosetime = 10},
["obito"] = {doorpos = {x = 1246, y = 769, z = 13}, doorid = 1225, blackboardpos = {x = 1245, y = 771, z = 13}, blackboardid = 1811, uniqueid = 8065, doorclosetime = 10},
["kurama"] = {doorpos = {x = 1264, y = 769, z = 13}, doorid = 1225, blackboardpos = {x = 1263, y = 771, z = 13}, blackboardid = 1811, uniqueid = 8066, doorclosetime = 10},
["amaterasu"] = {doorpos = {x = 1281, y = 781, z = 13}, doorid = 1225, blackboardpos = {x = 1279, y = 780, z = 13}, blackboardid = 1811, uniqueid = 8067, doorclosetime = 10},
["yakihito"] = {doorpos = {x = 1281, y = 792, z = 13}, doorid = 1225, blackboardpos = {x = 1279, y = 791, z = 13}, blackboardid = 1811, uniqueid = 8068, doorclosetime = 10},
["nagato"] = {doorpos = {x = 1281, y = 800, z = 13}, doorid = 1225, blackboardpos = {x = 1279, y = 810, z = 13}, blackboardid = 1811, uniqueid = 8069, doorclosetime = 10},
["madara"] = {doorpos = {x = 1281, y = 811, z = 13}, doorid = 1225, blackboardpos = {x = 1279, y = 820, z = 13}, blackboardid = 1811, uniqueid = 8070, doorclosetime = 10},
["yakihito"] = {doorpos = {x = 1281, y = 821, z = 13}, doorid = 1225, blackboardpos = {x = 1279, y = 829, z = 13}, blackboardid = 1811, uniqueid = 8071, doorclosetime = 10},
["nidaime"] = {doorpos = {x = 1281, y = 830, z = 13}, doorid = 1225, blackboardpos = {x = 1279, y = 839, z = 13}, blackboardid = 1811, uniqueid = 8072, doorclosetime = 10},
["orochimaru"] = {doorpos = {x = 1281, y = 840, z = 13}, doorid = 1225, blackboardpos = {x = 1279, y = 845, z = 13}, blackboardid = 1811, uniqueid = 8073, doorclosetime = 10},
["kakashi"] = {doorpos = {x = 1281, y = 846, z = 13}, doorid = 1225, blackboardpos = {x = 1279, y = 852, z = 13}, blackboardid = 1811, uniqueid = 8074, doorclosetime = 10},
["kushina"] = {doorpos = {x = 1281, y = 853, z = 13}, doorid = 1225, blackboardpos = {x = 1279, y = 869, z = 13}, blackboardid = 1811, uniqueid = 8075, doorclosetime = 10},
["utakata"] = {doorpos = {x = 1281, y = 870, z = 13}, doorid = 1225, blackboardpos = {x = 1279, y = 1000, z = 13}, blackboardid = 1811, uniqueid = 8076, doorclosetime = 10}
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