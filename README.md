# Amanjit's Original Neovim Configuration

This Neovim configuration supports development in Python and R, as well as document preparation in LaTEX.

It is written entirely in Lua. Some of it I obtained by converting Vimscript into Lua; I've never used either language before, and it probably shows.

That said, now that I have learned more, I've decided to rebuild my configuration from scratch. But I'll keep this one intact because I still feel a lot of affection for this first attempt, such as it is.

## Sources

I initially followed @josean-dev's [YouTube tutorial](https://www.youtube.com/watch?v=vdn_pKJUda8). Over time, I added plugins relevant to my work in Python and R; my configuration code for these plugins is adapted from their documentation and, in some cases, includes a considerable amount of customisation to suit my preferences.

## Notes

- If you're on Windows and you're struggling to get Nvim-R working, you might want to check out nvim-r.lua for the settings that worked for me after lots of troubleshooting.

- If you're on Windows and struggling to get Python REPL working inside Neovim, I've managed it with vim-slime (see slime.lua). It's _nearly_ perfect for my needs.

- If you're finding LSP completions and diagnostics too slow (or too incomplete) for Python's machine learning libraries, you might want to check out lspconfig.lua. I'm using Pyright for completions (using additional type stubs rather than library code) and Ruff for diagnostics. This works beautifully fast for small jobs, but completions slow down dramatically when very complex, untyped, libraries are traversed to resolve types. 

