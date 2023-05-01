local status, gitsigns = pcall(require, "gitsigns")
if not status then
  return
end

gitsigns.setup {
  signcolumn = true,
  signs = {
    delete = {
      text = "|"
    },
    untracked = {
      text = "┇"
    }
  }
}


