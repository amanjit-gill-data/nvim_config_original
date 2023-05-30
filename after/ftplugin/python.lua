local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

-- demark new cell
vim.keymap.set("n", "nc", "i# %% ")

-- customise semshi python highlighting
-- must be here to ensure this happens after semshi has initialised
vim.cmd("let g:semshi#excluded_hl_groups=['local', 'unresolved', 'parameterUnused']")
vim.cmd("hi semshiImported ctermfg=081 guifg=#5fd7ff")
vim.cmd("hi semshiSelected ctermfg=231 guifg=#ffffff ctermbg=023 guibg=#005f5f")
vim.cmd("hi semshiBuiltin ctermfg=026 guifg=#005fd7")
vim.cmd("hi semshiGlobal ctermfg=207 guifg=#ff5fff gui=bold")
vim.cmd("hi semshiAttribute ctermfg=078 guifg=#5fd787")
vim.cmd("hi pythonMethod ctermfg=078 guifg=#5fd787")
vim.cmd("hi pythonString ctermfg=222 guifg=#ffdf87")
vim.cmd("hi Normal ctermfg=254 guifg=#e4e4e4")
vim.cmd("hi Function ctermfg=211 guifg=#ff87af gui=bold")

-- prevent semshi from overriding the gutter errors I've already set up
vim.cmd("let g:semshi#error_sign=v:false")

-- semshi doesn't highlight methods and strings
-- define patterns to allow my own highlighting
-- do this on BufEnter (i.e. well after semshi initialised) to prevent override
vim.cmd([[
  augroup enable_highlight_method
    autocmd!
    autocmd BufEnter *.py syn match pythonMethod "\.\h\+\ze(" | syn match pythonString "\".\+\""
  augroup end
]])

