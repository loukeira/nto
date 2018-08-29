local config2 = {
efeitoTele = 190, -- efeito q ira aparacer a cada teleport.
efeitoDamage = 181, -- efeito q ira aparecer ao hitar no alvo
hits = 3, -- quantos hits vai dar
delay = 200, -- intervalo de tempo a cada hit
min = 10000, -- dano minimo
max = 15000, -- dano maximo
damage = COMBAT_PHYSICALDAMAGE -- tipo do dano
}
function isWalkable(pos, creature, pz, proj) -- nord
local hit = math.random((getPlayerLevel(cid) * 0.90 + getPlayerMagLevel(cid) * 0.70) * 1.0,(getPlayerLevel(cid) * 1.00 + getPlayerMagLevel(cid) * 0.80) * 1.0)

                    if getCreatureMana(uid) > hit then
            if getCreatureMana(uid) > 0 then
                doSendAnimatedText(getCreaturePosition(uid), hit, 144)
            doCreatureAddMana(uid, -hit)
            end
        else
            if getCreatureMana(uid) > 0 then
            doSendAnimatedText(getCreaturePosition(uid), getCreatureHealth(uid), 144)
            doCreatureAddMana(uid, -getCreatureMana(uid))
        end
        end
    if getTileThingByPos({x = pos.x, y = pos.y, z = pos.z, stackpos = 0}).itemid == 0 then return false end
    if getTopCreature(pos).uid > 0 and creature then return false end
    if getTileInfo(pos).protection and not pz then return false end
    local n = not proj and 3 or 2
    for i = 0, 255 do
                    pos.stackpos = i
                    local tile = getTileThingByPos(pos)
                    if tile.itemid ~= 0 and not isCreature(tile.uid) then
                                    if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
                                                    return false
                                    end
                    end
    end
    return true
end
function getPosDirs(p, dir) -- mkalo
    return dir == 1 and {x=p.x-1, y=p.y, z=p.z} or dir == 2 and {x=p.x-1, y=p.y+1, z=p.z} or dir == 3 and {x=p.x, y=p.y+1, z=p.z} or dir == 4 and {x=p.x+1, y=p.y+1, z=p.z} or dir == 5 and {x=p.x+1, y=p.y, z=p.z} or dir == 6 and {x=p.x+1, y=p.y-1, z=p.z} or dir == 7 and {x=p.x, y=p.y-1, z=p.z} or dir == 8 and {x=p.x-1, y=p.y-1, z=p.z}
end
function validPos(pos)
tb = {}
for i = 1, 8 do
  newpos = getPosDirs(pos, i)
  if isWalkable(newpos) then
   table.insert(tb, newpos)
  end
end
table.insert(tb, pos)
return tb
end
spell2 = {
start = function (cid, target, markpos, hits)
    if not isCreature(cid) then return true end
    if not isCreature(target) or hits < 1 then
                 doTeleportThing(cid, markpos)
                 doSendMagicEffect(getThingPos(cid), config2.efeitoTele)
                 return true
    end
    posAv = validPos(getThingPos(target))
    rand = #posAv == 1 and 1 or #posAv - 1
    doSendMagicEffect(getThingPos(cid), config2.efeitoTele)
    doTeleportThing(cid, posAv[math.random(1, rand)])
    doAreaCombatHealth(cid, config2.damage, getThingPos(target), 0, -config2.min, -config2.max, config2.efeitoDamage)
    addEvent(spell2.start, config2.delay, cid, target, markpos, hits - 1)
   end
}
function onCastSpell(cid)
target = getCreatureTarget(cid)
if target then
  spell2.start(cid, target, getThingPos(cid), config2.hits)
end
return true
end