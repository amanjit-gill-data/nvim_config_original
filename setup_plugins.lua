-- PLUGINS CONFIG --
-- to trigger autocommand, do :w instead of :wq --

-- autocmd! removes all autocommands for the current group
-- autocmd BufwritePost etc checks if changes have been written into
-- plugins.lua, then sources the written file, then executes PackerSync
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost setup_plugins.lua source <afile> | PackerSync
  augroup end
]])

-- require all plugins, including packer itself
return require("packer").startup(function(use)

  -- need to require packer, otherwise it will uninstall itself
  use "wbthomason/packer.nvim"

  -- includes lua functions used by some other plugins
  use("nvim-lua/plenary.nvim")

  -- add/change/delete characters surrounding text
  use("tpope/vim-surround")

  -- overwrite with yanked text (gr + motion)
  use("inkarkat/vim-ReplaceWithRegister") 

  -- nightfly colour scheme
  use { "bluz71/vim-nightfly-colors", as = "nightfly" }

  -- maximise and un-maximise current window (or split window)
  use("szw/vim-maximizer")
 
  -- comment with 'gc'
  use("numToStr/Comment.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- icons for different file types
  -- used by both nvim-tree and lualine
  use("kyazdani42/nvim-web-devicons")

  -- status line
  use("nvim-lualine/lualine.nvim")

  -- nvim-r
  use("jalvesaq/Nvim-R")

  -- AUTOCOMPLETION -- 

  -- autocompletion engine
  -- provides capability for drop-down suggestions
  -- doesn't include any languages ("sources")
  use("hrsh7th/nvim-cmp")

  -- autocompletion sources
  -- cmp-buffer: gets cmp to recommend from the buffer
  -- cmp-path: gets cmp to recommend filepaths
  -- cmp-nvim-r: for R autocompletion 
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("jalvesaq/cmp-nvim-r")

  -- snippet engine
  -- provides capability for loading and creating snippets
  -- doesn't include snippet sources
  use("L3MON4D3/LuaSnip") 

  -- snippet "sources"
  -- cmp_luasnip: allows cmp to access snippets as an autocompletion source
  -- friendly-snippets: snippets for many different languages
  use("saadparwaiz1/cmp_luasnip") 
  use("rafamadriz/friendly-snippets")

  -- autopair brackets 
  -- configured to work with autocompleted text too
  use("windwp/nvim-autopairs")


  -- LANGUAGE SERVER FEATURES --
  -- LSP is built into nvim but the servers themselves are not
  
  -- install and manage lsp servers
  use("williamboman/mason.nvim")

  -- makes it easier to use mason with lspconfig; bridges the two
  use("williamboman/mason-lspconfig.nvim")
  
  -- to configure lsp servers
  use("neovim/nvim-lspconfig")

  -- to connect lsp with autocompletion
  use("hrsh7th/cmp-nvim-lsp")

end)


