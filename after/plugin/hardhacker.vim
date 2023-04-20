" fzf
if exists('g:loaded_fzf') && ! exists('g:fzf_colors')
    let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Search'],
      \ 'fg+':     ['fg', 'Normal'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'hl+':     ['fg', 'HardHacker_Red'],
      \ 'info':    ['fg', 'HardHacker_Purple'],
      \ 'border':  ['fg', 'HardHacker_Purple'],
      \ 'prompt':  ['fg', 'HardHacker_Green'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'],
      \}
  endif

" gitgutter gitsigns
if exists('g:loaded_gitgutter')
    hi! link GitGutterAdd    DiffAdd
    hi! link GitGutterChange DiffChange
    hi! link GitGutterDelete DiffDelete
endif
if has('nvim-0.5') && luaeval("pcall(require, 'gitsigns')")
    " gitsigns.nvim requires nvim > 0.5
    hi! link GitSignsAdd      DiffAdd
    hi! link GitSignsAddLn    DiffAdd
    hi! link GitSignsAddNr    DiffAdd
    hi! link GitSignsChange   DiffChange
    hi! link GitSignsChangeLn DiffChange
    hi! link GitSignsChangeNr DiffChange
    hi! link GitSignsDelete   DiffDelete
    hi! link GitSignsDeleteLn DiffDelete
    hi! link GitSignsDeleteNr DiffDelete
endif
