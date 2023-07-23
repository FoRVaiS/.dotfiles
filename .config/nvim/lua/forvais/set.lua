local set = vim.opt

-- set.pastetoggle=<F3>

set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.expandtab = true
set.smartindent = true

set.number = true
set.relativenumber = true

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = true
set.incsearch = true

set.colorcolumn = "120"

vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 100

-- Strip trailing whitespaces
vim.api.nvim_exec([[
  autocmd BufWritePre * :%s/\s\+$//e
]], false)

vim.opt.eol = true

vim.g.copilot_no_tab_map = true

-- It almost does what I want... except that it changes the working directory everytime I open a new file, even while in nvim.
-- I need a solution to that update the working directory whenever an nvim instance is launched.
-- set.autochdir = true
