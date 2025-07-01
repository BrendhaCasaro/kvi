pcall(function()
  dofile(vim.g.base46_cache .. "syntax")
  dofile(vim.g.base46_cache .. "treesitter")
end)

return {
  ensure_installed = {
    "printf",
    "vim",
    "vimdoc",

    "jsonc",
    "yaml",
    "markdown",
    "markdown_inline",
    "bash",

    "lua",
    "luadoc",

    "go",

    "typescript",
    "javascript",
    "jsdoc",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}
