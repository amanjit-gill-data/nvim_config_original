-- automatically open ipython in built-in terminal

vim.cmd("delmarks!")

vim.g.slime_target = 'neovim'
vim.g.slime_dont_ask_default = 1
vim.g.slime_bracketed_paste = 1
vim.g.slime_cell_delimiter = '# %%'

vim.keymap.set("n", "<Leader>ip", ":lua IPythonOpen()<CR>")

function IPythonSendCell()
  vim.cmd("call slime#send_cell() | SlimeSend0 '\r'")
end

--[[
function IPythonSendParagraph()
  vim.cmd("normal! vipy")
  vim.fn.feedkeys(":let b:selected = getreg('\"0')\r", 't')
  vim.b.cmd_string = "SlimeSend0 \'" .. vim.b.selected .. "\'" 
  vim.cmd(vim.b.cmd_string)
end
--]]

function IPythonSendParagraph()
  vim.fn.feedkeys("normal! <C-c><C-c>")
  vim.cmd('SlimeSend0 "\r"')
end

-- this code is based on https://github.com/hanschen/vim-ipython-cell/wiki
function IPythonOpen()

  -- open new terminal and start ipython; name the new window ipython
  vim.cmd("vnew | call termopen('ipython')")
  name = python

  -- set job id, so slime knows where to send python code
  vim.g.slime_default_config = { jobid = vim.b.terminal_job_id }
 
  -- return focus to previous window i.e. python script
  vim.cmd("wincmd p")

  vim.keymap.set("n", "<C-s><C-p>", ":lua IPythonSendParagraph()<CR>") -- paragraph
  vim.keymap.set("n", "<C-s><C-c>", ":lua IPythonSendCell()<CR>") -- cell
end


