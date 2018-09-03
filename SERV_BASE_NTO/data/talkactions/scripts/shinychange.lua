function onSay(cid, words, param, channel)
if param == "" then
sendMsgToPlayer(cid, 20, "Diga !shinychange [nome do shiny]")
return true
end
local shinyes = {"Shiny Seadra", "Shiny Venusaur", "Shiny Blastoise", "Shiny Charizard", "Shiny Magmar", "Shiny Electabuzz", "Shiny Arcanine", "Shiny Raichu", "Shiny Electrode", "Shiny Tentacruel", "Shiny Golbat", "Shiny Muk", "Shiny Jynx", "Shiny Pinsir", "Shiny Tangela", "Shiny Venomoth", "Shiny Gengar", "Shiny Alakazam", "Shiny Mr. mime", "Shiny Marowak", "Shiny Farfetch'd", "Shiny Pidgeot"}
local thing = getPlayerSlotItem(cid, 8).uid
local pokename = getItemAttribute(thing, "poke")
local pokemon = doCorrectPokemonName(param)
local pokeparam = string.explode(shinyes, "")

if pokemon == pokename then
sendMsgToPlayer(cid, 20, "Nao pode troca-lo por ele mesmo.")
return true
end
if not isInArray(shinyes, pokename) then
sendMsgToPlayer(cid, 20, "Apenas shinyes.")
return true
end

if not isInArray(shinyes, pokemon) then
sendMsgToPlayer(cid, 20, "Este nao e um pokemon valido.")
return true
end
if getPlayerStorageValue(cid, 611233) >= 1 and doPlayerRemoveItem(cid, 2160, 100) and doPlayerRemoveItem(cid, 2160, 100) then
setPlayerStorageValue(cid, 611233, 0)
doPlayerSendTextMessage(cid, 20, "Agora voce pode trocar seu shiny.")
return true
end
if getPlayerStorageValue(cid, 611233) >= 1 then
doPlayerSendTextMessage(cid, 20, "Voce ja trocou seu shiny uma vez, custa 2kk para trocar novamente.")
return true
end
if getCreatureSummons(cid)[1] then
doPlayerSendCancel(cid, "Puxe seu pokemon.")
return true
end
if getPlayerStorageValue(cid, 611233) <= 0 then
sendMsgToPlayer(cid, 20, "Seu "..pokename.." foi transformado em um "..pokemon.." ")
setPlayerStorageValue(cid, 611233, 1)
doItemSetAttribute(thing, "poke", pokemon)
doItemSetAttribute(thing, "hp", 1)
end
return true
end