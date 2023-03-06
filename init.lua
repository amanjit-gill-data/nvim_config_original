-- to find lua config files
local config_path = os.getenv("XDG_CONFIG_HOME") .. "\\nvim\\?.lua;"

-- for optional python provider
vim.cmd("let g:python3_host_prog = 'C:\\Users\\amanj\\miniconda3\\envs\\ag\\python.exe'")
vim.cmd("let g:python_host_prog = 'C:\\Users\\amanj\\miniconda3\\envs\\ag\\python.exe'")

-- to find rtools and r
vim.cmd("let R_path = 'C:\\rtools42\\usr\\bin;C:\\Program Files\\R\\R-4.2.2\\bin\\x64'")

-- to set shell
-- it already knows that bash is my preferred shell, but :terminal passes a
-- mangled command to it; so I'm resetting the shell here
vim.cmd("set shell=bash")

-- otherwise R immediately exits with error 127 (but editor still works)
-- only valid value in Windows is 1
-- vim.cmd("let R_external_term = 1")
vim.cmd("let R_cmd = 'R'")

package.path = package.path .. config_path 

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

