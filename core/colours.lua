local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
  print("Colour scheme not found")
  return
end

-- CURSORWORD -- 

-- give me more time to finish typing a word; milliseconds
vim.cmd("let g:cursorword_delay=800")

-- stop cursorword plugin from underlining words 
-- set custom highlight for cursorword
vim.cmd("hi clear CursorWord")
vim.cmd("hi CursorWord guifg=#ffffff guibg=#005f5f")

-- PYTHON-SYNTAX -- 

-- this can't be in after/ftplugin/python because it gets overridden 
vim.cmd([[
  augroup define_highlight_patterns
    autocmd!
    autocmd BufWinEnter *.py 
    \ syn match pythonClassAttribute "self\.\h*" | hi pythonSpaceError guibg=clear
  augroup end
]])


