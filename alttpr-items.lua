require "alttpr-data"

u8 = memory.read_u8
u16 = memory.read_u16_le
w8 = memory.write_u8
w16 = memory.write_u16_le
gui.drawimage = gui.drawImage
gui.drawtext = gui.drawText
--emu.callback = event.on_bus_exec

local indoors <const> = 0x1b
local nmi_flag <const> = 0x710
local toggle_map = false
local world = 1
local lx, ly = 0, 0

function pause()
	if toggle_map then
		emu.setregister("PC", 0xa18004)
	end
end

event.unregisterbyname("pause")
event.on_bus_exec(pause, 0xa18000, "pause")

local rooms = { item_rooms_data_lw, item_rooms_data_dw }
local overworld = { item_ow_data_01_lw, item_ow_data_01_dw }
local specialitems = { specialitems_lw, specialitems_dw }

local worldimgs = { "alttpr-images/lightworld.png", "alttpr-images/darkworld.png" }
local link = "alttpr-images/link.png"

function testbit(v, b)
	local mask = 1 << b
	return (v & mask) == mask
end

function shr(v, t)
	local c = 0
	for i = 1, t do
		c = v & 1
		v = v >> 1
	end
	return v, c
end

function drawtextcircle(xy, c)
	gui.drawPie(xy // 255, (xy & 255), c > 9 and 11 or 6, 7, 0, 360, 0xffffffff, 0xffffffff)
	gui.drawtext(xy // 255 - 1, (xy & 255) - 2, c, 0xff000000, 0, 10, "Consolas", "Regular")
end

function drawitemrooms()
	local c, t, b
	for k, v in ipairs(rooms[world]) do
		c = v.total[1]
		for i = 1, #v.id do
			b = u16(0x7ef000 + v.id[i], "System Bus")
			b = (b & 0xff0) >> 4
			if testbit(b, v.bits[i]) then
				c = c - 1
			end
		end
		if c > 0 then
			drawtextcircle(v.xy[1], c)
		end
	end
end

function drawitemsoverworld()
	local b, c = 0, 0
	for k, v in ipairs(overworld[world]) do
		for i = 1, #v.id do
			b = u16(0x7ef000 + v.id[i], "System Bus")
			b = (b & 0xff0) >> 4
			c = 1
			if testbit(b, 2) then
				c = 0
			end
			if c > 0 then
				drawtextcircle(v.xy[1], c)
			end
		end
	end
end

function drawspecialitems()
	for i, v in ipairs(specialitems[world]) do
		for n, t in ipairs(v.bits) do
			b = u8(0x7ef000 + v.id[1], "System Bus")
			c = 1
			if testbit(b, t) then
				c = 0
			end
			if c > 0 then
				drawtextcircle(v.xy[1], c)
			end
		end
	end
end

function draw()
	local room = u16(0xa0)
	local screen = u16(0x8a)
	local curritems = 0
	local prev = 0

	for i = 0, 0x1f8, 3 do
		local b = u16(0x81e96c + i) & 0x7fff
		if prev > 0 and prev ~= b then
			break
		end
		if b == room then
			curritems = curritems + 1
			prev = b
		end
	end

	b = u8(0x403)
	for i = 0, 6 do
		if testbit(b, i) then
			curritems = curritems - 1
		end
	end

	local sx, sy = getlinksposition()

	gui.drawtext(0, 5, string.format("Total:%d/216", u8(0xf423)), 24, 0x00ff00, 0x80000000)
	gui.drawtext(50, 5, string.format("LinkXY:%X,%X", sx, sy), 24, 0xffff80, 0x80000000)
	gui.drawtext(110, 5, string.format("Chests:%d", curritems < 0 and 0 or curritems), 24, 0xffffff, 0x80000000)
	gui.drawtext(150, 5, string.format("Room:%X", room * 2), 24, 0xffffff, 0x80000000)
	gui.drawtext(190, 5, string.format("Screen:%X", screen + 0x280), 24, 0xffffff, 0x80000000)
end

function getlinksposition()
	local i, c = shr(ly, 4)
	i = ~i + 1 + 0x1c8 + c - 0xc0
	local sy = u8(0x8ac5ec + i)
	sy = sy * 0x0d
	sy = (sy >> 4)
	c = 1
	local sx = shr(lx, 4) - 0x80
	c = sx < 0 and 0 or 1
	local s = c
	sx = sx < 0 and ~sx or sx
	local j = ((sy * 0x54) >> 8)
	j, i = (j + 0xb2) & 0xff, j + 0xb2
	c = i > 0xff and 1 or 0
	sx = j * sx
	c = s
	sx = c == 0 and 0x80 - (sx >> 8) or (sx >> 8) + 0x80
	return sx, sy
end

function drawlinksposition()
	--draw link's position
	local sx, sy = getlinksposition()
	gui.drawimage(link, sx - 10, sy)
	--gui.drawtextcircled(sx, sy +6, "P", 24, 0xffffff, 0x80000000)
end

while true do
	gui.clearGraphics()

	if u8(0xf6) & 0x20 > 0 then
		toggle_map = not toggle_map
	end

	if u8(indoors) == 0 then
		lx = u16(0x22)
		ly = u16(0x20)
	end

	if toggle_map then
		gui.drawimage(worldimgs[world], 0, 0)
		drawlinksposition()
		drawitemrooms()
		drawitemsoverworld()
		drawspecialitems()

		if u8(0xf4) == 1 or u8(0xf4) == 2 then
			world = world ~ 3
		end
	end

	draw()

	emu.frameadvance()
end
