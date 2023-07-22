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
  use 'wbthomason/packer.nvim'

  use({
    'tomasiser/vim-code-dark',
    as = 'codedark',
  })
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({
    "aaronhallaert/advanced-git-search.nvim",
    config = function()
        require("telescope").load_extension("advanced_git_search")
    end,
    requires = {
      "nvim-telescope/telescope.nvim",
      "tpope/vim-fugitive",
      "tpope/vim-rhubarb",
    },
  })

  use ('christoomey/vim-tmux-navigator')
  use ('tpope/vim-obsession')

  use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use ('nvim-treesitter/nvim-treesitter-refactor')
  use ('joosepalviste/nvim-ts-context-commentstring')
  use ('tpope/vim-commentary')

  use ('theprimeagen/harpoon')
  use ('theprimeagen/vim-be-good')
  use ('mbbill/undotree')

  use {
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
  }

  use { 'airblade/vim-gitgutter' }
  use { 'jiangmiao/auto-pairs' }

  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

