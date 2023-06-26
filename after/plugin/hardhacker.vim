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
        hi! link GitGutterAdd    HardHackerGreen
        hi! link GitGutterChange HardHackerYellow
        hi! link GitGutterDelete HardHackerRed
    endif
    if has('nvim') && luaeval("pcall(require, 'gitsigns')")
        " gitsigns.nvim requires nvim > 0.5
        hi! link GitSignsAdd      HardHackerGreen
        hi! link GitSignsAddLn    GitSignsAdd
        hi! link GitSignsAddNr    GitSignsAdd
        hi! link GitSignsChange   HardHackerYellow
        hi! link GitSignsChangeLn GitSignsChange
        hi! link GitSignsChangeNr GitSignsChange
        hi! link GitSignsDelete   HardHackerRed
        hi! link GitSignsDeleteLn GitSignsDelete
        hi! link GitSignsDeleteNr GitSignsDelete
    endif

    " bufferline
    if has('nvim') && luaeval("pcall(require, 'bufferline')")
        hi! link BufferLineFill                 TabLineFill
        hi! link BufferLineOffsetSeparator      VertSplit
    endif

    " telescope
    if has('nvim') && exists('g:loaded_telescope')
        hi! link TelescopeTitle     Title
        hi! link TelescopeBorder    HardHackerBorder
    endif

    " neo-tree
    if has('nvim') && exists('g:loaded_neo_tree')
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
    if has('nvim') && exists('g:loaded_cmp')
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

    " tree-sitter highlights
    if has('nvim')
        " Misc
        hi! link @operator Operator

        " Punctuation
        hi! link @punctuation.delimiter         Delimiter
        hi! link @punctuation.bracket           Delimiter
        hi! link @punctuation.special           Special
        hi! link @punctuation.special.markdown  HardHackerGreen

        " Literals
        hi! link @string.documentation  HardHackerYellow
        hi! link @string.regex          HardHackerBlue
        hi! link @string.escape         HardHackerGreen

        " Functions
        hi! link @constructor       Function
        hi! link @parameter         HardHackerYellow
        hi! link @function.builtin  Function

        " Keywords
        hi! link @keyword           Keyword
        hi! link @keyword.function  Keyword
        hi! link @label             Label

        " Types
        hi! link @type.builtin  Type
        hi! link @field         Identifier
        hi! link @property      Identifier

        " Identifiers
        hi! link @variable          Identifier
        hi! link @variable.builtin  HardHackerBlue    " link 'this' or 'self'

        " Text
        hi! link @text.literal.markdown_inline   HardHackerBlue
        hi! link @text.reference                 HardHackerYellow

        hi! link @text.todo.unchecked           HardHackerBlue
        hi! link @text.todo.checked             HardHackerGreen
        hi! link @text.warning                  HardHackerYellow
        hi! link @text.danger                   HardHackerRed

        hi! link @text.diff.add                 DiffAdd
        hi! link @text.diff.delete              DiffDelete

        hi! link @namespace                     Include

        " tsx
        hi! link @tag.tsx           HardHackerRed
        hi! link @constructor.tsx   HardHackerBlue
        hi! link @tag.delimiter.tsx HardHackerBlue

        " LSP Semantic Token Groups
        hi! link @lsp.type.boolean                      @boolean
        hi! link @lsp.type.builtinType                  @type.builtin
        hi! link @lsp.type.comment                      @comment
        hi! link @lsp.type.enum                         @type
        hi! link @lsp.type.enumMember                   @constant
        hi! link @lsp.type.escapeSequence               @string.escape
        hi! link @lsp.type.formatSpecifier              @punctuation.special
        hi! link @lsp.type.interface                    Type
        hi! link @lsp.type.keyword                      @keyword
        hi! link @lsp.type.namespace                    @namespace
        hi! link @lsp.type.number                       @number
        hi! link @lsp.type.operator                     @operator
        hi! link @lsp.type.parameter                    @parameter
        hi! link @lsp.type.property                     @property
        hi! link @lsp.type.selfKeyword                  @variable.builtin
        hi! link @lsp.type.string.rust                  @string
        hi! link @lsp.type.typeAlias                    @type.definition
        hi! link @lsp.type.unresolvedReference          Error
        hi! link @lsp.typemod.class.defaultLibrary      @type.builtin
        hi! link @lsp.typemod.enum.defaultLibrary       @type.builtin
        hi! link @lsp.typemod.enumMember.defaultLibrary @constant.builtin
        hi! link @lsp.typemod.function.defaultLibrary   @function.builtin
        hi! link @lsp.typemod.keyword.async             @keyword.coroutine
        hi! link @lsp.typemod.macro.defaultLibrary      @function.builtin
        hi! link @lsp.typemod.method.defaultLibrary     @function.builtin
        hi! link @lsp.typemod.operator.injected         @operator
        hi! link @lsp.typemod.string.injected           @string
        hi! link @lsp.typemod.type.defaultLibrary       HardHackerGreen
        hi! link @lsp.typemod.variable.defaultLibrary   @variable.builtin
        hi! link @lsp.typemod.variable.injected         @variable
    endif

    " Execute all custom highlights
    if exists('g:hardhacker_custom_highlights')
        for item in g:hardhacker_custom_highlights
          execute item
        endfor
    endif
endfunction

command! HardHackerAfterHighlight call s:AfterHighlight()
call s:AfterHighlight()
