-- KEYMAPS CONFIG --

-- set leading character for custom keymaps to '\'
vim.g.mapleader = "\\"

local km = vim.keymap

-- move directly up/down even when word wrap is on 
km.set("n", "j", "gj")
km.set("n", "k", "gk")
km.set("n", "<Down>", "gj")
km.set("n", "<Up>", "gk")
km.set("n", "gj", "j")
km.set("n", "gj", "k")

-- delete single character without saving it to clipboard
km.set("n", "x", '"_x')

-- turn off search highlighting
km.set("n", "<leader>nh", ":nohl<CR>")

-- easier keymaps for window splits
km.set("n", "<leader>sv", "<C-w>v") -- split window vertically
km.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
km.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
km.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- easier keymaps for tabs
km.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
km.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
km.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
km.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- KEYMAPS FOR PLUGINS --

-- vim maximizer
km.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
km.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- MOVE BETWEEN START/END OF LINE 
-- 1 keypress moves to end
-- 1 to 2 keypresses moves to start

function LineStartEnd()
  r, c = unpack(vim.api.nvim_win_get_cursor(0))
  line_length = vim.fn.col('$') - 1

  if c+1 ~= line_length then
    vim.api.nvim_win_set_cursor(0, {r, line_length})
  else 
    vim.api.nvim_win_set_cursor(0, {r, 0})
  end 
end

km.set("n", "0", ":lua LineStartEnd()<CR>") 




