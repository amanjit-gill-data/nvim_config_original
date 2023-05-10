local g = vim.g
local opt = vim.opt
-- indentation

opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.autoindent = true
opt.smartindent = true

g.python_indent = {}
g.python_indent.open_parem = vim.fn.shiftwidth() * 2
g.python_indent.nested_param = 2
g.python_indent.continue = vim.fn.shiftwidth() * 2
g.python_indent.closed_paren_align_last_line = true

-- demark new cell
vim.keymap.set("n", "nc", "i# %% ") 
