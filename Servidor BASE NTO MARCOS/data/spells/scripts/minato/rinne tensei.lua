local area = 8 -- area quadrada (8 = 8x8, 7 = 7x7, 6 = 6x6, etc...)
local porcent = 10 -- porcentagem de vida dos players para healar
local exaust = 5 -- exhausted em minutos
local effect = {36} -- efeito que ira aparecer nos player, caso for mais de 1, adicionar virgulas dentro da tabela

local function REVIVE(uid)
    if not isCreature(uid) then return true end
    if getTilePzInfo(getThingPos(uid)) == false and getCreatureHealth(uid) <= math.floor(getCreatureMaxHealth(uid)*porcent/100) then
        doCreatureAddHealth(uid, getCreatureMaxHealth(uid))
        setPlayerStorageValue(uid, 8855, -1)
    else
        addEvent(REVIVE, 100, uid)
    end
end

function onCastSpell(cid, var)
    local pos = getCreaturePos(cid)
    if exhaustion.check(cid, 8844) == true then
        doPlayerSendCancel(cid, "You are exhausted.")
        doSendMagicEffect(pos, 2)
        return false
    end
    for x = pos.x-area, pos.x+area do
        for y = pos.y-area, pos.y+area do
            local mob = getTopCreature({x=x, y=y, z=pos.z}).uid
            if isPlayer(mob) and getPlayerStorageValue(mob,8855) < 1 and getTilePzInfo({x=getThingPos(mob).x, y=getThingPos(mob).y, z=getThingPos(mob).z}) == false and mob ~= cid then
                for i = 1, #effect do
                    doSendMagicEffect({x=getThingPos(mob).x+1, y=getThingPos(mob).y+1, z=getThingPos(mob).z}, effect[i])
                end
                setPlayerStorageValue(mob, 8855, 1)
                REVIVE(mob)
            end
        end
    end
    exhaustion.set(cid, 8844, exaust*60)
    doCreatureAddHealth(cid, -getCreatureMaxHealth(cid))
    return true
end