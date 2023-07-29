-- settings for Nvim-R

-- only works if I set window ID myself
-- only works if nvim shell is cmd.exe
vim.cmd("let $WINDOWID = win_getid()")
vim.cmd("let &shell = 'cmd.exe'")
vim.cmd("let R_path = 'C:\\Program Files\\R\\R-4.3.0\\bin\\x64'")
vim.cmd("let $PATH = 'C:\\rtools43\\usr\\bin;' . $PATH")

-- when R starts, set working directory to the one containing the open file
vim.cmd("let R_nvim_wd = 1")

-- when R starts, open the object browswer immediately
vim.cmd("let R_objbr_auto_start = 1")
