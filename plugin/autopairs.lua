-- safely import autopairs
local autopairs_setup, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_setup then
  return
end

-- safely import autopairs code that works with autocompleted text
local cmp_autopairs_setup, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not cmp_autopairs_setup then
  return
end

-- import cmp so it can be linked to autopairs
local cmp_setup, cmp = pcall(require, "cmp")
if not cmp_setup then
  return
end

-- link cmp to autopairs
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

autopairs.setup({
})
