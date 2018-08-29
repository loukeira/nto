local cont2 = 0
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_EFFECT, 102)
setCombatParam(combat, COMBAT_PARAM_DISTANCEEFFECT, 42)
setCombatFormula(combat, COMBAT_FORMULA_LEVELMAGIC, -1, -650, -1, -750)

function mb22(cid, var)      
    doPlayerSendTextMessage(cid,27,'The Great Ball is ready. Use the spell "Great Ball" again to release it.')                 
        cont2 = 50
end

function hb22(cid, var)      
    doPlayerSay(cid, 'Peoples of the world give me a little of its power!', TALKTYPE_ORANGE_1)                 
        addEvent(mb22,5500,cid)

end

function mbcd(cid, var)     
    doPlayerSay(cid, 'All living beings grant me a little of your power!', TALKTYPE_ORANGE_1)                 
        addEvent(hb22,5500,cid)
end

function kbc(cid, var)    
    doPlayerSay(cid, 'Nature give me a little of your power!', TALKTYPE_ORANGE_1)     
	    addEvent(mbcd,5500,cid)
end



function onCastSpell(cid, var)
	if cont2 < 30 then
	  addEvent(kbc,0,cid)
	end
        if cont2 > 30 then
		doPlayerSay(cid, 'Great Ball!', TALKTYPE_ORANGE_1) 
		    doCombat(cid, combat, var)
			cont2 = 0
			return true	
        end		
end