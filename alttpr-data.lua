local Item = {}

function Item:new(id, xy, bits, total)
    self = {}
    self.id = id
    self.xy = xy
    self.bits = bits
    self.total = total
    return self
end

item_rooms_data_lw = {}
item_ow_data_01_lw = {}
item_rooms_data_dw = {}
item_ow_data_01_dw = {}
specialitems_lw = {}
specialitems_dw = {}
digits = {}
spritenumber0graphic = {}

--link's house - entrance 01
item_rooms_data_lw[1] = Item:new({ 0x0208 }, { 0x887c }, { 0 }, { 0x01 })
--sanctuary - entrance 02
item_rooms_data_lw[2] = Item:new({ 0x0024 }, { 0x753b }, { 0 }, { 0x01 })
--rooms hyrule castle - entrance 04
item_rooms_data_lw[3] = Item:new({ 0x00e4, 0x00e2, 0x0100, 0x0064, 0x0022, 0x0022, 0x0022 }, { 0x7f4f },
    { 0, 0, 0, 0, 0, 1, 2 }, { 0x07 })
--secret entrance hyrule castle - entrance 32
item_rooms_data_lw[4] = Item:new({ 0x00aa }, { 0x934e }, { 0 }, { 0x01 })
--cave of lumberjacks - entrance 12
item_rooms_data_lw[5] = Item:new({ 0x01c4 }, { 0x5c19 }, { 5 }, { 0x01 })
--cave death mountain 1 - entrance 1c
item_rooms_data_lw[6] = Item:new({ 0x01fc }, { 0xb422 }, { 0 }, { 0x01 })
--cave death mountain 2 - entrance 1e
item_rooms_data_lw[7] = Item:new({ 0x01fe, 0x01fe }, { 0xc11d }, { 0, 1 }, { 0x02 })
--cave death mountain 3 - entrance 1f
item_rooms_data_lw[8] = Item:new({ 0x01de, 0x01de, 0x01de, 0x01de, 0x01de }, { 0xc427 }, { 0, 1, 2, 3, 4 }, { 0x05 })
--cave death mountain 4 - entrance 23
item_rooms_data_lw[9] = Item:new({ 0x01d4 }, { 0x7c19 }, { 6 }, { 0x01 })
--rooms hyrule castle agahnim - entrance 24
item_rooms_data_lw[10] = Item:new({ 0x01c0, 0x01a0 }, { 0x7f47 }, { 0, 0 }, { 0x02 })
--cave lost woods - entrance 25
item_rooms_data_lw[11] = Item:new({ 0x01c2 }, { 0x451f }, { 5 }, { 0x01 })
--rooms eastern palace - entrance 08
item_rooms_data_lw[12] = Item:new({ 0x0172, 0x0154, 0x0150, 0x0152, 0x0170, 0x0190 }, { 0xd84d }, { 0, 0, 0, 0, 0, 7 },
    { 0x06 })
--rooms desert palace - entrance 09
item_rooms_data_lw[13] = Item:new({ 0x010a, 0x00ea, 0x00e8, 0x00e6, 0x00e6, 0x0066 }, { 0x218d }, { 0, 0, 0, 0, 6, 7 },
    { 0x06 })
--rooms tower of hera - entrance 33
item_rooms_data_lw[14] = Item:new({ 0x00ee, 0x010e, 0x010e, 0x004e, 0x004e, 0x000e }, { 0x8a0e }, { 0, 0, 6, 0, 1, 7 },
    { 0x06 })
