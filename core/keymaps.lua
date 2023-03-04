-- KEYMAPS CONFIG --

-- set leading character for custom keymaps to '\'
vim.g.mapleader = "\\"

local km = vim.keymap

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


