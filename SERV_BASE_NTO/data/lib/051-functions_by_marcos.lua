
function get_saga(cid) -- pega a saga, pela database.
    local ult = db.getResult('select `saga`, `my_saga_max` from players where id = \''..getPlayerGUID(cid)..'\' ')

    if (ult:getID() == -1) then
    return false
    end

    local my_saga_max = ult:getDataString("my_saga_max")
    local saga = ult:getDataString("saga")
    ult:free()

    saga = tonumber(saga)
    my_saga_max = tonumber(my_saga_max)

    return saga, my_saga_max --retorna dois valores, o valor da saga atual, eo valor da saga maxima "conquistada"

end

storage_anbu = 674911
storage_akatsuki = 674921

-- function number_sagas(cid)
-- local i = 0
-- for mar,cos in pairs(sagas[getPlayerVocationName(cid)]) do
-- i = i +1
-- end
--     return i
-- end

sagas = {
["kakashi"] = {9,10,11,12,13,14,15, 16,17 },
["sasuke"] = {655, 656, 657, 658, 659, 660, 661, 662, 663},
["sakura"] = {664, 665, 666, 667, 668, 669, 670, 671, 672},
["naruto"] = {673, 674, 675, 676, 677, 678, 679, 680, 681, 692, 693},
["sai"] = {682, 683, 684, 685, 686, 687, 688, 689, 690, 691},
["guy"] = {906, 907, 908, 909, 910, 911, 912, 913, 914, 915, 916},
["lee"] = {841, 842, 843, 844, 845, 846, 843, 847, 848, 849, 850, 851},
["neji"] = {829, 830, 831, 832, 833, 834, 835, 836, 837},
["tenten"] = {816, 817, 818, 819, 820, 821, 822, 823, 824},
["asuma"] = {568, 569, 570, 571, 572, 573},
["ino"] = {609, 610, 611, 612, 613, 614, 615, 616, 617},
["shikamaru"] = {618, 619, 620, 621, 622, 623, 624, 625, 626},
["chouji"] = {340, 341, 342, 343 , 344, 345, 346, 347},
["hinata"] = {852, 853, 854, 855, 856, 857, 858, 859, 860},
["kiba"] = {644, 645, 646, 647, 648, 649, 650, 651, 652},
["gaara"] = { 739, 740, 741, 742, 743, 744, 745, 746, 747 },
["temari"] = { 182, 183, 184, 185, 186, 187, 188, 189, 190 },
["kankuro"] = { 191, 192, 193, 194, 195, 196, 197, 198, 199 },
["jiraya"] = { 927, 931, 935, 936, 937, 938, 939, 940, 941  },
["tsunade"] = { 633, 634, 635, 636, 637, 638, 639, 640, 641 },
["Orochimaru"] = { 319, 320, 321, 322,  323,  324,  325,  326,  327 },
["kabuto"] = { 590, 591, 592, 593, 594, 595, 596, 597, 598 },
["itachi"] = { 705, 706, 707, 708, 709, 710, 711, 712, 713 },
["kisame"] = {  417,  418, 419, 420, 421, 422, 423, 424,  425, 426,  427 },
["deidara"] = { 790, 791, 792, 793, 794, 795, 796, 797, 798, 799 },
["sasori"] = { 748, 749, 750, 751, 752, 753, 754, 755 },
["hidan"] = { 781, 782, 783, 784, 785, 786, 787, 788, 789 },
["kakuzu"] = { 530, 531, 532, 533, 534, 535, 536, 537, 538 },
["nagato"] = { 523, 524, 525, 526, 527, 528, 529, 521, 522},
["konan"] = {  512, 513, 514, 515, 516, 517, 518, 519, 520 },
["zetsu"] = { 578, 579, 580 },
["yamato"] = { 428, 429, 430, 431, 432, 433, 434, 435, 436 },
["obito"] = { 476, 477, 478, 479, 480, 481, 482, 483, 484, 485 },
["suigetsu"] = { 937, 938, 939, 940, 941, 942, 943, 944, 945 },
["juugo"] = { 946, 947, 948, 949, 950, 951, 952, 953, 954 },
["kimimaro"] = { 490, 491, 492, 493, 494, 495, 496, 497, 498, 499 },
["bee"] = { 861, 862, 863, 864, 865, 866, 867, 868, 869 },
["shisui"] = { 917, 918, 919, 920, 921, 922, 923, 924, 925 },
["guren"] = { 500, 501, 502, 503, 504 ,505, 506 },
["minato"] = { 727, 728, 729, 730, 731, 732, 733, 734, 735, 736 },
["sarutobi"] = { 438, 439, 440, 441, 442, 443, 444, 445, 446},
["hashirama"] = { 757, 758, 759, 760, 761, 762, 763, 764, 765 },
["tobirama"] = { 448, 449, 450, 451, 452, 453, 454, 455, 456 },
["danzou"] = { 282, 283, 284, 285, 286, 287, 288, 289, 290 },
["madara"] = { 714, 715, 716, 717, 718, 719, 720, 721, 722, 723 },
["mu"] = { 91, 92, 93, 94, 95, 96, 97, 98, 99 },
["raikage"] = { 401, 402, 403, 404, 405, 406, 407, 408, 409 },
["tshuchikage"] = { 463, 464, 465, 466, 467, 468, 469, 470, 471 },

}


classes = {

lutador = { 'kakashi','naruto', 'guy', 'lee',  'neji' ,  'asuma' ,  'hinata' ,  'kiba' ,  'raikage'   },    
assassin = { 'sasuke',   'orochimaru' ,  'itachi' ,  'kisame' ,  'nagato' ,  'obito' ,  'suigetsu' ,  'kimimaro' ,  'bee' ,  'minato' ,  'sarutobi' ,  'tobirama' ,  'danzou' ,  'madara'  },
suporte = {  'sakura' ,  'ino' ,  'shikamaru' ,  'tsunade' ,  'kabuto' ,  'zetsu' ,  'guren'   },
atirador = {  'sai' ,  'tenten' ,  'shino' ,  'gaara' ,  'kankuro' , 'temari' ,  'deidara' ,  'sasori' ,  'kakuzu' ,  'konan' ,  'yamato' ,  'shisui' ,  'mu' ,  'tshuchikage'  },
tanker = {  'chouji' ,  'jiraya' ,  'hidan' ,  'juugo' ,  'hashirama'  }


}

function get_classes(cid)

            for vod,ka in pairs(classes.lutador) do
                    doPlayerSendTextMessage(cid,18,"lutador")
                if getPlayerVocationName(cid) == ka then
                    classe = 'lutador'
                    return classe
                end
            end

            for vod,ka in pairs(classes.assassin) do
                     doPlayerSendTextMessage(cid,18,"assassin")
                if getPlayerVocationName(cid) == ka then
                    classe = 'assassin'
                    return classe
                end
            end

            for vod,ka in pairs(classes.suporte) do
                     doPlayerSendTextMessage(cid,18,"suporte")
                if getPlayerVocationName(cid) == ka then
                    classe = 'suporte'
                    return classe
                end
            end

            for vod,ka in pairs(classes.atirador) do
                     doPlayerSendTextMessage(cid,18,"atirador")
                if getPlayerVocationName(cid) == ka then
                    classe = 'atirador'
                    return classe
                end
            end

            for vod,ka in pairs(classes.tanker) do
                    doPlayerSendTextMessage(cid,18,"tanker")
                if getPlayerVocationName(cid) == ka then
                    classe = 'tanker'
                    return classe
                end
            end

    
    return true
end




