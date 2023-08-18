local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- load optional nightfly theme for status line
local lualine_nightfly = require("lualine.themes.nightfly")

-- brighter colours suggested by josean
local new_colours = {
  blue = "#65D1FF",
  green = "#3EFFDC",
  violet = "#FF61EF",
  yellow = "#FFDA7B",
  black = "#000000"
}

-- set background colours for different nvim modes
lualine_nightfly.normal.a.bg = new_colours.blue
lualine_nightfly.insert.a.bg = new_colours.green
lualine_nightfly.visual.a.bg = new_colours.violet

-- the code for command mode is different because lualine doesn't have a 
-- setting for it, so we define it ourselves   
lualine_nightfly.command = {
  a = {
    gui = "bold",
    bg = new_colours.yellow,
    fg = new_colours.black
  }
}

lualine.setup({
  options = {
    theme = lualine_nightfly
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = {'diagnostics'},

    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'},
  }
})

