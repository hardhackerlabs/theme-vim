" Hard hacker theme for Vim
"
scriptencoding utf8
highlight clear
if exists('syntax_on')
  syntax reset
endif

set background=dark
let g:colors_name = 'hardhacker'

if !has('gui_running') && &t_Co != 256 && !(has('termguicolors') && &termguicolors)
  finish
endif

" Global variable
"
if !exists('g:hardhacker_darker')
    let g:hardhacker_darker = 0
endif
if !exists('g:hardhacker_hide_tilde')
    let g:hardhacker_hide_tilde = 1
endif
if !exists('g:hardhacker_keyword_italic')
    let g:hardhacker_keyword_italic = 1
endif

" Utils
"
function! s:blend_colors(foreground_color, background_color, opacity)
    let tr = '0x' . strpart(a:foreground_color, 1, 2)
    let tg = '0x' . strpart(a:foreground_color, 3, 2)
    let tb = '0x' . strpart(a:foreground_color, 5, 2)

    let br = '0x' . strpart(a:background_color, 1, 2)
    let bg = '0x' . strpart(a:background_color, 3, 2)
    let bb = '0x' . strpart(a:background_color, 5, 2)

    let r = (tr * a:opacity + br * (100 - a:opacity)) / 100
    let g = (tg * a:opacity + bg * (100 - a:opacity)) / 100
    let b = (tb * a:opacity + bb * (100 - a:opacity)) / 100

    let blended_color = printf('#%02X%02X%02X', r, g, b)

    return blended_color
endfunction

" Palette
"

let s:black         = '#19181f'
let s:bg_darker     = '#211e2a'
let s:bg_dark       = '#282433'
let s:bg            = s:bg_dark
let s:fg            = '#eee9fc'
let s:selection     = '#3f3951'
let s:comment       = '#938AAD'
let s:red           = '#e965a5'
let s:green         = '#b1f2a7'
let s:yellow        = '#ebde76'
let s:blue          = '#b1baf4'
let s:purple        = '#e192ef'
let s:cyan          = '#b3f4f3'

let s:term_bg_darker    = '234'
let s:term_bg_dark      = '235'
let s:term_bg           = s:term_bg_dark
let s:term_fg           = '255'
let s:term_selection    = '238'
let s:term_comment      = '243'
let s:term_red          = '205' "212
let s:term_green        = '157'
let s:term_yellow       = '227'
let s:term_blue         = '153'
let s:term_purple       = '219'
let s:term_cyan         = '123'
let s:term_black        = '16'

let s:none          = 'NONE'

" preprocess
if g:hardhacker_darker == 1
    let s:bg = s:bg_darker
    let s:term_bg = s:term_bg_darker
endif

" for terminal
let g:hardhacker#palette = {}
let g:hardhacker#palette.color_0  = s:bg_dark
let g:hardhacker#palette.color_1  = s:red
let g:hardhacker#palette.color_2  = s:green
let g:hardhacker#palette.color_3  = s:yellow
let g:hardhacker#palette.color_4  = s:blue
let g:hardhacker#palette.color_5  = s:purple
let g:hardhacker#palette.color_6  = s:cyan
let g:hardhacker#palette.color_7  = s:fg
let g:hardhacker#palette.color_8  = '#655980'
let g:hardhacker#palette.color_9  = s:red
let g:hardhacker#palette.color_10 = s:green
let g:hardhacker#palette.color_11 = s:yellow
let g:hardhacker#palette.color_12 = s:blue
let g:hardhacker#palette.color_13 = s:purple
let g:hardhacker#palette.color_14 = s:cyan
let g:hardhacker#palette.color_15 = s:fg

if has('nvim')
  for s:i in range(16)
    let g:terminal_color_{s:i} = g:hardhacker#palette['color_' . s:i]
  endfor
