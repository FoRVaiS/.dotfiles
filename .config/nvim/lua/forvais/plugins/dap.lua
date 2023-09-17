local dap = require("dap")

vim.api.nvim_set_keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dr", ":DapContinue<CR>", { noremap = true })

dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter",
  }
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal",
      runtimeExecutable = vim.fn.exepath("node"),
    },
  }
end

dap.adapters.python = {
  type = 'executable',
  command = 'python3',
  args = {'-m', 'debugpy.adapter'},
}

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = "Debug Current File",
    program = "${file}",
    pythonPath = "/path/to/your/venv/bin/python3",
    args = function()
      local arguments = vim.fn.input("Arguments: ")
      return vim.split(arguments, " ")
    end
  },
  {
    type = 'python',
    request = 'launch',
    name = "Debug Current File in venv",
    program = "${file}",
    pythonPath = function()
      local venv_path = vim.fn.input("Path to venv: ")
      return venv_path.."/bin/python3"
    end,
    args = function()
      local arguments = vim.fn.input("Arguments: ")
      return vim.split(arguments, " ")
    end
  }
}
