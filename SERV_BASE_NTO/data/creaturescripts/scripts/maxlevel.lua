local maxlevel = 5000
 function onAdvance(cid, skill, oldLevel, newLevel)
    if skill == SKILL__LEVEL then
        if newLevel > maxlevel then
            doPlayerAddExp(cid, getExperienceForLevel(maxlevel)-getPlayerExperience(cid))
            return FALSE
        end
    end 
return TRUE
end