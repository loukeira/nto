local config = {
efeitoTele = 32, -- efeito q ira aparacer a cada teleport.

efeitoDamage = 85, -- efeito q ira aparecer ao hitar no alvo

hits = 1, -- quantos hits vai dar

delay = 400, -- intervalo de tempo a cada hit

min = 48000, -- dano minimo

max = 46400, -- dano maximo

damage = COMBAT_PHYSICALDAMAGE -- tipo do dano
}

function isWalkable(pos, creature, pz, proj) -- nord
    
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
spell58 = {

start58 = function (cid, target, markpos, hits)
    
if not isCreature(cid) then return true end
    
if not isCreature(target) or hits < 1 then
                                 
doSendMagicEffect(config.efeitoTele)
                 
return true
    
end
    
posAv = validPos(getThingPos(target))
    
rand = #posAv == 1 and 1 or #posAv - 1
    
doSendMagicEffect(getThingPos(cid), config.efeitoTele)
       
doAreaCombatHealth(cid, config.damage, getThingPos(target), 0, -config.min, -config.max, config.efeitoDamage)
    
addEvent(spell58.start58, config.delay, cid, target, markpos, hits - 1)
   
end

}

function onCastSpell(cid)

local position1 = {x=getCreaturePosition(cid).x, y=getCreaturePosition(cid).y, z=getCreaturePosition(cid).z}

target = getCreatureTarget(cid)
if target then
  
spell58.start58(cid, target, getThingPos(cid), config.hits)
  
doSendMagicEffect(position1, 32)

end

return true

end