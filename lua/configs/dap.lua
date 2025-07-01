local dap = require("dap")
local dapui = require("dapui")

require("dapui").setup()
require("dap-go").setup()
require("nvim-dap-virtual-text").setup()

dap.listeners.before.attach.dapui_config = dapui.open
dap.listeners.before.launch.dapui_config = dapui.open
dap.listeners.before.event_terminated.dapui_config = dapui.close
dap.listeners.before.event_exited.dapui_config = dapui.close
