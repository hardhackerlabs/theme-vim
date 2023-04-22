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
call s:hi_group('CursorLineNr', s:purple2, s:bg2, s:purple, s:bg2)
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
call s:hi_group('EndOfBuffer', s:selection2, s:bg2, s:selection, s:bg) 
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

call s:hi_fg_group('HardHacker_Red', s:red2, s:red)
call s:hi_fg_group('HardHacker_Purple', s:purple2, s:purple)
call s:hi_fg_group('HardHacker_Blue', s:blue2,s:blue)
call s:hi_fg_group('HardHacker_Yellow', s:yellow2, s:yellow)
call s:hi_fg_group('HardHacker_Cyan',s:cyan2, s:cyan)
call s:hi_fg_group('HardHacker_Green', s:green2, s:green)
call s:hi_fg_group('HardHacker_FG', s:fg2, s:fg)
call s:hi_bg_group('HardHacker_BG_Darker', s:black2, s:black)
call s:hi_bg_group('HardHacker_Selection', s:selection2, s:selection)

call s:hi_fg_group('Comment',s:comment2, s:comment)
hi! link String         HardHacker_Green
hi! link Constant       HardHacker_Purple
hi! link Character      HardHacker_Yellow
hi! link Number         HardHacker_Yellow
hi! link Boolean        HardHacker_Yellow
hi! link Float          HardHacker_Yellow

hi! link Function       HardHacker_Blue
hi! link Identifier     HardHacker_Blue

hi! link Exception      HardHacker_Red
hi! link Repeat         HardHacker_Red
hi! link Statement      HardHacker_Red
hi! link Conditional    HardHacker_Red
hi! link Label          HardHacker_Red
hi! link Operator       HardHacker_FG  
hi! link Keyword        HardHacker_Red

hi! link Type           HardHacker_Cyan
hi! link Delimiter      HardHacker_FG

hi! link Tag            HardHacker_Cyan
hi! link Define         HardHacker_Purple
hi! link Special        HardHacker_Purple
hi! link SpecialKey     HardHacker_Purple
hi! link SpecialComment HardHacker_Cyan
hi! link StorageClass   HardHacker_Purple
hi! link Structure      HardHacker_Purple
hi! link Macro          HardHacker_Purple
hi! link PreCondit      HardHacker_Purple
hi! link Include        HardHacker_Red
hi! link Typedef        HardHacker_Purple

hi! link DiffAdd        HardHacker_Green
hi! link DiffAdded      DiffAdd
hi! link DiffDelete     HardHacker_Red
hi! link DiffRemoved    DiffDelete
hi! link DiffText       HardHacker_FG
hi! link DiffChange     HardHacker_Yellow

hi! link TabLine        HardHacker_FG
hi! link TabLineFill    HardHacker_BG_Darker
hi! link TabLineSel     Normal

hi! link MoreMsg        HardHacker_FG " todo
hi! link NonText        EndOfBuffer   " todo
hi! link WarningMsg     HardHacker_Yellow
hi! link PreProc        HardHacker_Purple
hi! link PreCondit      HardHacker_Purple
hi! link Title          HardHacker_FG
hi! link Question       HardHacker_FG " todo
hi! link SignColumn     Comment
call s:hi_fg_group('ErrorMsg', s:none, s:none)
call s:hi_group('Error', s:fg2, s:red2, s:fg, s:red)
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
    hi! link DiagnosticInfo             HardHacker_Cyan
    hi! link DiagnosticHint             HardHacker_Cyan
    hi! link DiagnosticError            HardHacker_Red
    hi! link DiagnosticWarn             HardHacker_Yellow
    hi! link DiagnosticUnderlineError   HardHacker_Red
    hi! link DiagnosticUnderlineHint    HardHacker_FG
    hi! link DiagnosticUnderlineInfo    HardHacker_FG
    hi! link DiagnosticUnderlineWarn    HardHacker_Yellow
    
    hi! link WinSeparator               Comment

    hi! link SpecialKey                 HardHacker_Red
    hi! link LspReferenceText           HardHacker_Selection
    hi! link LspReferenceRead           HardHacker_Selection
    hi! link LspReferenceWrite          HardHacker_Selection

    hi! link LspDiagnosticsDefaultInformation   DiagnosticInfo
    hi! link LspDiagnosticsDefaultHint          DiagnosticHint
    hi! link LspDiagnosticsDefaultError         DiagnosticError
    hi! link LspDiagnosticsDefaultWarning       DiagnosticWarn
    hi! link LspDiagnosticsUnderlineError       DiagnosticUnderlineError
    hi! link LspDiagnosticsUnderlineHint        DiagnosticUnderlineHint
    hi! link LspDiagnosticsUnderlineInformation DiagnosticUnderlineInfo
    hi! link LspDiagnosticsUnderlineWarning     DiagnosticUnderlineWarn
else
    hi! link SpecialKey HardHacker_Purple
endif
