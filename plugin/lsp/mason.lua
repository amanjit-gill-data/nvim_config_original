-- safely import mason 
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- safely import mason-lspconfig 
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

mason.setup()

-- do conda install pyright first
-- chose pyright over pylsp because it autocompletes from installed packages, 
-- like sklearn, out of the box 
-- (pylsp only autocompletes from standard python library out of the box)

mason_lspconfig.setup({
  ensure_installed = {
    "pyright",
    "r_language_server"
  },
})

