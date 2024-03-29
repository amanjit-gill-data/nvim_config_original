-- safely require nvim-cmp
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

-- safely require LuaSnip
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  return
end

-- load vscode-like snippets from plugins (such as friendly-snippets)
require("luasnip/loaders/from_vscode").lazy_load({
  dependencies = {
    "rafamadriz/friendly-snippets"
  }
})

vim.opt.completeopt = "menu,menuone,noselect"

vim.cmd("let R_set_omnifunc = ['r', 'Rmd', 'quarto']")
vim.cmd("let Rout_more_colors = 1")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  -- keymapping
  mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }),
  }),
  -- sources for autocompletion
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- autocompletions from language server(s)
    { name = "cmp_nvim_r"}, -- autocompletion for R
    -- { name = "luasnip" }, -- snippets
    { name = "buffer" }, -- text within current buffer
    { name = "path" , option = { trailing_slash = true }}, -- file system paths
  })
})

