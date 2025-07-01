return {
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofumpt" },
    javascript = { "eslint_d" },
    typescript = { "eslint_d" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}
