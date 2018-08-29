function onUse(cid, item, frompos, item2, topos)


doSummonCreature("Kyuuby",topos)
      doBroadcastMessage("O "..getCreatureName(cid).." sumono uma kyuuby boss")
getPlayerName(cid)
doRemoveItem(item.uid)
doSendMagicEffect(topos,36)
end