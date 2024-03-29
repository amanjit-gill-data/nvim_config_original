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

  -- highlight word currently under cursor
  use("itchyny/vim-cursorword")

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

  -- git status in gutter
  use("lewis6991/gitsigns.nvim")

  -- R IDE implementation
  use("jalvesaq/Nvim-R")

  -- iPython integration
  use("jpalardy/vim-slime")

  -- AUTOCOMPLETION -- 

  -- autocompletion engine
  -- provides capability for drop-down suggestions
  -- doesn't include any sources
  use("hrsh7th/nvim-cmp")

  -- autocompletion sources
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("jalvesaq/cmp-nvim-r")

  -- snippet engine
  -- provides capability for loading and creating snippets
  -- doesn't include snippet sources
  -- for some reason my python completions don't work without this
  use("L3MON4D3/LuaSnip")

  -- DISABLED
  -- snippet sources
  -- cmp_luasnip: allows cmp to access snippets as an autocompletion source
  -- friendly-snippets: snippets for many different languages
  -- use("saadparwaiz1/cmp_luasnip")
  -- use("rafamadriz/friendly-snippets")

  -- autopair brackets 
  -- work with autocompleted functions/methods too
  use("windwp/nvim-autopairs")

  -- LANGUAGE SERVER FEATURES --
  -- LSP client is built into nvim but the servers themselves are not

  -- install and manage lsp servers
  -- can also install lsp servers into env via conda etc 
  use("williamboman/mason.nvim")

  -- makes it easier to use mason with lspconfig; bridges the two
  use("williamboman/mason-lspconfig.nvim")

  -- to configure lsp servers
  use("neovim/nvim-lspconfig")

  -- to connect lsp with autocompletion
  use("hrsh7th/cmp-nvim-lsp")

  -- FOR TREESITTER --

  -- easily install parsers 
  use("nvim-treesitter/nvim-treesitter")


end)


