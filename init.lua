-- to find lua config files 
-- otherwise it can only find them if nvim is started in config the directory
local config_path = os.getenv("XDG_CONFIG_HOME") .. "\\nvim\\?.lua;"
package.path = package.path .. config_path 

-- settings for Nvim-R
-- only works if I set window ID myself
-- only works if nvim shell is cmd.exe
vim.cmd("let $WINDOWID = win_getid()")
vim.cmd("let &shell = 'cmd.exe'")
vim.cmd("let R_path = 'C:\\Program Files\\R\\R-4.2.3\\bin\\x64'")
vim.cmd("let $PATH = 'C:\\rtools42\\usr\\bin;' . $PATH")

-- when R starts, set working directory to the one containing the open file
vim.cmd("let R_nvim_wd = 1")

-- when R starts, open the object browswer immediately
vim.cmd("let R_objbr_auto_start = 1")

-- python provider
vim.cmd("let g:python3_host_prog = 'C:\\Users\\amanj\\micromamba\\envs\\ag23\\python.exe'")
vim.cmd("let g:python_host_prog = 'C:\\Users\\amanj\\micromamba\\envs\\ag23\\python.exe'")

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

-- basic autocompletion inc snippets
require("plugin.nvim-cmp")
require("plugin.autopairs")

-- LSP 
require("plugin.lsp.mason")
require("plugin.lsp.lspconfig")


