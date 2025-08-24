return {
	-- fugitive
	{ "tpope/vim-fugitive" },

	-- signs
	{
		"lewis6991/gitsigns.nvim",
		event = "BufReadPre",
		opts = {
			signs = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
				untracked = { text = "▎" },
			},
			signs_staged = {
				add = { text = "▎" },
				change = { text = "▎" },
				delete = { text = "" },
				topdelete = { text = "" },
				changedelete = { text = "▎" },
			},
			current_line_blame = true,
		},
		keys = function()
			local gitsigns = require("gitsigns")

			return {
				{ "<leader>gq", gitsigns.setloclist, desc = "git setloclist" },
				{ "<leader>gdf", gitsigns.diffthis, desc = "git diff file" },
				{ "<leader>gdh", gitsigns.preview_hunk, desc = "git diff hunk" },
				{ "<leader>gsf", gitsigns.stage_buffer, desc = "git stage file" },
				{ "<leader>gsh", gitsigns.stage_hunk, desc = "git stage hunk" },
				{ "<leader>gsuh", gitsigns.undo_stage_hunk, desc = "git undo stage hunk" },
				{
					"[c",
					function()
						gitsigns.nav_hunk("next")
					end,
					desc = "go to next git change",
				},
				{
					"]c",
					function()
						gitsigns.nav_hunk("prev")
					end,
					desc = "go to prev git change",
				},
			}
		end,
	},
}
