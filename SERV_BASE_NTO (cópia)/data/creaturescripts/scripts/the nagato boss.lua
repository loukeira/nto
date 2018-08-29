function onDeath(cid, corpse, killer)

local Ppos = {x = 1011, y = 1264, z = 2} -- posicao para onde ele vai ir

local monstName = "the nagato boss"  -- nome do monstro
                
                 if isMonster(cid) then
                        if string.lower(getCreatureName(cid)) == string.lower(monstName) then
                           doTeleportThing(killer[1], Ppos)
                        end   
                 end 
        return TRUE
end