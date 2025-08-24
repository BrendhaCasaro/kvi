local dap = require("dap")
local dapui = require("dapui")

dapui.setup({
	layouts = {
		{
			elements = {
				{ id = "repl", size = 0.25 },
				{ id = "scopes", size = 0.75 },
			},
			position = "right",
			size = 90,
		},
	},
})
require("nvim-dap-virtual-text").setup()

-- Adapters
require("dap-go").setup()

dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close

vim.fn.sign_define("DapBreakpoint", { text = " " })
