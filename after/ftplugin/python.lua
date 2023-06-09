-- PYTHON-SPECIFIC SETTINGS --

local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

-- demark new cell
vim.keymap.set("n", "nc", "i# %% ")

-- SEMSHI OPTIONS --

-- don't highlight these groups 
vim.cmd("let g:semshi#excluded_hl_groups=['local', 'unresolved', 'parameterUnused']")

-- always update highlighting (don't try to avoid it)
vim.cmd("let g:semshi#always_update_all_highlights=v:true")

-- slightly delay updating highlighting
vim.cmd("let g:semshi#update_delay_factor=0.0001")

-- prevent semshi from overriding the gutter errors I've already set up
vim.cmd("let g:semshi#error_sign=v:false")

-- CUSTOM HIGHLIGHT GROUPS -- 

-- semshi doesn't highlight methods and strings
-- define patterns to highlight these
-- do this on BufEnter (i.e. well after semshi initialised) to prevent override
vim.cmd([[
  augroup define_highlight_patterns
    autocmd!
    autocmd BufEnter *.py 
    \ syn match pythonMethod "\.\h\+\ze(" 
    \ | syn match pythonString "\".\+\""
  augroup end
]])

-- SEMSHI CUSTOM COLORS --

vim.cmd("hi semshiImported ctermfg=081 guifg=#5fd7ff")
vim.cmd("hi semshiSelected ctermfg=231 guifg=#ffffff ctermbg=023 guibg=#005f5f") 
vim.cmd("hi pythonString ctermfg=222 guifg=#ffdf87")
vim.cmd("hi Comment ctermfg=066 guifg=#5f8787")
vim.cmd("hi Normal ctermfg=254 guifg=#e4e4e4")

-- Builtin = print, int, float, etc
vim.cmd("hi semshiBuiltin ctermfg=032 guifg=#0087d7")

-- variables, functions and classes defined in global namespace
vim.cmd("hi semshiGlobal ctermfg=207 guifg=#ff5fff gui=bold")

-- attributes called by dot notation
vim.cmd("hi semshiAttribute ctermfg=078 guifg=#5fd787")
vim.cmd("hi pythonMethod ctermfg=078 guifg=#5fd787")

-- parameters in function definitions
vim.cmd("hi semshiParameter ctermfg=068 guifg=#5f87d7")

-- functions defined inside classes  
vim.cmd("hi Function ctermfg=211 guifg=#ff87af gui=bold")

-- Operator = in (e.g. for i in some_list)
-- made this match Statement (e.g. keywords like def)
vim.cmd("hi Operator guifg=#c792ea")


