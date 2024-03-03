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

dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    cb({
      type = 'executable',
      command = '/usr/bin/python3',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    type = 'python',
    request = 'launch',
    name = 'Debug Current File',
    program = "${file}",
    args = function ()
      local args = vim.fn.input('Arguments: ', '')
      args = vim.split(args, ' ')
      return args
    end
  },
  {
    type = 'python',
    request = 'launch',
    name = 'Debug Current File (venv)',
    program = "${file}",
    pythonPath = function()
      local venv_path = vim.fn.input('Path to venv : ', './venv')

      if venv_path == '' then
        venv_path = './venv'
      end

      if venv_path:sub(-1) ~= '/' then
        venv_path = venv_path .. '/'
      end

      return venv_path .. 'bin/python'
    end,
    args = function ()
      local args = vim.fn.input('Arguments: ', '')
      args = vim.split(args, ' ')
      return args
    end
  }
}
