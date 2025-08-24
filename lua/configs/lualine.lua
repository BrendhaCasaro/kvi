local mode_map = {
	NORMAL = "N",
	INSERT = "I",
	VISUAL = "V",
	TERMINAL = "T",
	COMMAND = "C",
}

return {
	options = {
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(m)
					return mode_map[m] or m
				end,
			},
		},
		lualine_b = {
			{
				"buffers",
				symbols = { alternate_file = "" },
				hide_filename_extension = true,
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
}
