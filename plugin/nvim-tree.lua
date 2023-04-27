local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
  return
end

-- nvim-tree documentation apparently recommends these settings
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- change the colour of the folder navigation arrows so it's not a faint grey
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])


-- nvimtree.setup() on its own enables the tree
-- the extra settings inside set nicer glyphs for the folder navigation arrows
-- these nicer glyphs are only available if a nerd font is used in the terminal
nvimtree.setup({
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "→", -- when folder is closed
          arrow_open = "↓"    -- when folder is open
        },
        git = {
          unstaged = "•",
          untracked = "u",
          staged = "•",
          ignored = "┅"
        }
      },
    },
  },
  git = {
    ignore = false,
    show_on_open_dirs = false
  },
  -- apparently disabling the window picker makes nvim-tree work correctly with split windows etc
  actions = {
    open_file = {
      window_picker = {
        enable = false
      },
    },
  },
})

