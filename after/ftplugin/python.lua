-- PYTHON-SPECIFIC SETTINGS --

local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

-- demark new cell for iPython
vim.keymap.set("n", "nc", "i# %% ")

-- turn on highlighting by python-syntax plugin
vim.cmd("let g:python_highlight_all=1")

-- CUSTOM HIGHLIGHTS --
-- highlight grps prefixed by 'python' are defined by the python-syntax plugin

vim.cmd("hi Comment ctermfg=066 guifg=#5f8787")
vim.cmd("hi Normal ctermfg=254 guifg=#e4e4e4")
vim.cmd("hi link pythonBoolean Constant")
vim.cmd("hi pythonString guifg=#e3d18a")

-- Function calls - builtin 
vim.cmd("hi pythonBuiltinFunc guifg=#21c7a8")
vim.cmd("hi pythonBuiltinType guifg=#82aaff")

-- Function calls - imported and defined 
vim.cmd("hi pythonFunctionCall guifg=#5fd7ff")

-- variables, functions and classes defined in global namespace
vim.cmd("hi pythonFunction ctermfg=207 guifg=#ff5fff gui=bold")
vim.cmd("hi pythonClass ctermfg=207 guifg=#ff5fff gui=bold")
vim.cmd("hi pythonClassVar guifg=#acb4c2")
vim.cmd("hi! pythonClassAttribute guifg=red")

-- Operator = in (e.g. for i in some_list)
-- made this match Statement (e.g. keywords like def)
vim.cmd("hi link Operator Statement")
vim.cmd("hi link pythonImport Statement")

vim.cmd("hi pythonSpaceError guibg=clear")


