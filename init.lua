local config_path = os.getenv("XDG_CONFIG_HOME") .. "\\nvim\\?.lua;"

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

-- LSP not configured yet
-- require("plugin.lsp.mason")


