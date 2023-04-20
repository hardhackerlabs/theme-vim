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


" Palette
"
let s:bg            = "#282433"
let s:fg            = "#eee9fc"
let s:selection     = "#3f3951"
let s:comment       = "#777383"
let s:red           = "#e965a5"
let s:green         = "#b1f2a7"
let s:yellow        = "#ebde76"
let s:blue          = "#b1baf4"
let s:purple        = "#e192ef"
let s:cyan          = "#b3f4f3"

let s:bg2           = "235"
let s:fg2           = "255"
let s:selection2    = "238"
let s:comment2      = "243"
let s:red2          = "205" "212
let s:green2        = "157"
let s:yellow2       = "227"
let s:blue2         = "153"
let s:purple2       = "219"
let s:cyan2         = "123"

let s:none          = "NONE"

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
call s:hi_group('CursorLine', s:red2, s:selection2, s:red, s:selection)
call s:hi_group('CursorColumn', s:none, s:bg2,  s:none, s:bg)
call s:hi_group('ColorColumn', s:none, s:bg2,  s:none, s:bg)
call s:hi_group('LineNr', '102', s:bg2, '#84898c', s:bg)
call s:hi_group('Visual',  s:none, s:purple2, s:none, s:purple)
call s:hi_group('Directory', s:blue2, s:none, s:blue, s:none)
call s:hi_group('IncSearch', s:bg2, s:yellow2, s:bg, s:yellow)
call s:hi_group('VertSplit', s:selection2, s:bg2, s:selection, s:bg)
call s:hi_group('StatusLine', s:fg2, s:selection2, s:fg, s:selection)
call s:hi_group('StatusLineNC', s:fg2, s:bg2, s:fg, s:bg)
call s:hi_group('Pmenu', s:fg2, s:selection2, s:fg, s:selection)
call s:hi_group('PmenuSel',s:fg2, s:purple2, s:fg, s:purple)
call s:hi_group('Folded', s:fg2, s:bg2, s:fg, s:bg)
call s:hi_group('Normal', s:fg2, s:bg2, s:fg, s:bg)
call s:hi_group('EndOfBuffer', s:selection2, s:bg2, s:selection, s:bg) 

execute 'hi Search ctermfg='.s:bg2.' ctermbg='.s:yellow2.' cterm=underline guifg='.s:bg.' guibg='.s:yellow.' gui=underline'
execute 'hi MatchParen ctermfg=180 ctermbg=NONE cterm=underline guifg=#dda790 guibg=NONE gui=underline'

" Set text highlight
"
function s:hi_text_group(group, ctermfg, guifg)
    call s:hi_group(a:group, a:ctermfg, s:none, a:guifg, s:none)
endfunction

call s:hi_text_group('HardHacker_Red', s:red2, s:red)
call s:hi_text_group('HardHacker_Purple', s:purple2, s:purple)
call s:hi_text_group('HardHacker_Blue', s:blue2,s:blue)
call s:hi_text_group('HardHacker_Yellow', s:yellow2, s:yellow)
call s:hi_text_group('HardHacker_Cyan',s:cyan2, s:cyan)
call s:hi_text_group('HardHacker_Green', s:green2, s:green)
call s:hi_text_group('HardHacker_FG', s:fg2, s:fg)
call s:hi_text_group('Comment',s:comment2, s:comment)
call s:hi_text_group('ErrorMsg', s:none, s:none)
call s:hi_group('Error', s:fg2, s:red2, s:fg, s:red)

execute 'hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline'
execute 'hi Todo ctermfg='.s:yellow2.' ctermbg=NONE cterm=inverse,bold guifg='.s:yellow.' guibg=NONE gui=inverse,bold,italic'

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
hi! link DiffDelete     HardHacker_Red
hi! link DiffText       HardHacker_FG
hi! link DiffChange     HardHacker_Yellow
hi! link WarningMsg     HardHacker_Yellow
hi! link PreProc        HardHacker_Purple
hi! link PreCondit      HardHacker_Purple
hi! link Title          HardHacker_FG

function s:is_valid(...)
    if ! exists('s:colors_name') || s:colors_name !=# 'hardhacker'
        return 0
    elseif a:0 > 0 && (exists('b:current_syntax') && index(a:000, b:current_syntax) != -1)
        return 1
    endif
    return 0
endfunction

" GO
"
hi! link goType                   HardHacker_Purple
hi! link goBuiltins               HardHacker_Red
hi! link goLabel                  HardHacker_Red
hi! link goPredefinedIdentifiers  HardHacker_Yellow
hi! link goImportString           HardHacker_Red

" HTML
"
hi! link htmlTag          HardHacker_Red
hi! link htmlEndTag       HardHacker_Red
hi! link htmlTagName      HardHacker_Red
hi! link htmlArg          HardHacker_Blue
hi! link htmlSpecialChar  HardHacker_Green

" JAVASCRIPT
"
hi! link javaScriptBraces   HardHacker_FG
hi! link javaScriptNumber   Constant
hi! link javaScriptNull     Constant
hi! link javaScriptFunction Keyword

""" 'pangloss/vim-javascript'
hi! link jsArrowFunction           Operator
hi! link jsBuiltins                HardHacker_Cyan
hi! link jsClassDefinition         HardHacker_Cyan
hi! link jsClassMethodType         Keyword
hi! link jsDestructuringAssignment HardHacker_Yellow
hi! link jsDocParam                HardHacker_Yellow
hi! link jsDocTags                 Keyword
hi! link jsDocType                 Type
hi! link jsDocTypeBrackets         HardHacker_Cyan
hi! link jsFuncArgOperator         Operator
hi! link jsFuncArgs                HardHacker_Yellow
hi! link jsFunction                Keyword
hi! link jsNull                    Constant
hi! link jsObjectColon             HardHacker_Red
hi! link jsSuper                   HardHacker_Purple
hi! link jsTemplateBraces          Special
hi! link jsThis                    HardHacker_Purple
hi! link jsUndefined               Constant

""" 'maxmellon/vim-jsx-pretty'
hi! link jsxTag             Keyword
hi! link jsxTagName         Keyword
hi! link jsxComponentName   Type
hi! link jsxCloseTag        Type
hi! link jsxAttrib          HardHacker_Green
hi! link jsxCloseString     Identifier
hi! link jsxOpenPunct       Identifier

" YAML
"
hi! link yamlAnchor          HardHacker_Purple
hi! link yamlPlainScalar     HardHacker_Yellow
hi! link yamlAlias           HardHacker_Green
hi! link yamlFlowCollection  HardHacker_Purple
hi! link yamlNodeTag         HardHacker_Purple
hi! link yamlBlockMappingKey HardHacker_Cyan
hi! link yamlFlowIndicator   Delimiter

" CSS
"
hi! link cssNoise             HardHacker_Blue
hi! link cssPseudoClassId     HardHacker_Blue
hi! link cssAttrComma         Delimiter
hi! link cssAttrRegion        HardHacker_Cyan
hi! link cssFunctionComma     Delimiter
hi! link cssProp              HardHacker_Purple
hi! link cssUnitDecorators    HardHacker_Blue
hi! link cssBraces            Delimiter
hi! link cssAttributeSelector HardHacker_Green   
hi! link cssPseudoClass       HardHacker_Blue
hi! link cssVendor            HardHacker_Green

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
hi! link jsonKeywordMatch HardHacker_Purple
hi! link jsonKeyword      HardHacker_Purple

" Shell
"
hi! link shEscape HardHacker_Red

