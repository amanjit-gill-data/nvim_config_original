-- safely import
local ts_setup, ts_configs = pcall(require, "nvim-treesitter.configs")
if not ts_setup then
  return
end

ts_configs.setup {

  ensure_installed = {"python", "r", "markdown", "latex", "lua"},
  sync_install = false,
  auto_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
}

