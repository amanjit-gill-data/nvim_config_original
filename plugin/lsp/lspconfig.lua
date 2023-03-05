-- safely import 
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

-- safely import 
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

lspconfig["pylsp"].setup{(
  capabilities = cmp_nvim_lsp.default_capabilities(),
  on_attach = function(client, bufnr)
})




