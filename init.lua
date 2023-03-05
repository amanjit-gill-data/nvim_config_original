local config_path = os.getenv("XDG_CONFIG_HOME") .. "\\nvim\\?.lua;"
vim.cmd("let $R_DEFAULT_PACKAGES = 'utils, grDevices, graphics, stats, methods, nvimcom'")
vim.cmd("let R_path = 'C:\\rtools42\\usr\\bin;C:\\Program Files\\R\\R-4.2.2\\bin\\x64'")
vim.cmd("let $PATH = 'C:\\rtools42\\mingw64\\bin;C:\\rtools42\\usr\\bin;' . $PATH")

-- otherwise R immediately exits with error 127 (but editor still works)
-- only valid value in Windows is 1
vim.cmd("let R_external_term = 1")

vim.cmd("let R_cmd = 'Rterm'")

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


