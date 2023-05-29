local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

-- demark new cell
vim.keymap.set("n", "nc", "i# %% ")

vim.cmd("hi semshiImported ctermfg=214 guifg=#5fafff")
vim.cmd("hi semshiSelected ctermfg=231 guifg=#ffffff ctermbg=017 guibg=#00005f")
vim.cmd("hi semshiBuiltin ctermfg=069 guifg=#5f87ff")
vim.cmd("hi semshiGlobal ctermfg=159 guifg=#afffff")
vim.cmd("let g:semshi#excluded_hl_groups=['local', 'unresolved']")

