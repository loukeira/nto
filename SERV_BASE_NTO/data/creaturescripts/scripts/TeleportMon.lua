function onDeath(cid, corpse, killer)

local Ppos = {x = 1795, y = 1240, z = 7} -- posicao para onde ele vai ir

local monstName = "The Minato"  -- nome do monstro
                
                 if isMonster(cid) then
                        if string.lower(getCreatureName(cid)) == string.lower(monstName) then
                           doTeleportThing(killer[1], Ppos)
                        end   
                 end 
        return TRUE
end