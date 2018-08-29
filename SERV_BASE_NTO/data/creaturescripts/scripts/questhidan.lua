function onDeath(cid, corpse, killer)

local Ppos = {x = 1175, y = 1275, z = 2} -- posicao para onde ele vai ir

local monstName = "The Hidan Boss"  -- nome do monstro
                
                 if isMonster(cid) then
                        if string.lower(getCreatureName(cid)) == string.lower(monstName) then
                           doTeleportThing(killer[1], Ppos)
                        end   
                 end 
        return TRUE
end