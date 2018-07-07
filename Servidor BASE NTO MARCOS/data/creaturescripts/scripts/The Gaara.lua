function onDeath(cid, corpse, killer)

local M ={
["The Gaara"] = {Pos = {x=1644,y=1674,z=7},id= 1514 ,time = 20},
["The Yugito Nii"] = {Pos = {x=1646, y=1674, z=7},id= 1514 ,time = 10},
["The Roushi"] = {Pos = {x=1648, y=1674, z=7},id= 1514 ,time = 10},
["The Han"] = {Pos = {x=1650, y=1674, z=7},id= 1514 ,time = 10},
["The Utakata"] = {Pos = {x=1652, y=1674, z=7},id= 1514 ,time = 10},
["The Fuu"] = {Pos = {x=1654, y=1674, z=7},id= 1514 ,time = 10},
["The Killer Bee "] = {Pos = {x=1656, y=1746, z=7},id= 1514 ,time = 10},
["The Naruto"] = {Pos = {x=1658, y=1746, z=7},id= 1514 ,time = 10},
["The Madara"] = {Pos = {x=1800, y=1479, z=7},id= 1514 ,time = 20},
}

local x = M[getCreatureName(cid)]
function criar()
                local parede = getTileItemById(x.Pos, x.id)
                doCreateItem(x.id, 1, x.Pos)
                end
if x then
                local parede = getTileItemById(x.Pos, x.id)
                if parede then
                                doRemoveItem(parede.uid, 1)
                                 doCreatureSay(cid, "A parede Será criada Novamente em "..x.time.." segundos.", TALKTYPE_ORANGE_1)
                                addEvent(criar, x.time*1000)
                end
end
return TRUE
end