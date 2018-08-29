function onCastSpell(cid, var)
local playerpos = getPlayerPosition(cid)
local targetpos = getPlayerPosition(getCreatureTarget(cid))
local cloth = getCreatureOutfit(cid)
local health = getCreatureHealth(getCreatureTarget(cid))

if not isMonster(getCreatureTarget(cid)) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você so deve pegar o corpo para edo tensei de ninjas e monstros selvagens.")
return 0
end
if health >= getCreatureMaxHealth(getCreatureTarget(cid))/100*70 then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, ""..getCreatureName(getCreatureTarget(cid)).." esta resistindo ao edo tensei retire mais vida dele")
return 0
end
if getCreatureMaxHealth(getCreatureTarget(cid)) > getCreatureMaxHealth(cid) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Você so pode invocar criaturas com o poder mais baixo que o seu")
return 0
end
local item = doPlayerAddItem(cid, 2525)
doItemSetAttribute(item, "corpse", ""..getCreatureName(getCreatureTarget(cid)).."")
doItemSetAttribute(item, "health", ""..getCreatureMaxHealth(getCreatureTarget(cid)).."")
doSendMagicEffect(playerpos, 2)
doSendMagicEffect(targetpos, 2)
doItemSetAttribute(item, "name", "Edo tensei "..getCreatureName(getCreatureTarget(cid)).."")
doRemoveCreature(getCreatureTarget(cid))
return true

end