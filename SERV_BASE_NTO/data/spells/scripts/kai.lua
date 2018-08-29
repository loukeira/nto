local effect = 111 -- efeito q vai sair quando remover o summon
 
function onCastSpell(cid, var)
 
summons = getCreatureSummons(cid)
 
for _, summon in pairs(summons) do
 
  doSendMagicEffect(getThingPos(summon), effect)
 
  doRemoveCreature(summon)
 
end
 
return true
 
end