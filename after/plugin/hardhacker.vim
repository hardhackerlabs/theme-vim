function! s:AfterHighlight()
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
          \ 'border':  ['fg', 'HardHackerBorder'],
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
        hi! link GitSignsAddLn    GitSignsAdd
        hi! link GitSignsAddNr    GitSignsAdd
        hi! link GitSignsChange   DiffChange
        hi! link GitSignsChangeLn GitSignsChange
        hi! link GitSignsChangeNr GitSignsChange
        hi! link GitSignsDelete   DiffDelete
        hi! link GitSignsDeleteLn GitSignsDelete
        hi! link GitSignsDeleteNr GitSignsDelete
    endif

    " bufferline
    if has('nvim') && luaeval("pcall(require, 'bufferline')")
        hi! link BufferLineFill                 TabLineFill
        hi! link BufferLineOffsetSeparator      VertSplit
    endif

    " telescope
    if has('nvim') && exists("g:loaded_telescope")
        hi! link TelescopeTitle     Title
        hi! link TelescopeBorder    HardHackerBorder
    endif

    " neo-tree
    if has('nvim') && exists("g:loaded_neo_tree")
        hi! link NeoTreeGitAdded        HardHackerGreen
        hi! link NeoTreeGitDeleted      HardHackerRed
        hi! link NeoTreeGitModified     HardHackerYellow
        hi! link NeoTreeGitConflict     HardHackerPurple
        hi! link NeoTreeGitUntracked    HardHackerCyan
        hi! link NeoTreeFileName        HardHackerBlue2
        hi! link NeoTreeRootName        NeoTreeDirectoryName
        hi! link NeoTreeFloatTitle      Title

        hi! link NeoTreeNormal          HardHackerComment
        hi! link NeoTreeNormalNC        HardHackerComment
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
    if has('nvim') && exists("g:loaded_cmp")
        hi! link CmpItemKindDefault         Type
        hi! link CmpItemAbbrMatchDefault    HardHackerPurple
    endif

    if has('nvim') && luaeval("pcall(require, 'aerial')")
        hi! link AerialLine  HardHackerRed
        hi! link NONE        HardHackerBlue2
    endif

    if has('nvim') && luaeval("pcall(require, 'noice')")
        hi! link NoicePopupBorder        FloatBorder
        hi! link NoiceCmdlinePopupBorder FloatBorder
        hi! link NoiceConfirmBorder      FloatBorder
    endif

    if has('nvim') && luaeval("pcall(require, 'toggleterm')")
        hi! link ToggleTerm1EndOfBuffer  EndOfBuffer
        hi! link ToggleTerm1SignColumn   EndOfBuffer
    endif

    if has('nvim') && luaeval("pcall(require, 'null-ls')")
        hi! link NullLsInfoBorder   FloatBorder
        hi! link NullLsInfoHeader   Type
        hi! link NullLsInfoTitle    Title
        hi! link NullLsInfoSources  Label
    endif
endfunction

command! HardHackerAfterHighlight call s:AfterHighlight()
call s:AfterHighlight()

" Execute all custom highlights
if exists('g:hardhacker_custom_highlights')
    for item in g:hardhacker_custom_highlights
      execute item
    endfor
endif
