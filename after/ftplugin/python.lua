-- PYTHON-SPECIFIC SETTINGS --

local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.autoindent = true

-- demark new cell for iPython
vim.keymap.set("n", "nc", "i# %% ")

