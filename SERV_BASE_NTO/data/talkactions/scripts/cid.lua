
function onSay(cid, words, param, channel)

                        -- local coco = 1114
                        -- local xixi = 373
                        -- local stak = 1

                        -- while coco<=1117 do
                        -- while xixi <= 377 do
                        -- while stak <=255 do

                        -- if getTileThingByPos({x = coco, y = xixi, z = 7,stackpos = stak}).itemid == 9930 then
                        -- doPlayerSendTextMessage(cid, 18, "WORK!")
                        -- doSendMagicEffect({x = coco, y = xixi, z = 7,stackpos = stak}, 306)
                        -- doSendMagicEffect({x = coco, y = xixi, z = 7,stackpos = stak}, 307)

                        -- end

                        -- stak = stak +1
                        -- end

                        -- xixi = xixi + 1
                        -- stak = 0

                        -- end
                        -- coco = coco + 1
                        -- xixi = 373

                        -- end
                        
                

local level = getPlayerLevel(cid)
local vocation = getPlayerVocationName(cid)
local health, maxhealth = getCreatureHealth(cid), getCreatureMaxHealth(cid)
local mana, maxmana = getCreatureMana(cid), getCreatureMaxMana(cid)
local fist, club, sword, axe = getPlayerSkillLevel(cid, 0), getPlayerSkillLevel(cid, 1), getPlayerSkillLevel(cid, 2), getPlayerSkillLevel(cid, 3)
local distance, shield, fishing, magic =  getPlayerSkillLevel(cid, 4), getPlayerSkillLevel(cid, 5), getPlayerSkillLevel(cid, 6), getPlayerMagLevel(cid)
function getCritical(cid)
crit = getPlayerStorageValue(cid, 48913)
  if crit < 0 then
            crit = 0
          end
return crit * 0.3
end

function getItemAbsorve(itemuid)
return getItemAttribute(itemuid, "attack")
end
function getItemMagicIncrease(itemuid)
return getItemAttribute(itemuid, "increaseMagic")
end
local max = 50
local dodgePercent = math.floor(0)
local all, increasemagic = 0, 0


for i = 1, 9 do
if getPlayerSlotItem(cid, i).uid > 1 then

if getItemAbsorve(getPlayerSlotItem(cid, i).uid) then
all = all + getItemAbsorve(getPlayerSlotItem(cid, i).uid)
end
if getItemMagicIncrease(getPlayerSlotItem(cid, i).uid) then
increasemagic = increasemagic + getItemMagicIncrease(getPlayerSlotItem(cid, i).uid)
end
end
end
if dodgePercent >= max then dodgePercent = max end
dodgeTotal = math.floor(dodgePercent*10)/10


local cap = getPlayerFreeCap(cid)
local text = "[+] NTO GRAN STATUS [+]\n\nVocation: "..vocation.."\nLevel: ".. level .."\nHP: ".. health .."/".. maxhealth .."\nMP: ".. mana .."/".. maxmana .."\nCapacity: ".. cap .."\n\nMagic Level: ".. magic .."\nFist: ".. fist .."\nGloves: ".. club .."\nSword: ".. sword .."\nDistance: ".. distance .."\nShield: ".. shield ..""
--doShowTextDialog(cid, 5808, text)
doPlayerPopupFYI(cid, text)
            
            

                        doPlayerSendTextMessage(cid, 18, "ok")


return true
end