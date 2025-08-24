local autocmd = vim.api.nvim_create_autocmd

local function augroup(group_name)
	return vim.api.nvim_create_augroup(group_name, { clear = true })
end

-- update lazy plugins
autocmd("VimEnter", {
	callback = function()
		require("lazy").update({ show = false })
	end,
})

-- Highlight text on yank
autocmd("TextYankPost", {
	group = augroup("HighlightOnYank"),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Return to last edit position when opening files
autocmd("BufReadPost", {
	group = augroup("ReturnToLastEditPositionWhenOpeningFiles"),
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Auto-resize splits when window is resized
autocmd("VimResized", {
	group = augroup("AutoResizeSplits"),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("AutoCreateDir"),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("CloseWithQ"),
	pattern = {
		"PlenaryTestPopup",
		"checkhealth",
		"gitsigns-blame",
		"help",
		"lspinfo",
		"qf",
		"terminal",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.schedule(function()
			vim.keymap.set("n", "q", function()
				vim.cmd("close")
				pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
			end, {
				buffer = event.buf,
				silent = true,
			})
		end)
	end,
})