--cave kakariko village - entrance 39
item_rooms_data_lw[15] = Item:new({ 0x005e, 0x005e, 0x005e, 0x005e, 0x005e }, { 0x1d4c }, { 0, 1, 2, 3, 4 }, { 0x05 })
--tavern kakariko village - entrance 42
item_rooms_data_lw[16] = Item:new({ 0x0206 }, { 0x3960 }, { 0 }, { 0x01 })
--sahasrahla's hideout - entrance 45
item_rooms_data_lw[17] = Item:new({ 0x020a, 0x020a, 0x020a }, { 0xbd4f }, { 0, 1, 2 }, { 0x03 })
--sweeping woman kakariko village - entrance 4b
item_rooms_data_lw[18] = Item:new({ 0x0210 }, { 0x2a61 }, { 0 }, { 0x01 })
--cave aginah desert - entrance 4d
item_rooms_data_lw[19] = Item:new({ 0x0214 }, { 0x3d97 }, { 0 }, { 0x01 })
--swamp ruins - entrance 4e
item_rooms_data_lw[20] = Item:new({ 0x0216 }, { 0x77ae }, { 0 }, { 0x01 })
--cave death mountain 5 - entrance 4f
item_rooms_data_lw[21] = Item:new({ 0x0218 }, { 0xbe15 }, { 0 }, { 0x01 })
--cave south of flute guy(same room after this) - entrance 51
item_rooms_data_lw[22] = Item:new({ 0x0236 }, { 0x8637 }, { 5 }, { 0x01 })
--cave graveyard(same room as previous one) - entrance 52
item_rooms_data_lw[23] = Item:new({ 0x0236 }, { 0x4c97 }, { 6 }, { 0x01 })
--cave of ice - entrance 56
item_rooms_data_lw[24] = Item:new({ 0x0240 }, { 0xd687 }, { 0 }, { 0x01 })
--cave waterfall - entrance 5c
item_rooms_data_lw[25] = Item:new({ 0x0228, 0x0228 }, { 0xca1b }, { 0, 1 }, { 0x02 })
--blinds' house kakariko village - entrance 61
item_rooms_data_lw[26] = Item:new({ 0x023a, 0x023a, 0x023a, 0x023a, 0x023a }, { 0x2f4d }, { 0, 1, 2, 3, 4 }, { 0x05 })
--cave west of lake hylia - entrance 6c
item_rooms_data_lw[27] = Item:new({ 0x0246, 0x0246, 0x0246, 0x0246, 0x0246 }, { 0xa2ac }, { 0, 1, 2, 3, 6 }, { 0x05 })
--cave west of sanctuary - entrance 6e
item_rooms_data_lw[28] = Item:new({ 0x0248 }, { 0x633e }, { 0 }, { 0x01 })
--cave east of desert palace - entrance 72
item_rooms_data_lw[29] = Item:new({ 0x024c }, { 0x388e }, { 5 }, { 0x01 })
--king's tomb - entrance 72
item_rooms_data_lw[30] = Item:new({ 0x0226 }, { 0x8e3a }, { 0 }, { 0x01 })
--hill near tower death mountain - area 03
item_ow_data_01_lw[1] = Item:new({ 0x0283 }, { 0x8015 }, { 6 }, { 0x01 })
--floating island death mountain - area 05
item_ow_data_01_lw[2] = Item:new({ 0x0285 }, { 0xaf10 }, { 6 }, { 0x01 })
--race game kakariko village - area 28
item_ow_data_01_lw[3] = Item:new({ 0x02a8 }, { 0x197c }, { 6 }, { 0x01 })
--grove hidden treasure - area 2a
item_ow_data_01_lw[4] = Item:new({ 0x02aa }, { 0x5375 }, { 6 }, { 0x01 })
--desert ledge - area 30
item_ow_data_01_lw[5] = Item:new({ 0x02b0 }, { 0x10a8 }, { 6 }, { 0x01 })
--lake hylia island - area 35
item_ow_data_01_lw[6] = Item:new({ 0x02b5 }, { 0xb195 }, { 6 }, { 0x01 })
--lake swamp - area 3b
item_ow_data_01_lw[7] = Item:new({ 0x02bb }, { 0x6fad }, { 6 }, { 0x01 })
--dw death mountain cave 1 - entrance 13
item_rooms_data_dw[1] = Item:new({ 0x01f0, 0x01f0 }, { 0xbc1f }, { 0, 1 }, { 0x02 })
--dark palace - entrance 26
item_rooms_data_dw[2] = Item:new(
{ 0x0012, 0x0074, 0x0014, 0x0054, 0x0054, 0x0056, 0x0034, 0x0034, 0x0034, 0x0032, 0x0032, 0x00d4, 0x00d4, 0x00b4 },
    { 0xd849 }, { 0, 0, 0, 0, 1, 0, 0, 1, 2, 0, 1, 0, 1, 7 }, { 0x0e })
