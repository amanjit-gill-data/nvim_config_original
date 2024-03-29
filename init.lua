-- INIT --

-- python provider
vim.cmd("let g:python3_host_prog = 'C:\\Users\\amanj\\miniconda3\\envs\\dmml\\python.exe'")
vim.cmd("let g:python_host_prog = 'C:\\Users\\amanj\\miniconda3\\envs\\dmml\\python.exe'")

-- other config files
require("setup_plugins")
require("core.options")
require("core.colours")
require("core.keymaps")
require("plugin.comment")
require("plugin.nvim-tree")
require("plugin.lualine")
require("plugin.gitsigns")
require("plugin.slime")
require("plugin.nvim-r")

-- basic autocompletion inc snippets
require("plugin.nvim-cmp")

-- LSP 
require("plugin.lsp.mason")
require("plugin.lsp.lspconfig")



