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
    "Mofiqul/dracula.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      vim.cmd.colorscheme("dracula")
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
