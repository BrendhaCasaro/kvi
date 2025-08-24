return {
  -- C-space: Open menu or open docs if already open
  -- C-n/C-p or Up/Down: Select next/previous item
  -- C-e: Hide menu
  -- C-k: Toggle signature help (if signature.enabled = true)
  keymap = { preset = "super-tab" },

  appearance = {
    -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = "mono",
    use_nvim_cmp_as_default = false,
  },

  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
    ghost_text = { enabled = vim.g.ai_cmp },
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      draw = { treesitter = { "lsp" } },
    },
  },

  cmdline = { enabled = false },

	-- Default list of enabled providers defined so that you can extend it
	-- elsewhere in your config, without redefining it, due to `opts_extend`
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},

  fuzzy = { implementation = "lua" },

  -- Shows a signature help window while you type arguments for a function
  signature = { enabled = true },
}
