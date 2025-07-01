return {
  "folke/trouble.nvim",
  opts = {
    warn_no_results = false,
  },
  cmd = "Trouble",
  keys = {
    {
      "<leader>q",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Trouble Diagnostics",
    },
  },
}
