local dap = require("dap")
local dapui = require("dapui")
dapui.setup()

vim.api.nvim_set_keymap("n", "<leader>dt", ":lua require('dapui').toggle()<CR>", { noremap = true })

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
