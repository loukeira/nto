function onDeath(cid, corpse, killer)

local M ={
["The Chakra Bijuu 1"] = {Pos = {x=1129,y=1081,z=7},id= 1026 ,time = 10},
["The Chakra Bijuu 2"] = {Pos = {x=1131, y=1082, z=6},id= 1026 ,time = 10},
["The Chakra Bijuu Control"] = {Pos = {x=1131, y=1082, z=5},id= 1026 ,time = 10},
["The Gaara"] = {Pos = {x=1131, y=1082, z=4},id= 1026 ,time = 10},
["The Yugito Nii"] = {Pos = {x=1131, y=1082, z=3},id= 1026 ,time = 10},
["The Roushi"] = {Pos = {x=1131, y=1082, z=2},id= 1026 ,time = 10},
["The Han"] = {Pos = {x=1112, y=1004, z=7},id= 1026 ,time = 10},
["The Utakata"] = {Pos = {x=1115, y=1004, z=6},id= 1026 ,time = 10},
["The Fuu"] = {Pos = {x=1115, y=1004, z=5},id= 1026 ,time = 10},
["The Killer Bee"] = {Pos = {x=1115, y=1004, z=4},id= 1026 ,time = 10},
["The Naruto"] = {Pos = {x=1115, y=1004, z=3},id= 1026 ,time = 10},
["The Shukaku"] = {Pos = {x=1115, y=1004, z=2},id= 1026 ,time = 10},
["The Nibi"] = {Pos = {x=446, y=1124, z=7},id= 1026 ,time = 10},
["The Sambi"] = {Pos = {x=449, y=1124, z=6},id= 1026 ,time = 10},
["The Yonbi"] = {Pos = {x=449, y=1124, z=5},id= 1026 ,time = 10},
["The Gobi"] = {Pos = {x=449, y=1124, z=4},id= 1026 ,time = 10},
["The Rokubi"] = {Pos = {x=449, y=1124, z=3},id= 1026 ,time = 10},
["The Shichibi"] = {Pos = {x=449, y=1124, z=2},id= 1026 ,time = 10},
["The Hachibi"] = {Pos = {x=449, y=1124, z=1},id= 1026 ,time = 10},
["The Kyuubi"] = {Pos = {x=449, y=1124, z=0},id= 1026 ,time = 10},
["The Obito"] = {Pos = {x=1152, y=1053, z=7},id= 1480 ,time = 10},
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