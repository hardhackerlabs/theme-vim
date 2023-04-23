" Hard hacker theme for Vim
"
scriptencoding utf8
highlight clear

if exists("syntax_on")
  syntax reset
endif

set background=dark
let g:colors_name = "hardhacker"

if !has('gui_running') && &t_Co != 256 && !(has('termguicolors') && &termguicolors)
  finish
endif

if !exists('g:hardhacker_darker')
    let g:hardhacker_darker = 0
endif

" Palette
"
let s:bg_darker     = "#211e2a"
let s:bg_dark       = "#282433"
let s:bg            = s:bg_dark
let s:fg            = "#eee9fc"
let s:selection     = "#3f3951"
let s:comment       = "#938AAD"
let s:red           = "#e965a5"
let s:green         = "#b1f2a7"
let s:yellow        = "#ebde76"
let s:blue          = "#b1baf4"
let s:purple        = "#e192ef"
let s:cyan          = "#b3f4f3"
let s:black         = "#000000"

let s:bg2_darker    = "234"
let s:bg2_dark      = "235"
let s:bg2           = s:bg2_dark
let s:fg2           = "255"
let s:selection2    = "238"
let s:comment2      = "243"
let s:red2          = "205" "212
let s:green2        = "157"
let s:yellow2       = "227"
let s:blue2         = "153"
let s:purple2       = "219"
let s:cyan2         = "123"
let s:black2        = "16"

let s:none          = "NONE"

if g:hardhacker_darker == 1
    let s:bg = s:bg_darker
    let s:bg2 = s:bg2_darker
endif

" Set environment style
"
function s:hi_group(group, termfg, termbg, guifg, guibg)
    let l:hl_fields = [
        \ 'hi',
        \ a:group,
        \ 'ctermfg=' . a:termfg,
        \ 'ctermbg=' . a:termbg,
        \ 'cterm=NONE',
        \ 'guifg=' . a:guifg,
        \ 'guibg=' . a:guibg,
        \ 'gui=NONE'
        \]
    execute join(l:hl_fields, ' ')
endfunction

call s:hi_group('Cursor', s:fg2, s:red2, s:fg, s:red)
call s:hi_group('CursorLine', s:none, s:selection2, s:none, s:selection)
call s:hi_group('CursorLineNr', s:purple2, s:bg2, s:purple, s:bg)
call s:hi_group('CursorColumn', s:none, s:bg2,  s:none, s:bg)
call s:hi_group('ColorColumn', s:none, s:bg2,  s:none, s:bg)

call s:hi_group('StatusLine', s:fg2, s:selection2, s:fg, s:selection)
call s:hi_group('StatusLineNC', s:fg2, s:bg2, s:fg, s:bg)
call s:hi_group('StatusLineTerm', s:none, s:bg2, s:none, s:bg)
call s:hi_group('StatusLineTermNC', s:none, s:bg2, s:none, s:bg)
call s:hi_group('WildMenu', s:none, s:purple2, s:none, s:purple)

call s:hi_group('Pmenu', s:fg2, s:selection2, s:fg, s:selection)
call s:hi_group('PmenuSbar', s:fg2, s:selection2, s:fg, s:selection)
call s:hi_group('PmenuSel',s:black2, s:purple2, s:black, s:purple)
call s:hi_group('PmenuThumb',s:black2, s:purple2, s:black, s:purple)

call s:hi_group('Folded', s:fg2, s:bg2, s:fg, s:bg)
call s:hi_group('Normal', s:fg2, s:bg2, s:fg, s:bg)
call s:hi_group('EndOfBuffer', s:comment2, s:bg2, s:comment, s:bg) 
call s:hi_group('LineNr', s:comment2, s:bg2, s:comment, s:bg)
call s:hi_group('Visual',  s:none, s:selection2, s:none, s:selection)
call s:hi_group('VisualNOS',  s:none, s:selection2, s:none, s:selection)
call s:hi_group('Directory', s:blue2, s:none, s:blue, s:none)
call s:hi_group('IncSearch', s:bg2, s:yellow2, s:bg, s:yellow)
call s:hi_group('VertSplit', s:selection2, s:bg2, s:selection, s:bg)

execute 'hi Search ctermfg='.s:bg2.' ctermbg='.s:yellow2.' cterm=underline guifg='.s:bg.' guibg='.s:yellow.' gui=underline'
execute 'hi MatchParen ctermfg='.s:yellow2.' ctermbg=NONE cterm=underline guifg='.s:yellow.' guibg=NONE gui=underline'

" Set text highlight
"
function s:hi_fg_group(group, ctermfg, guifg)
    call s:hi_group(a:group, a:ctermfg, s:none, a:guifg, s:none)
endfunction

function s:hi_bg_group(group, ctermbg, guibg)
    call s:hi_group(a:group, s:none, a:ctermbg, s:none, a:guibg)
endfunction

