-- to find lua config files
local config_path = os.getenv("XDG_CONFIG_HOME") .. "\\nvim\\?.lua;"
package.path = package.path .. config_path 

-- settings for Nvim-R
-- doesn't work unless I set window ID myself
-- doesn't work with any shell other than cmd.exe
vim.cmd("let $WINDOWID = win_getid()")
vim.cmd("let &shell = 'cmd.exe'")
vim.cmd("let R_path = 'C:\\Program Files\\R\\R-4.2.3\\bin\\x64'")
vim.cmd("let $PATH = 'C:\\rtools42\\usr\\bin;' . $PATH")


vim.cmd("let R_nvim_wd = 1")
vim.cmd("let R_objbr_auto_start = 1")

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

