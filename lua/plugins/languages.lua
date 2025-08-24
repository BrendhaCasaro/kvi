return {
	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"saghen/blink.cmp",
		},
		event = { "BufReadPre", "BufNewFile", "User FilePost" },
		config = function()
			require("configs.languages.lsp")
			require("configs.languages.mason")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSUpdateSync", "TSUpdate" },
		build = ":TSUpdate",
		lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
		opts = require("configs.languages.treesitter"),
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},

	-- cmp
	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "1.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = require("configs.languages.blinkcmp"),
		opts_extend = {
			"sources.compat",
			"sources.default",
			"sources.completion.enabled_providers",
		},
	},

	-- Fmt
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
		opts = require("configs.languages.conform"),
	},

	-- Test
	{
		"vim-test/vim-test",
		cmd = { "TestLast", "TestNearest", "TestFile", "TestSuite" },
		keys = {
			{ "<leader>trn", ":TestNearest<cr>", "TEST - Run Nearest" },
			{ "<leader>trf", ":TestFile<cr>", "TEST - Run File" },
		},
		config = function()
			require("configs.languages.vim-test")
		end,
	},

	-- Debug
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
			"theHamsta/nvim-dap-virtual-text",

			-- adapters
			"leoluz/nvim-dap-go",
		},
		config = function()
			require("configs.languages.dap")
		end,
		keys = function()
			local dap = require("dap")

			local function map(keys, func, desc)
				return {
					"<leader>" .. keys,
					func,
					{ desc = "DEBUG - " .. desc },
				}
			end

			return {
				map("db", dap.toggle_breakpoint, "Toggle Breakpoint"),
				map("dc", dap.continue, "Continue"),
				map("dt", dap.terminate, "Terminate"),
				map("dso", dap.step_over, "Step Over"),
				map("dsi", dap.step_into, "Step Into"),
				map("?", function()
					require("dapui").eval()
					require("dapui").eval() -- trick to focus
				end, "Evaluate Expression"),
			}
		end,
	},
}
