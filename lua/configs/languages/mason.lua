---@class MasonSettings
local mason = {
	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ",
		},
	},
	max_concurrent_installers = 10,
	PATH = "skip",
}

local mason_lsp = {
	ensure_installed = {},
	automatic_installation = true,
	automatic_enable = false,
}

local mason_tools = {
	auto_update = true,
	run_on_start = true,
	start_delay = 3000,
	ensure_installed = {},
	integrations = {
		["mason-lspconfig"] = true,
	},
}

local languages = require("configs.languages")
for _, lang in pairs(languages) do
	local server = type(lang.lsp) == "table" and lang.lsp.name or lang.lsp
	local tools = lang.tools
	if type(lang.tools) == "string" then
		tools = { lang.tools }
	end

	table.insert(mason_lsp.ensure_installed, server)
	for _, tool in pairs(tools or {}) do
		table.insert(mason_tools.ensure_installed, tool)
	end
end

require("mason").setup(mason)
require("mason-lspconfig").setup(mason_lsp)
require("mason-tool-installer").setup(mason_tools)
