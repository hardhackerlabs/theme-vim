" fzf
if exists('g:loaded_fzf') && ! exists('g:fzf_colors')
    let g:fzf_colors = {
      \ 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Search'],
      \ 'fg+':     ['fg', 'Normal'],
      \ 'bg+':     ['bg', 'Normal'],
      \ 'hl+':     ['fg', 'HardHackerRed'],
      \ 'info':    ['fg', 'HardHackerPurple'],
      \ 'border':  ['fg', 'HardHackerPurple'],
      \ 'prompt':  ['fg', 'HardHackerGreen'],
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
if has('nvim') && luaeval("pcall(require, 'gitsigns')")
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

" bufferline
if has('nvim') && luaeval("pcall(require, 'bufferline')")
    hi! link BufferLineFill             HardHackerFillDarker
    hi! link BufferLineOffsetSeparator  HardHackerComment
    " hi! link BufferLineGroupSeparator   HardHackerFillDarker
    " hi! link BufferLineSeparator        HardHackerFillDarker
    " hi! link BufferLineTabSeparator     HardHackerFillDarker
    " hi! link BufferLineTabSeparatorSelected HardHackerFillDarker
    " hi! link BufferLineSeparatorSelected    HardHackerFillDarker
    " hi! link BufferLineSeparatorVisible     HardHackerFillDarker
endif

" telescope
if has('nvim') && luaeval("pcall(require, 'telescope')")
    hi! link TelescopeTitle     Title
    hi! link TelescopeBorder    HardHackerComment
endif

" neo-tree
if has('nvim') && luaeval("pcall(require, 'neo-tree')")
    hi! link NeoTreeGitAdded        HardHackerGreen
    hi! link NeoTreeGitDeleted      HardHackerRed
    hi! link NeoTreeGitModified     HardHackerYellow
    hi! link NeoTreeGitConflict     HardHackerPurple
    hi! link NeoTreeGitUntracked    HardHackerCyan
endif

" dashboard-nvim
if has('nvim') && luaeval("pcall(require, 'dashboard')")
    hi! link DashboardHeader    HardHackerRed
    hi! link DashboardFooter    HardHackerComment
    " DashboardProjectTitle
    " DashboardProjectTitleIcon
    hi! link DashboardMruTitle  Title
    " DashboardFiles
    " DashboardShortCut
endif

" nvim-cmp
if has('nvim') && luaeval("pcall(require, 'cmp')")
    hi! link CmpItemKindDefault         Type
    hi! link CmpItemAbbrMatchDefault    HardHackerPurple
endif
