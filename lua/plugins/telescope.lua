return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	version = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup({
			defaults = {
				prompt_prefix = "   ",
				selection_caret = " ",
				entry_prefix = " ",
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
					},
					width = 0.87,
					height = 0.80,
				},
			},
		})
	end,
	keys = function()
		local builtin = require("telescope.builtin")

		return {
			{
				"<leader>ff",
				function()
					builtin.find_files({
						hidden = true,
						file_ignore_patterns = { ".git/" },
					})
				end,
				desc = "find files",
			},
			{ "<leader>fw", builtin.live_grep, desc = "find words" },
			{ "<leader>fb", builtin.buffers, desc = "find buffers" },
			{ "<leader>fz", builtin.current_buffer_fuzzy_find, desc = "find in current buffer" },

			-- Git
			{ "<leader>fgs", builtin.git_status, desc = "git status" },
			{ "<leader>fgb", builtin.git_branches, desc = "git branches" },
			{ "<leader>fgc", builtin.git_commits, desc = "git commits" },
		}
	end,
}
