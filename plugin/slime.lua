-- set keymaps to send cells, paragraphs and lines
-- set keymap to exit ipython and close terminal window
-- IMPORTANT: must set ipython autoindent to false

vim.g.slime_target = 'neovim'
vim.g.slime_dont_ask_default = 1
vim.g.slime_bracketed_paste = 1
vim.g.slime_cell_delimiter = '# %%'

vim.keymap.set("n", "<Leader>op", ":lua IPythonOpen()<CR>")

function IPythonSendCell()
  vim.cmd("call slime#send_cell()")
  vim.cmd('SlimeSend0 ""')
end

-- select and yank current paragraph, then send to ipython
function IPythonSendParagraph() 
  vim.cmd("normal! vipy")
  vim.cmd("let b:selected = getreg('\"0')")
  vim.cmd("SlimeSend0 b:selected")
  vim.cmd('SlimeSend0 ""')
end

function IPythonSendLine()
  vim.cmd("SlimeSendCurrentLine")
  vim.cmd('SlimeSend0 ""')
end

-- end python process then close all windows except for python file
function IPythonExit()
  vim.cmd("SlimeSend0 'exit()'")
  vim.cmd('SlimeSend0 ""')
  vim.cmd("only")
end

-- this code is based on https://github.com/hanschen/vim-ipython-cell/wiki
function IPythonOpen()

  -- open new terminal and start ipython; name the new window ipython
  vim.cmd("vnew | call termopen('ipython')")

  -- set job id, so slime knows where to send python code
  vim.g.slime_default_config = {
    jobid = vim.b.terminal_job_id
  }

  -- move cursor to bottom; it will stay there, ensuring latest output is 
  -- always visible
  vim.cmd("normal! G")

  -- return focus to previous window i.e. python script
  vim.cmd("wincmd p | vertical resize 95")

  vim.keymap.set("n", "<C-c><C-c>", ":lua IPythonSendCell()<CR>") -- send cell
  vim.keymap.set("n", "<C-c><C-p>", ":lua IPythonSendParagraph()<CR>") -- send paragraph
  vim.keymap.set("n", "<C-c><C-l>", ":lua IPythonSendLine()<CR>") -- send current line
  vim.keymap.set("n", "<C-c><C-n>", ':SlimeSend0 ""<CR>') -- send newline

  vim.keymap.set("n", "<leader>cp", ":lua IPythonExit()<CR>")
end