--swamp palace - entrance 25
item_rooms_data_dw[3] = Item:new({ 0x0050, 0x006e, 0x006c, 0x008c, 0x0068, 0x006a, 0x00ec, 0x00ec, 0x00cc, 0x000c },
    { 0x75af }, { 0, 0, 0, 0, 0, 0, 0, 1, 0, 7 }, { 0x0a })
--skull woods - entrance 28
item_rooms_data_dw[4] = Item:new({ 0x00b0, 0x00b0, 0x00d0, 0x00ce, 0x00ae, 0x00ae, 0x00b2, 0x0052 }, { 0x2626 },
    { 0, 1, 0, 0, 0, 1, 0, 7 }, { 0x08 })
--thieves' town - entrance 34
item_rooms_data_dw[5] = Item:new({ 0x01b6, 0x01b6, 0x01b8, 0x0196, 0x00ca, 0x0088, 0x008a, 0x0158 }, { 0x3056 },
    { 0, 1, 0, 0, 0, 0, 0, 7 }, { 0x08 })
--ice palace - entrance 2d
item_rooms_data_dw[6] = Item:new({ 0x005c, 0x003e, 0x00be, 0x00fc, 0x013c, 0x015c, 0x007e, 0x01bc }, { 0xc09f },
    { 0, 0, 0, 0, 0, 0, 0, 7 }, { 0x08 })
--misery mire - entrance 27
item_rooms_data_dw[7] = Item:new({ 0x0184, 0x0186, 0x0186, 0x0166, 0x0144, 0x0182, 0x01a2, 0x0120 }, { 0x2191 },
    { 0, 0, 1, 0, 0, 0, 0, 7 }, { 0x08 })
--turtle rock - entrance 35
item_rooms_data_dw[8] = Item:new({ 0x01ac, 0x016e, 0x016e, 0x016c, 0x0028, 0x0048, 0x0008, 0x01aa, 0x01aa, 0x01aa, 0x01aa, 0x0148 },
    { 0xd119 }, { 0, 0, 1, 0, 0, 0, 0, 0, 1, 2, 3, 7 }, { 0x0c })
--ganon's tower - entrance 37
item_rooms_data_dw[9] = Item:new(
{ 0x0118, 0x0118, 0x0118, 0x0118, 0x0118, 0x00f6, 0x00f6, 0x00f6, 0x00f6, 0x0116, 0x00fa, 0x0038, 0x0038, 0x0038, 0x013a, 0x013a, 0x013a, 0x013a, 0x00f8, 0x00f8, 0x00f8, 0x00f8, 0x007a, 0x007a, 0x007a, 0x009a, 0x011a },
    { 0x8810 }, { 0, 1, 2, 3, 6, 0, 1, 2, 3, 0, 0, 0, 1, 2, 0, 1, 2, 3, 0, 1, 2, 3, 0, 1, 2, 0, 0 }, { 0x1b })
