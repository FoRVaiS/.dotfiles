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

set.hlsearch = false
set.incsearch = true

set.colorcolumn = "120"

vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 100

-- It almost does what I want... except that it changes the working directory everytime I open a new file, even while in nvim.
-- I need a solution to that update the working directory whenever an nvim instance is launched.
-- set.autochdir = true
