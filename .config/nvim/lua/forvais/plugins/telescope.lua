local builtin = require('telescope.builtin')
-- Telescope menu
vim.keymap.set('n', '<leader>tls', ':Telescope<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tlss', ':Telescope<CR>', { noremap = true, silent = true }) -- Complete faster

-- Builtins
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader><C-p>', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

-- Extensions
vim.keymap.set('n', '<leader>tlsags', ':AdvancedGitSearch<CR>', { noremap = true, silent = true })

local telescope = require('telescope')

telescope.setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}
