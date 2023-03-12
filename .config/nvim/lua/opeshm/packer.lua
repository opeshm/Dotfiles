-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  -- Link: https://github.com/wbthomason/packer.nvim
  use 'wbthomason/packer.nvim'

  -- vim-ariline plugin
  -- Link: https://github.com/vim-airline/vim-airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'

  -- nvim-tree: File browser 
  -- Link: https://github.com/nvim-tree/nvim-tree.lua
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- nvim-telescope: FuzzyFinder
  -- Link: https://github.com/nvim-telescope/telescope.nvim
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "nvim-telescope/telescope-file-browser.nvim" }

  use {
    'nvim-lua/completion-nvim',
    config = function()
      require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
    end
  }

  -- lua require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}


  -- Startup page
  -- Link: https://github.com/startup-nvim/startup.nvim
  use {
    "startup-nvim/startup.nvim",
    requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
    config = function()
      require"startup".setup()
    end
  }

  -- Colorschema
  use 'bluz71/vim-moonfly-colors'
  use 'folke/tokyonight.nvim'

  -- Language highlight
  use 'hashivim/vim-terraform'
  use 'ekalinin/Dockerfile.vim'

  -- Hex colors hightlight 
  use 'ap/vim-css-color'
end)
