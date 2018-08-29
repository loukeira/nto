
local arr = {
{0, 1, 0},
{1, 3, 1}, -- area que vai acertar ao explodir a bomba
{0, 1, 0},
}
local area = createCombatArea(arr)

function onStepIn(cid, item, position)
    local player = getPlayerByNameWildcard(getItemAttribute(item.uid, 'ref'))
    doSendMagicEffect(position, config.effect1)
    if isCreature(pl﻿ayer)then
        doAreaCombatHealth(player, COMBAT_FIREDAMAGE, position, area, -config.mindmg, -config.maxdmg, config.effect2)
    end
    if ((cid == player and config.selfe) or (not isPlayer(cid)) or (not isCreature(player))) then
        doCreatureAd﻿dHealth(cid, -1 * math.random(config.mindmg, config.maxdmg))
        doSendMagicEffect(position, config.effect2)
    end
    if isPlayer(cid) then
        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, config.msg)
    end
    doRemoveItem(i﻿tem.uid)
return true
end﻿