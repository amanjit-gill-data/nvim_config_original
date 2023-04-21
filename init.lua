-- to find lua config files
local config_path = os.getenv("XDG_CONFIG_HOME") .. "\\nvim\\?.lua;"
package.path = package.path .. config_path 

-- to set shell
-- it already knows that bash is my preferred shell, but :terminal passes a
-- mangled command to it; so I'm resetting the shell here
vim.cmd("set shell=bash")

-- for optional python provider
vim.cmd("let g:python3_host_prog = 'C:\\Users\\amanj\\miniconda3\\envs\\ag23\\python.exe'")
vim.cmd("let g:python_host_prog = 'C:\\Users\\amanj\\miniconda3\\envs\\ag23\\python.exe'")

require("setup_plugins")
require("core.options")
require("core.colours")
require("core.keymaps")
require("plugin.comment")
require("plugin.nvim-tree")
require("plugin.lualine")

-- basic autocompletion inc snippets
require("plugin.nvim-cmp")
require("plugin.autopairs")

-- LSP 
require("plugin.lsp.mason")
require("plugin.lsp.lspconfig")

