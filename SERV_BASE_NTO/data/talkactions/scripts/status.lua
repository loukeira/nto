
function onSay(cid, words, param, channel)
                

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


---PARTE DO STACK REGEN ITENS----
      local hpgain,hpticks,managain,manaticks,auxhpticks,mediahpticks,auxmanaticks,mediamanaticks,mediahpgain,mediamanagain,matematica,matematica2 = 0,0,0,0,0,0,0,0,0,0,0,0

        for i=1, 10 do 
            local item = getPlayerSlotItem(cid, i) 
      

            if item.itemid > 0 then 

             if i == getItemInfo(item.itemid).wieldPosition then


                   local getitemhp = getItemInfo(item.itemid).abilities.healthGain 
                    local getitemhpticks = getItemInfo(item.itemid).abilities.healthTicks
                    local getitemmana = getItemInfo(item.itemid).abilities.manaGain 
                     local getitemmanaticks = getItemInfo(item.itemid).abilities.manaTicks                      

                    if getitemhp > 0 then

                    	matematica = getitemhp / (getitemhpticks/1000)
                        hpgain = hpgain + matematica
                    end

                    -- if getitemhpticks > 0 then
                    --     hpticks = hpticks + (getitemhpticks/1000)
                    --    	auxhpticks = auxhpticks + 1
                    -- end

                    if getitemmana > 0 then
                    	matematica2 = getitemmana / (getitemmanaticks/1000)
                        managain = managain + matematica2

                    end

                    -- if getitemmanaticks > 0 then
                    --     manaticks = manaticks + (getitemmanaticks/1000)
                    --     auxmanaticks = auxmanaticks + 1

                    -- end
  
             end
            end 
        end 

       


   ---- FIM PARTE DO STACK REGEN ITENS ---


local cap = getPlayerFreeCap(cid)
local text = "[+] NTO GRAN STATUS [+]\n\nVocation: "..string.upper(vocation).."\nLevel: ".. level .."\nClasse: "..string.upper(get_classes(cid)).."\nHP: ".. health .."/".. maxhealth .."\nMP: ".. mana .."/".. maxmana .."\nCapacity: ".. cap .."\nBalance: "..getPlayerBalance(cid).."\n\nMagic Level: ".. magic .."\nFist: ".. fist .."\nGloves: ".. club .."\nSword: ".. sword .."\nDistance: ".. distance .."\nShield: ".. shield .."\nSpeed: "..getCreatureSpeed(cid).."\n\nEACH LVL GAIN:  "..getVocationInfo(getPlayerVocation(cid)).healthGain.." HP  /  "..getVocationInfo(getPlayerVocation(cid)).manaGain.." MP  \nREGEN:  ["..getVocationInfo(getPlayerVocation(cid)).healthGainAmount.." HP/ "..getVocationInfo(getPlayerVocation(cid)).healthGainTicks.." seg]  +  ["..math.ceil(hpgain,4).." HP /  Seg ]\nREGEN:  ["..getVocationInfo(getPlayerVocation(cid)).manaGainAmount.." MANA/ "..getVocationInfo(getPlayerVocation(cid)).manaGainTicks.." seg] + ["..math.ceil(managain).." MP /  Seg ]"
--doShowTextDialog(cid, 5808, text)
doPlayerPopupFYI(cid, text)
            
            



return true
end

