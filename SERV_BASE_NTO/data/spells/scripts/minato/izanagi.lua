local porcent = 10 -- porcentagem de vida dos players para healar
local exaust = 1 -- exhausted em segundos
local effect = {36} -- efeito que ira aparecer nos player, caso for mais de 1, adicionar virgulas dentro da tabela

local function REVIVE(cid)
    if not isCreature(cid) then return true end
    if getTilePzInfo(getThingPos(cid)) == false and getCreatureHealth(cid) <= math.floor(getCreatureHealth(cid)*porcent/setConditionParam(condition, CONDITION_PARAM_TICKS, 200000)) then
        doCreatureAddHealth(cid, getCreatureMaxHealth(cid))
        setPlayerStorageValue(cid, 8855, -1)
    else
        addEvent(REVIVE, 100, cid)
    end
end

function onCastSpell(cid, var)
    local pos = getCreaturePos(cid)
    if exhaustion.check(cid, 8844) == true then
        doPlayerSendCancel(cid, "You are exhausted.")
        doSendMagicEffect(pos, 2)
        return false
    end
	if getPlayerStorageValue(cid, 8855) > 0 then
	    doPlayerSendCancel(cid, "You already have protection.")
		return false
	end
    for i = 1, #effect do
        doSendMagicEffect(pos, effect[i])
    end
    REVIVE(cid)
    exhaustion.set(cid, 8844, exaust)
    return true
end