--dw death mountain cave 2 - entrance 3a
item_rooms_data_dw[10] = Item:new({ 0x0078, 0x0078, 0x0078, 0x0078 }, { 0xb817 }, { 0, 1, 2, 3 }, { 0x04 })
--cave northeast of swamp palace - entrance 3d
item_rooms_data_dw[11] = Item:new({ 0x023c, 0x023c, 0x023c, 0x023c, 0x023c }, { 0x9390 }, { 0, 1, 2, 3, 6 }, { 0x05 })
--dw death mountain cave 3 - entrance 41
item_rooms_data_dw[12] = Item:new({ 0x022e }, { 0x8922 }, { 0 }, { 0x01 })
--dw treasure game village of outcasts - entrance 47
item_rooms_data_dw[13] = Item:new({ 0x020c }, { 0x2157 }, { 6 }, { 0x01 })
--hut village of outcasts - entrance 48
item_rooms_data_dw[14] = Item:new({ 0x020c }, { 0x2b6c }, { 0 }, { 0x01 })
--c shaped house village of outcasts - entrance 54
item_rooms_data_dw[15] = Item:new({ 0x0238 }, { 0x4157 }, { 0 }, { 0x01 })
--cave left of misery mire - entrance 5f
item_rooms_data_dw[16] = Item:new({ 0x021a, 0x021a }, { 0x1991 }, { 0, 1 }, { 0x02 })
--cave of pegs - entrance 83
item_rooms_data_dw[17] = Item:new({ 0x024e }, { 0x566c }, { 6 }, { 0x01 })
--pyramid fairy
item_rooms_data_dw[18] = Item:new({ 0x022c, 0x022c }, { 0x7656 }, { 0, 1 }, { 0x02 })
--bumper cave ledge - area 4a
item_ow_data_01_dw[1] = Item:new({ 0x02ca }, { 0x6124 }, { 6 }, { 0x01 })
--pyramid ledge - area 5b
item_ow_data_01_dw[2] = Item:new({ 0x02db }, { 0x8b51 }, { 6 }, { 0x01 })
--digging game - area 68
item_ow_data_01_dw[3] = Item:new({ 0x02e8 }, { 0x1c7a }, { 6 }, { 0x01 })
--master sword pedestal- area 80
specialitems_lw[1] = Item:new({ 0x0300 }, { 0x2d10 }, { 6 }, { 0x01 })
--zora's ledge - area 81
specialitems_lw[2] = Item:new({ 0x0301 }, { 0xd41b }, { 6 }, { 0x01 })
--secret entrance hyrule castle - entrance 32
specialitems_lw[3] = Item:new({ 0x03c6 }, { 0x884e }, { 0 }, { 0x01 })
--guy under bridge - area 80
specialitems_lw[4] = Item:new({ 0x03c9 }, { 0xa77f }, { 0 }, { 0x01 })
--bottle guy kakariko village - area 18
specialitems_lw[5] = Item:new({ 0x03c9 }, { 0x2f56 }, { 1 }, { 0x01 })
--old man - area 03
specialitems_lw[6] = Item:new({ 0x0410 }, { 0x6f2d }, { 0 }, { 0x01 })
--zora king - area 81
specialitems_lw[7] = Item:new({ 0x0410 }, { 0xdc1b }, { 1 }, { 0x01 })
--bug catching kid kakariko village - entrance 40
specialitems_lw[8] = Item:new({ 0x0410 }, { 0x395b }, { 2 }, { 0x01 })
--sahasrahla's hideout - area 1e
specialitems_lw[9] = Item:new({ 0x0410 }, { 0xbd54 }, { 4 }, { 0x01 })
--library - area 29
specialitems_lw[10] = Item:new({ 0x0410 }, { 0x3778 }, { 7 }, { 0x01 })
--ether tablet death mountain - area 03
specialitems_lw[11] = Item:new({ 0x0411 }, { 0x720d }, { 0 }, { 0x01 })
--bombos tablet desert - area 30
specialitems_lw[12] = Item:new({ 0x0411 }, { 0x3fa8 }, { 1 }, { 0x01 })
--blacksmith kakariko village - entrance 64
specialitems_lw[13] = Item:new({ 0x0411 }, { 0x5763 }, { 2 }, { 0x01 })
--mushroom spot - area 00
specialitems_lw[14] = Item:new({ 0x0411 }, { 0x3a16 }, { 4 }, { 0x01 })
--witch's hut - area 16
specialitems_lw[15] = Item:new({ 0x0411 }, { 0xb940 }, { 5 }, { 0x01 })
--magic bat - area e3
specialitems_lw[16] = Item:new({ 0x0411 }, { 0x5a66 }, { 7 }, { 0x01 })
--purple chest - area 62
specialitems_dw[1] = Item:new({ 0x03c9 }, { 0x5763 }, { 4 }, { 0x01 })
--stumpy - area 6a
specialitems_dw[2] = Item:new({ 0x0410 }, { 0x577c }, { 3 }, { 0x01 })
--catfish - area 4f
specialitems_dw[3] = Item:new({ 0x0410 }, { 0xcc27 }, { 5 }, { 0x01 })

digits = { 0x83, 0x7f, 0x79, 0x6c, 0x6d, 0x6e, 0x6f, 0x7c, 0x7d, 0x7e }

spritenumber0graphic = { 0x3c, 0x00, 0x7e, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0xff, 0x00, 0x7e, 0x00, 0x3c, 0x00, 0xc3, 0x3c, 0xbd, 0x7e, 0x66, 0xff, 0x66, 0xff, 0x66, 0xff, 0x66, 0xff, 0xbd, 0x7e, 0xc3, 0x3c }
