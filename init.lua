local Alphabet = {
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
	"O",
	"P",
	"Q",
	"R",
	"S",
	"T",
	"U",
	"V",
	"W",
	"X",
	"Y",
	"Z",
}

for _, letter in ipairs(Alphabet) do

minetest.register_node('scrabble:tile_' .. letter, {
	description = ("Scrabble" .. " " .. letter ),
	drawtype = "nodebox",
	tiles = {
		'scrabble_tile.png^scrabble_' .. letter .. '.png',
		'scrabble_tile.png',
		'scrabble_tile.png',
		'scrabble_tile.png',
		'scrabble_tile.png',
		'scrabble_tile.png'
	},
    selection_box = {
        type = "fixed",
        fixed = { -0.48, -0.5, -0.48, 0.48, -0.25, 0.48 }
	},
	node_box = {
		type = "fixed",
		fixed = { -0.48, -0.5, -0.48, 0.48, -0.25, 0.48 }
	},
	sunlight_propagates = true,
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	groups = { snappy = 3 },
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})
end