call s:hi_fg_group('HardHackerRed', s:red2, s:red)
call s:hi_fg_group('HardHackerPurple', s:purple2, s:purple)
call s:hi_fg_group('HardHackerBlue', s:blue2,s:blue)
call s:hi_fg_group('HardHackerYellow', s:yellow2, s:yellow)
call s:hi_fg_group('HardHackerCyan',s:cyan2, s:cyan)
call s:hi_fg_group('HardHackerGreen', s:green2, s:green)
call s:hi_fg_group('HardHackerFg', s:fg2, s:fg)

call s:hi_bg_group('HardHackerBgDarker', s:black2, s:black)
call s:hi_bg_group('HardHackerSelection', s:selection2, s:selection)

call s:hi_group('HardHackerBlackYellow', s:black2, s:yellow2, s:black, s:yellow)
call s:hi_group('HardHackerGreenSelection', s:green2, s:selection2, s:green, s:selection)
call s:hi_group('HardHackerRedSelection', s:red2, s:selection2, s:red, s:selection)
call s:hi_group('HardHackerYellowSelection', s:yellow2, s:selection2, s:yellow, s:selection)

call s:hi_fg_group('Comment',s:comment2, s:comment)
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
hi! link Keyword        HardHackerBlue
hi! link Operator       HardHackerFg  

hi! link Type           HardHackerCyan
hi! link Delimiter      HardHackerFg

hi! link Tag            HardHackerCyan
hi! link Define         HardHackerPurple
hi! link Special        HardHackerPurple
hi! link SpecialKey     HardHackerPurple
hi! link SpecialComment HardHackerCyan
hi! link StorageClass   HardHackerPurple
hi! link Structure      HardHackerPurple
hi! link Macro          HardHackerPurple
hi! link PreCondit      HardHackerPurple
hi! link Include        HardHackerRed
hi! link Typedef        HardHackerPurple
hi! link PreProc        HardHackerPurple

hi! link DiffAdd        HardHackerGreenSelection
hi! link DiffAdded      DiffAdd
hi! link DiffDelete     HardHackerRedSelection
hi! link DiffRemoved    DiffDelete
hi! link DiffText       HardHackerBlackYellow
hi! link DiffChange     HardHackerYellowSelection

hi! link TabLine        HardHackerFg
hi! link TabLineFill    HardHackerBgDarker
hi! link TabLineSel     Normal

hi! link MoreMsg        HardHackerRed
hi! link NonText        EndOfBuffer
hi! link WarningMsg     HardHackerYellow
hi! link Title          HardHackerRed
hi! link Question       HardHackerRed
hi! link SignColumn     Comment
hi! link Error          HardHackerBlackYellow
hi! link ErrorMsg       Error
execute 'hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline'
execute 'hi Todo ctermfg='.s:yellow2.' ctermbg=NONE cterm=inverse,bold guifg='.s:yellow.' guibg=NONE gui=inverse,bold,italic'

function s:is_valid(...)
    if ! exists('s:colors_name') || s:colors_name !=# 'hardhacker'
        return 0
    elseif a:0 > 0 && (exists('b:current_syntax') && index(a:000, b:current_syntax) != -1)
        return 1
    endif
    return 0
endfunction

if has('nvim')
    hi! link DiagnosticInfo             HardHackerCyan
    hi! link DiagnosticHint             HardHackerCyan
    hi! link DiagnosticError            HardHackerRed
    hi! link DiagnosticWarn             HardHackerYellow
    hi! link DiagnosticUnderlineError   HardHackerRed
    hi! link DiagnosticUnderlineHint    HardHackerFg
    hi! link DiagnosticUnderlineInfo    HardHackerFg
    hi! link DiagnosticUnderlineWarn    HardHackerYellow
    
    hi! link WinSeparator               Comment

    hi! link SpecialKey                 HardHackerRed
    hi! link LspReferenceText           HardHackerSelection
    hi! link LspReferenceRead           HardHackerSelection
    hi! link LspReferenceWrite          HardHackerSelection

    hi! link LspDiagnosticsDefaultInformation   DiagnosticInfo
    hi! link LspDiagnosticsDefaultHint          DiagnosticHint
    hi! link LspDiagnosticsDefaultError         DiagnosticError
    hi! link LspDiagnosticsDefaultWarning       DiagnosticWarn
    hi! link LspDiagnosticsUnderlineError       DiagnosticUnderlineError
    hi! link LspDiagnosticsUnderlineHint        DiagnosticUnderlineHint
    hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
    hi! link LspDiagnosticsUnderlineWarning     DiagnosticUnderlineWarn
else
    hi! link SpecialKey HardHackerPurple
endif


" SYNTAX
"
" GO
"
hi! link goType                   HardHackerPurple
hi! link goBuiltins               HardHackerRed
hi! link goLabel                  HardHackerRed
hi! link goPredefinedIdentifiers  HardHackerYellow
hi! link goImportString           HardHackerRed

" HTML
"
hi! link htmlTag          HardHackerRed
hi! link htmlEndTag       HardHackerRed
hi! link htmlTagName      HardHackerRed
hi! link htmlArg          HardHackerBlue
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
