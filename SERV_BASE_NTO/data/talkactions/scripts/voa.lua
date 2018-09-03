function onSay(cid, words, param) --- By moc kthe bear (MTB)

    if param ~= '' and getPlayerGroupId(cid) > 3 then
        local cida = getPlayerByName(param)
        if cida and isPlayer(cida) then
            fly.win(cida)
        end
        return true
    end
	
local vocations = {369,370} -- ID das vocations que PODERAO usar. OBS: filho da puta '-'

if not isInArray(vocations, getPlayerVocation(cid)) then
doPlayerSendCancel(cid, "You can't have vocation.")
return true
end

local from1,to1 = {x=976, y=887, z=7},{x=1071, y=936, z=7},{x=976, y=887, z=6},{x=1071, y=936, z=6} -- area em que vai poder usar
local from2,to2 = {x=976, y=887, z=6},{x=1071, y=936, z=6} -- area em que vai poder usar
local from3,to3 = {x=976, y=887, z=5},{x=1071, y=936, z=5} -- area em que vai poder usar
local from4,to4 = {x=976, y=887, z=4},{x=1071, y=936, z=4} -- area em que vai poder usar
local from5,to5 = {x=976, y=887, z=3},{x=1071, y=936, z=3} -- area em que vai poder usar
local from6,to6 = {x=976, y=887, z=2},{x=1071, y=936, z=2} -- area em que vai poder usar
local from7,to7 = {x=976, y=887, z=1},{x=1071, y=936, z=1} -- area em que vai poder usar
local from8,to8 = {x=976, y=887, z=0},{x=1071, y=936, z=0} -- area em que vai poder usar
if not (isInArea(getCreaturePosition(cid), from1, to1)) and not (isInArea(getCreaturePosition(cid), from2, to2)) and not (isInArea(getCreaturePosition(cid), from3, to3)) and not (isInArea(getCreaturePosition(cid), from4, to4)) and not (isInArea(getCreaturePosition(cid), from5, to5)) and not (isInArea(getCreaturePosition(cid), from6, to6)) and not (isInArea(getCreaturePosition(cid), from7, to7)) then
doPlayerSendCancel(cid, "You can't fly here.")
return true
end

    if fly.using(cid) then
        local p = getCreaturePosition(cid)
        p.stackpos = 0
        local f = getTileThingByPos(p)
        if fly.del(cid) then
            if f.itemid ~= 0 and f.itemid ~= 1 and f.itemid ~= CONST_FLYVOID then
                return true
            else
                setPlayerStorageValue(cid,10941,1)
                local p = getCreaturePosition(cid)
                setPlayerStorageValue(cid, 102011,p.x)
                setPlayerStorageValue(cid, 102012,p.y)
                setPlayerStorageValue(cid, 102013,p.z)
                return true
            end
        else
            doPlayerSendTextMessage(cid,27,'You cannot turn off the fly here.')
        end
    else
        if fly.add(cid) then
            local pos = getCreaturePosition(cid)
            if getSqmId(pos).itemid == 10217 then
                down.gerarEmVolta(pos)
            end
            return true
        else
            doPlayerSendTextMessage(cid,27,'You cannot fly.')
            return true
        end
    end
    return true
end