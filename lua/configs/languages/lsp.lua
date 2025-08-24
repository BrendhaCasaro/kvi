local languages = require("configs.languages")

local configs = {}

configs.on_init = function(client, _)
	if not client.server_capabilities.semanticTokensProvider then
		local semantic = client.config.capabilities.textDocument.semanticTokens
		client.server_capabilities.semanticTokensProvider = {
			full = true,
			legend = {
				tokenTypes = semantic.tokenTypes,
				tokenModifiers = semantic.tokenModifiers,
			},
			range = true,
		}
	end
end

configs.on_attach = function(_, bufnr)
	local function map(keys, func, desc, mode)
		mode = mode or "n"
		vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc })
	end

	local telescope_builtin = require("telescope.builtin")

	map("gd", telescope_builtin.lsp_definitions, "go to definition")
	map("gi", telescope_builtin.lsp_implementations, "go to implementations")
	map("grr", telescope_builtin.lsp_references, "go to references")
	map("<leader>ls", telescope_builtin.lsp_document_symbols, "document symbols")
	map("<leader>ca", vim.lsp.buf.code_action, "code actions")
end

configs.capabilities = require("blink.cmp").get_lsp_capabilities()

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = {
		current_line = true,
	},
})

vim.lsp.inlay_hint.enable()

for _, lang in pairs(languages) do
	local server = lang.lsp
	local opts = {
		on_attach = configs.on_attach,
		capabilities = configs.capabilities,
		on_init = configs.on_init,
	}

	if type(lang.lsp) == "table" then
		server = lang.lsp.name
		opts = MergeTables(opts, lang.lsp.opts)
	end

	require("lspconfig")[server].setup(opts)
end