endif
if has('terminal')
  let g:terminal_ansi_colors = []
  for s:i in range(16)
    call add(g:terminal_ansi_colors, g:hardhacker#palette['color_' . s:i])
  endfor
endif

function s:hi_group(group, termfg, termbg, guifg, guibg, list)
    let l:attr = 'NONE'
    if has('nvim')
        let l:attr = join(a:list, ',')
    endif
    let l:hl_fields = [
        \ 'hi',
        \ a:group,
        \ 'ctermfg=' . a:termfg,
        \ 'ctermbg=' . a:termbg,
        \ 'cterm=' . l:attr,
        \ 'guifg=' . a:guifg,
        \ 'guibg=' . a:guibg,
        \ 'gui=' . l:attr
        \]
    execute join(l:hl_fields, ' ')
endfunction

function s:hi_group_without_attr(group, termfg, termbg, guifg, guibg)
    let l:list = ['NONE']
    call s:hi_group(a:group, a:termfg, a:termbg, a:guifg, a:guibg, l:list)
endfunction

" Set environment highlight
"
call s:hi_group_without_attr('Cursor', s:term_fg, s:term_red, s:fg, s:red)
call s:hi_group_without_attr('CursorLine', s:none, s:term_selection, s:none, s:selection)
call s:hi_group_without_attr('CursorLineNr', s:term_purple, s:term_bg, s:purple, s:bg)
call s:hi_group_without_attr('CursorColumn', s:none, s:term_bg,  s:none, s:bg)
call s:hi_group_without_attr('ColorColumn', s:none, s:term_bg,  s:none, s:bg)

call s:hi_group_without_attr('StatusLine', s:term_fg, s:term_selection, s:fg, s:selection)
call s:hi_group_without_attr('StatusLineNC', s:term_fg, s:term_bg, s:fg, s:bg)
call s:hi_group_without_attr('StatusLineTerm', s:none, s:term_bg, s:none, s:bg)
call s:hi_group_without_attr('StatusLineTermNC', s:none, s:term_bg, s:none, s:bg)
call s:hi_group_without_attr('WildMenu', s:none, s:term_purple, s:none, s:purple)

call s:hi_group_without_attr('Pmenu', s:term_fg, s:term_bg, s:fg, s:bg)
call s:hi_group_without_attr('PmenuSel', s:none, s:term_selection, s:none, s:selection)
call s:hi_group_without_attr('PmenuSbar', s:term_black, s:term_purple, s:black, s:purple)
call s:hi_group_without_attr('PmenuThumb', s:term_black, s:term_purple, s:black, s:purple)
call s:hi_group_without_attr('PmenuKind', s:term_cyan, s:term_bg, s:cyan, s:bg)
call s:hi_group_without_attr('PmenuKind', s:term_purple, s:term_bg, s:purple, s:bg)
call s:hi_group_without_attr('PmenuExtra', s:term_fg, s:term_bg, s:fg, s:bg)
call s:hi_group_without_attr('PmenuExtraSel', s:term_fg, s:term_purple, s:fg, s:purple)

call s:hi_group_without_attr('Folded', s:term_fg, s:term_bg, s:fg, s:bg)
call s:hi_group_without_attr('Normal', s:term_fg, s:term_bg, s:fg, s:bg)
call s:hi_group_without_attr('LineNr', s:term_comment, s:term_bg, s:comment, s:bg)
call s:hi_group_without_attr('Visual',  s:none, s:term_selection, s:none, s:selection)
call s:hi_group_without_attr('VisualNOS',  s:none, s:term_selection, s:none, s:selection)
call s:hi_group_without_attr('IncSearch', s:term_bg, s:term_yellow, s:bg, s:yellow)
call s:hi_group_without_attr('VertSplit', s:term_black, s:term_bg, s:black, s:bg)

call s:hi_group('Directory', s:term_blue, s:none, s:blue, s:none, ['bold'])
call s:hi_group('Search', s:term_bg, s:term_yellow, s:bg, s:yellow, ['underline'])
call s:hi_group('MatchParen', s:term_yellow, 'NONE', s:yellow, 'NONE', ['underline'])

if g:hardhacker_hide_tilde == 1
    call s:hi_group_without_attr('EndOfBuffer', s:term_bg, s:term_bg, s:bg, s:bg) 
else 
    call s:hi_group_without_attr('EndOfBuffer', s:term_comment, s:term_bg, s:comment, s:bg) 
endif


" Set text highlight
"
function s:hi_fg_group(group, ctermfg, guifg, ...)
    if a:0 == 0
        call s:hi_group_without_attr(a:group, a:ctermfg, s:none, a:guifg, s:none)
    else 
        let l:list = a:000
        call s:hi_group(a:group, a:ctermfg, s:none, a:guifg, s:none, l:list)
    endif
endfunction

function s:hi_bg_group(group, ctermbg, guibg)
    call s:hi_group_without_attr(a:group, s:none, a:ctermbg, s:none, a:guibg)
endfunction

" foreground color
call s:hi_fg_group('HardHackerRed', s:term_red, s:red)
call s:hi_fg_group('HardHackerPurple', s:term_purple, s:purple)
call s:hi_fg_group('HardHackerBlue', s:term_blue,s:blue)
call s:hi_fg_group('HardHackerYellow', s:term_yellow, s:yellow)
call s:hi_fg_group('HardHackerCyan',s:term_cyan, s:cyan)
call s:hi_fg_group('HardHackerGreen', s:term_green, s:green)
call s:hi_fg_group('HardHackerFg', s:term_fg, s:fg)
call s:hi_fg_group('HardHackerComment',s:term_comment, s:comment)

call s:hi_fg_group('HardHackerBorder',s:term_comment, s:comment)

" foreground color + bold 
call s:hi_fg_group('HardHackerRedBold', s:term_red, s:red, 'bold')

" foreground color + underline
call s:hi_fg_group('HardHackerRedUnderline', s:term_red, s:red, 'underline')
call s:hi_fg_group('HardHackerPurpleUnderline', s:term_purple, s:purple, 'underline')
call s:hi_fg_group('HardHackerBlueUnderline', s:term_blue,s:blue, 'underline')
call s:hi_fg_group('HardHackerYellowUnderline', s:term_yellow, s:yellow, 'underline')
call s:hi_fg_group('HardHackerCyanUnderline',s:term_cyan, s:cyan, 'underline')
call s:hi_fg_group('HardHackerGreenUnderline', s:term_green, s:green, 'underline')
call s:hi_fg_group('HardHackerFgUnderline', s:term_fg, s:fg, 'underline')
call s:hi_fg_group('HardHackerCommentUnderline',s:term_comment, s:comment, 'underline')

" foreground color + italic
call s:hi_fg_group('HardHackerCommentItalic',s:term_comment, s:comment, 'italic')
call s:hi_fg_group('HardHackerBlueItalic', s:term_blue, s:blue, 'italic')

" background color
call s:hi_bg_group('HardHackerBg', s:term_bg, s:bg)
call s:hi_bg_group('HardHackerSelection', s:term_selection, s:selection)

" foreground + background color
"
call s:hi_group_without_attr('HardHackerBlackYellow', s:term_black, s:term_yellow, s:black, s:yellow)
call s:hi_group_without_attr('HardHackerWhiteRed', s:term_fg, s:term_red, s:fg, s:red)
call s:hi_group_without_attr('HardHackerGreenSelection', s:term_green, s:term_selection, s:green, s:selection)
call s:hi_group_without_attr('HardHackerRedSelection', s:term_red, s:term_selection, s:red, s:selection)
call s:hi_group_without_attr('HardHackerYellowSelection', s:term_yellow, s:term_selection, s:yellow, s:selection)

" foreground + background blend
call s:hi_group_without_attr('HardHackerPurplePurple', s:term_purple, s:term_comment, s:purple, s:blend_colors(s:purple, s:bg, 10))
call s:hi_group_without_attr('HardHackerRedRed', s:term_red, s:term_comment, s:red, s:blend_colors(s:red, s:bg, 10))
call s:hi_group_without_attr('HardHackerCyanCyan', s:term_cyan, s:term_comment, s:cyan, s:blend_colors(s:cyan, s:bg, 10))
call s:hi_group_without_attr('HardHackerRedRed', s:term_red, s:term_comment, s:red, s:blend_colors(s:red, s:bg, 10))
call s:hi_group_without_attr('HardHackerYellowYellow', s:term_yellow, s:term_comment, s:yellow, s:blend_colors(s:yellow, s:bg, 10))

" black + black
call s:hi_group_without_attr('HardHackerFillDarker', s:term_bg_darker, s:term_bg_darker, '#1e1b26', '#1e1b26')

hi! link Comment        HardHackerCommentItalic
hi! link String         HardHackerGreen
hi! link Constant       HardHackerPurple
hi! link Character      HardHackerYellow
hi! link Number         HardHackerYellow
hi! link Boolean        HardHackerYellow
hi! link Float          HardHackerYellow

hi! link Function       HardHackerRed
hi! link Identifier     HardHackerPurple

hi! link Exception      HardHackerBlue
hi! link Repeat         HardHackerBlue
hi! link Statement      HardHackerBlue
hi! link Conditional    HardHackerBlue
hi! link Label          HardHackerBlue
hi! link Operator       HardHackerFg

if g:hardhacker_keyword_italic == 1 
    hi! link Keyword        HardHackerBlueItalic
else 
    hi! link Keyword        HardHackerBlue
endif

hi! link Type           HardHackerCyan
hi! link Delimiter      HardHackerFg

hi! link Tag            HardHackerCyan
hi! link Define         HardHackerCyan
hi! link Special        HardHackerPurple
hi! link SpecialKey     HardHackerPurple
hi! link SpecialComment HardHackerCyan
hi! link StorageClass   HardHackerCyan
hi! link Structure      HardHackerCyan
hi! link Macro          HardHackerCyan
hi! link PreCondit      HardHackerPurple
hi! link Include        HardHackerBlue
hi! link Typedef        HardHackerCyan
hi! link PreProc        HardHackerPurple

hi! link DiffAdd        HardHackerGreenSelection
hi! link DiffAdded      DiffAdd
hi! link DiffDelete     HardHackerRedSelection
hi! link DiffRemoved    DiffDelete
hi! link DiffText       HardHackerBlackYellow
hi! link DiffChange     HardHackerYellowSelection

hi! link TabLine        Normal
hi! link TabLineFill    HardHackerBg
hi! link TabLineSel     HardHackerRed

hi! link MoreMsg        HardHackerRed
hi! link NonText        EndOfBuffer
hi! link WarningMsg     HardHackerYellow
hi! link Title          HardHackerRedBold
hi! link Question       HardHackerRed
hi! link SignColumn     HardHackerComment
hi! link Error          HardHackerBlackYellow
hi! link ErrorMsg       Error

execute 'hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline'
execute 'hi Todo ctermfg='.s:term_yellow.' ctermbg=NONE cterm=inverse,bold guifg='.s:yellow.' guibg=NONE gui=inverse,bold,italic'

if has('nvim')
    hi! link DiagnosticOk               HardHackerGreen
    hi! link DiagnosticError            HardHackerRed
    hi! link DiagnosticHint             HardHackerPurple
    hi! link DiagnosticInfo             HardHackerCyan
    hi! link DiagnosticWarn             HardHackerYellow

    hi! link DiagnosticVirtualTextError HardHackerRedRed
    hi! link DiagnosticVirtualTextHint  HardHackerPurplePurple
    hi! link DiagnosticVirtualTextInfo  HardHackerCyanCyan
    hi! link DiagnosticVirtualTextWarn  HardHackerYellowYellow

    hi! link DiagnosticUnderlineError   HardHackerRedUnderline
    hi! link DiagnosticUnderlineHint    HardHackerPurpleUnderline
    hi! link DiagnosticUnderlineInfo    HardHackerCyanUnderline
    hi! link DiagnosticUnderlineWarn    HardHackerYellowUnderline
    
    hi! link WinSeparator               VertSplit

    hi! link LspCodeLens                Comment

    hi! link LspReferenceText           HardHackerSelection
    hi! link LspReferenceRead           HardHackerSelection
    hi! link LspReferenceWrite          HardHackerSelection
    hi! link LspInfoBorder              HardHackerBorder
    " LspInfoFiletype
    " LspInfoList
    " LspInfoTip
    " LspInfoTitle

    hi! link LspDiagnosticsDefaultError         DiagnosticError
    hi! link LspDiagnosticsDefaultHint          DiagnosticHint
    hi! link LspDiagnosticsDefaultInformation   DiagnosticInfo
    hi! link LspDiagnosticsDefaultWarning       DiagnosticWarn
    hi! link LspDiagnosticsUnderlineError       DiagnosticUnderlineError
    hi! link LspDiagnosticsUnderlineHint        DiagnosticUnderlineHint
    hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
    hi! link LspDiagnosticsUnderlineWarning     DiagnosticUnderlineWarn

    hi! link ModeMsg        HardHackerGreen
    hi! link MsgArea        HardHackerPurple
    hi! link MsgSeparator   HardHackerComment
    hi! link NormalFloat    Normal
    hi! link FloatBorder    HardHackerBorder
    hi! link FloatTitle     Title

    hi! link CursorIM       Cursor

    hi! link NvimInternalError      Error

    hi FloatShadow guibg=s:red
    hi FloatShadowThrough guibg=s:red
endif


" SYNTAX
"
" HTML
"
hi! link htmlTag          HardHackerBlue
hi! link htmlEndTag       HardHackerBlue
hi! link htmlTagName      HardHackerBlue
hi! link htmlArg          HardHackerRed
hi! link htmlSpecialChar  HardHackerGreen

" JAVASCRIPT
"
hi! link javaScriptBraces   HardHackerFg
hi! link javaScriptNumber   Constant
hi! link javaScriptNull     Constant
hi! link javaScriptFunction Keyword

""" 'pangloss/vim-javascript'
hi! link jsArrowFunction           Operator
hi! link jsBuiltins                HardHackerCyan
hi! link jsClassDefinition         HardHackerCyan
hi! link jsClassMethodType         Keyword
hi! link jsDestructuringAssignment HardHackerYellow
hi! link jsDocParam                HardHackerYellow
hi! link jsDocTags                 Keyword
hi! link jsDocType                 Type
hi! link jsDocTypeBrackets         HardHackerCyan
hi! link jsFuncArgOperator         Operator
hi! link jsFuncArgs                HardHackerYellow
hi! link jsFunction                Keyword
hi! link jsNull                    Constant
hi! link jsObjectColon             HardHackerRed
hi! link jsSuper                   HardHackerPurple
hi! link jsTemplateBraces          Special
hi! link jsThis                    HardHackerPurple
hi! link jsUndefined               Constant

""" 'maxmellon/vim-jsx-pretty'
hi! link jsxTag             Keyword
hi! link jsxTagName         Keyword
hi! link jsxComponentName   Type
hi! link jsxCloseTag        Type
hi! link jsxAttrib          HardHackerGreen
hi! link jsxCloseString     Identifier
hi! link jsxOpenPunct       Identifier

" YAML
"
hi! link yamlAnchor          HardHackerPurple
hi! link yamlPlainScalar     HardHackerYellow
hi! link yamlAlias           HardHackerGreen
hi! link yamlFlowCollection  HardHackerPurple
hi! link yamlNodeTag         HardHackerPurple
hi! link yamlBlockMappingKey HardHackerCyan
hi! link yamlFlowIndicator   Delimiter

" CSS
"
hi! link cssNoise             HardHackerBlue
hi! link cssPseudoClassId     HardHackerBlue
hi! link cssAttrComma         Delimiter
hi! link cssAttrRegion        HardHackerCyan
hi! link cssFunctionComma     Delimiter
hi! link cssProp              HardHackerPurple
hi! link cssUnitDecorators    HardHackerBlue
hi! link cssBraces            Delimiter
hi! link cssAttributeSelector HardHackerGreen   
hi! link cssPseudoClass       HardHackerBlue
hi! link cssVendor            HardHackerGreen

" Rust
"
hi! link rustCommentLineDoc Comment

" Vim
"
hi! link vimEnvVar             Constant
hi! link vimAutoEventList      Type
hi! link vimUserAttrbCmpltFunc Function
hi! link vimFunction           Function
hi! link vimOption             Type
hi! link vimSetMod             Keyword
hi! link vimAutoCmdSfxList     Type
hi! link vimSetSep             Delimiter
hi! link vimUserFunc           Function
hi! link vimHiBang             Keyword

" JSON
"
hi! link jsonKeywordMatch HardHackerPurple
hi! link jsonKeyword      HardHackerPurple

" Shell
"
hi! link shEscape HardHackerRed


" lualine theme
"
let s:lualine_colors = {
      \ 'red': '#e965a5',
      \ 'green': '#b1f2a7',
      \ 'yellow': '#ebde76',
      \ 'blue': '#b1baf4',
      \ 'purple': '#e192ef',
      \ 'cyan': '#b3f4f3',
      \ 'white': '#eee9fc',
      \ 'black': '#282433',
      \ 'selection': '#282433',
      \ 'comment': '#938aad',
      \ }

let s:lualine_theme = {
      \ 'normal': {
          \ 'a': { 'fg': s:lualine_colors['black'], 'bg': s:lualine_colors['purple'] },
          \ 'b': { 'fg': s:lualine_colors['red'], 'bg': s:lualine_colors['selection'] },
          \ 'c': { 'fg': s:lualine_colors['comment'], 'bg': s:lualine_colors['selection'] },
          \ },
      \ 'insert': { 'a': { 'fg': s:lualine_colors['black'], 'bg': s:lualine_colors['green'] } },
      \ 'visual': { 'a': { 'fg': s:lualine_colors['black'], 'bg': s:lualine_colors['yellow'] } },
      \ 'replace': { 'a': { 'fg': s:lualine_colors['black'], 'bg': s:lualine_colors['red'] } },
      \ 'inactive': {
          \ 'a': { 'fg': s:lualine_colors['white'], 'bg': s:lualine_colors['selection'] },
          \ 'b': { 'fg': s:lualine_colors['white'], 'bg': s:lualine_colors['selection'] },
          \ 'c': { 'fg': s:lualine_colors['white'], 'bg': s:lualine_colors['selection'] },
          \ },
      \ }

let g:hardhacker_lualine_theme = s:lualine_theme

" Barbecue theme
"
let s:hardhacker_barbecue_theme = {
      \ 'normal': { 'fg': s:comment },
      \
      \ 'ellipsis': { 'fg': s:comment },
      \ 'separator': { 'fg': s:comment },
      \ 'modified': { 'fg': s:comment },
      \
      \ 'dirname': { 'fg': s:comment },
      \ 'basename': { 'bold': v:false },
      \ 'context': {},
      \ }

let g:hardhacker_barbecue_theme = s:hardhacker_barbecue_theme

