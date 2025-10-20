-- Basic settings
vim.loader.enable()
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.confirm = true
vim.opt.wrap = true
vim.opt.mouse = "a"
vim.opt.iskeyword:append("-")

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- Scroll
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Undo
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Visual settings
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
vim.opt.showmode = false
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 300
vim.opt.fillchars = { eob = " " }

-- Cursor
vim.opt.guicursor = {
  "n-v-c:block",                                         -- Normal, Visual, Command-line
  "i-ci:ver25",                                          -- Insert, Command-line Insert, Visual-exclusive
  "r-cr:hor20",                                          -- Replace, Command-line Replace
  "o:hor50",                                             -- Operator-pending
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor", -- All modes: blinking & highlight groups
  "sm:block-blinkwait175-blinkoff150-blinkon175",        -- Showmatch mode
}

-- Folding settings
vim.opt.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Command-line completion
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"

-- Better diff options
vim.opt.fillchars.diff = "/"
vim.opt.diffopt = {
  "internal",
  "filler",
  "closeoff",
  "vertical",
  "linematch:60",
  "algorithm:histogram",
  "indent-heuristic",
}

-- Performance improvements
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

-- Disable some default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Clipboard
vim.opt.clipboard:append("unnamedplus")

local function is_wsl()
  local wsl_env = vim.fn.getenv("WSLENV")
  local uname = vim.fn.system("uname -r")
  return wsl_env ~= vim.NIL or uname:match("WSL") ~= nil
end

if is_wsl() then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = { ["+"] = "/mnt/c/Windows/System32/clip.exe", ["*"] = "/mnt/c/Windows/System32/clip.exe" },
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end

-- add binaries installed by mason.nvim to path
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, "/") .. ":" .. vim.env.PATH
