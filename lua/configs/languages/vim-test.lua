vim.g["test#custom_strategies"] = {
	kvi = function(cmd)
		-- Find and close previous test terminal buffer
		local old_buf
		for _, b in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_valid(b) then
				local ok, val = pcall(vim.api.nvim_buf_get_var, b, "is_vimtest_terminal")
				if ok and val then
					old_buf = b
					break
				end
			end
		end
		if old_buf then
			pcall(vim.api.nvim_buf_delete, old_buf, { force = true })
		end

		-- Open a new vertical split for the terminal
		vim.cmd.vnew()

		-- Run the test command in the new terminal buffer
		local ok, job_id = pcall(vim.fn.jobstart, cmd, { term = true })
		if not ok then
			print("Failed to start test job: " .. tostring(job_id))
			return
		end

		-- Mark buffer as vim-test terminal
		local bufnr = vim.api.nvim_get_current_buf()
		vim.api.nvim_buf_set_var(bufnr, "is_vimtest_terminal", true)
		vim.cmd.stopinsert() -- Leave insert mode
	end,
}

vim.g["test#strategy"] = "kvi"
