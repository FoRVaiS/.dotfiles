local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return require('packer').startup(function (use)
  -- Plugin management
  use 'wbthomason/packer.nvim'

  -- Appearance
  use({
    'tomasiser/vim-code-dark',
    as = 'codedark',
  })

  -- Navigation and Searching
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  })
  use('christoomey/vim-tmux-navigator')
  use('theprimeagen/harpoon')

  -- Session and State Management
  use('tpope/vim-obsession')
  use('mbbill/undotree')

  -- Git Integration
  use('tpope/vim-fugitive')
  use('lewis6991/gitsigns.nvim')

  -- Language Support and Editing
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('nvim-treesitter/nvim-treesitter-refactor')
  use('joosepalviste/nvim-ts-context-commentstring')
  use('tpope/vim-commentary')
  use({
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},


      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},


      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  })
  use('jiangmiao/auto-pairs')

  -- AI Assistance
  use('github/copilot.vim')

  -- Game
  use('theprimeagen/vim-be-good')

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
