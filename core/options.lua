-- VIM OPTIONS -- 

local opt = vim.opt

-- turn off nvim intro
opt.shortmess = "I"

-- line numbering

opt.number = true
opt.relativenumber = true

-- tabs and indents

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.cindent = true

-- python indentation
vim.g.python_indent = {}
vim.g.python_indent.open_parem = 'vim.fn.shiftwidth() * 2'
vim.g.python_indent.nested_param = 2
vim.g.python_indent.continue = vim.fn.shiftwidth() * 2
vim.g.python_indent.closed_paren_align_last_line = true

-- line wrap
opt.wrap = false

-- search case
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- cursor shape and blinking
opt.guicursor = "i:blinkwait100-blinkon500-blinkoff500,i:ver20"

-- 80-character indicator
opt.colorcolumn = "80"

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- force nvim to use system clipboard
opt.clipboard:append("unnamedplus")

-- where to put split windows
opt.splitright = true
opt.splitbelow = true

-- treat hyphenated words as one word
opt.iskeyword:append("-")









