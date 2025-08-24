return {
	{ "echasnovski/mini.ai", version = "*", opts = {} },
	{ "echasnovski/mini.surround", version = "*", opts = {} },
	{ "echasnovski/mini.cursorword", version = "*", opts = {} },
	{ "echasnovski/mini.indentscope", version = "*", opts = {} },
	{ "echasnovski/mini.move", version = "*", opts = {} },
	{ "echasnovski/mini.pairs", version = "*", opts = {} },
	{ "echasnovski/mini.splitjoin", version = "*", opts = { mappings = { toggle = "fS" } } },
	{
		"echasnovski/mini.files",
		version = "*",
		opts = {},
		config = function()
			vim.keymap.set("n", "<C-n>", function()
				local buf = vim.api.nvim_buf_get_name(0)
				if #buf > 0 and not StartsWith(buf, "/") then
					require("mini.files").close()
				else
					require("mini.files").open(buf, false)
				end
			end)
		end,
	},
}
