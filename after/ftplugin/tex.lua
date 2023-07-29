-- TEX-SPECIFIC SETTINGS --

local opt = vim.opt
local km = vim.keymap

vim.cmd('let g:tex_flavor="latex"')

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

opt.wrap = true
opt.colorcolumn = ""
vim.cmd('set linebreak')

vim.cmd("command TB TexlabBuild")
