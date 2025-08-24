return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		event = "VeryLazy",
		opts = require("configs.lualine"),
	},

	-- Theme
	{
		"olimorris/onedarkpro.nvim",
		priority = 1000, -- Ensure it loads first
		config = function()
			vim.cmd.colorscheme("onedark_dark")
		end,
	},

	-- Diagnostics
	{
		"folke/trouble.nvim",
		opts = {
			warn_no_results = false,
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>q",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "show diagnostics",
			},
		},
	},
}
