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

-- keymappings for diagnostics
-- see `:help vim.diagnostic.*` 
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- diagnostic signs in gutter
local err_types = { "Error", "Warn", "Hint", "Info" }

-- make all the gutter signs a coloured dot
for key, val in pairs(err_types) do
  local sign_hl = "DiagnosticSign" .. val
  vim.fn.sign_define(sign_hl, {text = "•", texthl = sign_hl})
end

-- disable underlining of linted lines
vim.diagnostic.config({
  underline = false
})

local add_keymaps = function(bufnr)
  -- enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- turn off diagnostics; too slow with sklearn etc; only enable completions 
lspconfig["pyright"].setup({
  handlers = {
    ["textDocument/publishDiagnostics"] = function() end,
  },
  on_attach = function(client, bufnr)
    add_keymaps(bufnr)
    client.server_capabilities.codeActionProvider = false
  end,
  settings = {
    python = {
      -- setting pythonPath didn't work 
      venvPath = "C:/Users/amanj/miniconda3/envs/dmml",
      analysis = {
        -- stubPath must point to folders named for pkgs, containing .pyi stubs
        stubPath = "G:/My Drive/Data Science/Resources/Python/python-type-stubs/stubs",
        -- library code causes delay in completions appearing, so turn it off
        useLibraryCodeForTypes = false,
        typeCheckingMode = "off",
        analyzeUnannotatedFunctions = false,
      }
    }
  }
})

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    add_keymaps(bufnr)
  end
})

lspconfig["texlab"].setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    add_keymaps(bufnr)
  end,
  settings = {
    texlab = {
      build = {
        onSave = true
      },
      chktex = {
        onEdit = false
      }
    }
  }
})

lspconfig["ruff_lsp"].setup({
  capabilities = capabilities,
  on_attach = function (client, bufnr)
    add_keymaps(bufnr)
  end,
})

-- doesn't install from Mason; used conda install 
-- lspconfig["pylyzer"].setup({
--   capabilities = capabilities,
--   on_attach = function (client, bufnr)
--     add_keymaps(bufnr)
--   end,
--   settings = {
--     pylyzer = {
--       diagnostics = false,
--     }
--   }
-- })

