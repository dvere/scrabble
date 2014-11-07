local alphabet = {
	{"blank"},
	{"A", "dye:dark_green", "", "", "", "", "", },
	{"B", "dye:dark_green", "dye:dark_green", "", "", "", "", },
	{"C", "dye:dark_green", "", "", "dye:dark_green", "", "", },
	{"D", "dye:dark_green", "", "", "dye:dark_green", "dye:dark_green", "", },
	{"E", "dye:dark_green", "", "", "", "dye:dark_green", "", },
	{"F", "dye:dark_green", "dye:dark_green", "", "dye:dark_green", "", "", },
	{"G", "dye:dark_green", "dye:dark_green", "", "dye:dark_green", "dye:dark_green", "", },
	{"H", "dye:dark_green", "dye:dark_green", "", "", "dye:dark_green", "", },
	{"I", "", "dye:dark_green", "", "dye:dark_green", "", "", },
	{"J", "", "dye:dark_green", "", "dye:dark_green", "dye:dark_green", "", },
	{"K", "dye:dark_green", "", "dye:dark_green", "", "", "", },
	{"L", "dye:dark_green", "dye:dark_green", "dye:dark_green", "", "", "", },
	{"M", "dye:dark_green", "", "dye:dark_green", "dye:dark_green", "", "", },
	{"N", "dye:dark_green", "", "dye:dark_green", "dye:dark_green", "dye:dark_green", "", },
	{"O", "dye:dark_green", "", "dye:dark_green", "", "dye:dark_green", "", },
	{"P", "dye:dark_green", "dye:dark_green", "dye:dark_green", "dye:dark_green", "", "", },
	{"Q", "dye:dark_green", "dye:dark_green", "dye:dark_green", "dye:dark_green", "dye:dark_green", "", },
	{"R", "dye:dark_green", "dye:dark_green", "dye:dark_green", "", "dye:dark_green", "", },
	{"S", "", "dye:dark_green", "dye:dark_green", "dye:dark_green", "", "", },
	{"T", "", "dye:dark_green", "dye:dark_green", "dye:dark_green", "dye:dark_green", "", },
	{"U", "dye:dark_green", "", "dye:dark_green", "", "", "dye:dark_green", },
	{"V", "dye:dark_green", "dye:dark_green", "dye:dark_green", "", "", "dye:dark_green", },
	{"W", "", "dye:dark_green", "", "dye:dark_green", "dye:dark_green", "dye:dark_green", },
	{"X", "dye:dark_green", "", "dye:dark_green", "dye:dark_green", "", "dye:dark_green", },
	{"Y", "dye:dark_green", "", "dye:dark_green", "dye:dark_green", "dye:dark_green", "dye:dark_green", },
	{"Z", "dye:dark_green", "", "dye:dark_green", "", "dye:dark_green", "dye:dark_green", },
}

for _, row in ipairs(alphabet) do
	local letter = row[1]
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
	
	if letter == "blank" then 
		minetest.register_craft({
			output = 'scrabble:tile_' .. letter ..' 10',
			recipe = {
				{'default:clay_lump'},
				{'dye:white'},
			}
		})
	else
		minetest.register_craft({
			output = 'scrabble:tile_' .. letter ..' 10',
			recipe = {
				{row[2], row[5], ""},
				{row[3], row[6], ""},
				{row[4], row[7], "scrabble:tile_blank"}
			}
		})
	end
end
