local map = vim.keymap.set

map("i", "jk", "<ESC>")
map("n", "<ESC>", "<cmd>noh<CR><ESC>")
map("v", "p", '"_dP')

-- move on insert mode
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- switch window
map("n", "<C-h>", "<C-w>h", { desc = "switch window left" })
map("n", "<C-l>", "<C-w>l", { desc = "switch window right" })
map("n", "<C-j>", "<C-w>j", { desc = "switch window down" })
map("n", "<C-k>", "<C-w>k", { desc = "switch window up" })

-- resizing
map("n", "<C-Up>", ":resize +5<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", ":resize -5<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", ":vertical resize +5<CR>", { desc = "Increase window width" })
map("n", "<C-Right>", ":vertical resize -5<CR>", { desc = "Decrease window width" })

-- buffers
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "next buffer" })
map("n", "<S-Tab>", "<cmd>bprev<CR>", { desc = "previous buffer" })
map("n", "<leader>x", "<cmd>bdelete!<CR>", { desc = "close buffer" })

-- line numbers
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- indenting
map({ "n", "v" }, ">", ">gv")
map({ "n", "v" }, "<", "<gv")

-- center screen when jumping
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

-- save
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "save File" })
