syntax on
"
" set opts
"
set nocompatible
set number
set relativenumber
set noswapfile
set nobackup
set scrolloff=10
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set cursorline

" Searching
set incsearch " search as characters are entered
set nohlsearch " do not highlight matches
set ignorecase " ignore case in searches by default
set smartcase " but make it case sensitive if an uppercase is entered

let g:netrw_browse_split=4
let g:netrw_banner=0
let g:netrw_winsize=20
let g:netrw_liststyle=3
let g:netrw_altv=1

" set window title to a current directory (aka project) name
set title
set laststatus=3
set statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%v%)\ %p
set splitbelow " open new vertical split bottom
set splitright " open new horizontal splits right
set confirm " confirm write instead of error
set novisualbell "no visual bell
set noerrorbells
set autowrite
set autowriteall "auto-write changes on buffer changes, on exit, etc
set synmaxcol=300 " text after this column is not highlighted

"
" keys
"
" jump half-page up/down centers the cursor
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

" also center the search results
nnoremap n nzzzv
nnoremap n nzzzv

" << and >> navigate buffers, works much better than [-b for me
nnoremap << <cmd>:bp<cr>
nnoremap >> <cmd>:bn<cr>

" always change and delete into blackhole register
nnoremap c "_c
nnoremap dw "_diw

" change into a blackhole register
nnoremap C "_ciw
nnoremap cw "_ciw
nnoremap c" "_ci"
nnoremap c' "_ci'
nnoremap c( "_ci(
nnoremap c{ "_ci{
nnoremap c[ "_ci[

" yank faster
nnoremap yw yiw
nnoremap y" yi"
nnoremap y' yi'
nnoremap y( yi(
nnoremap y{ yi{
nnoremap y[ yi[

" show buffer list, swich by number
:nnoremap <c-e> :ls<cr>:buffer<space>

" move faster from normal mode
inoremap II <esc>I
inoremap AA <esc>A
inoremap OO <esc>o

" remove trailing spaces atuomatically
autocmd BufWritePre * :%s/\s\+$//e


" vim color file
" name:       onedark.vim
" version:    1.21
" maintainer: https://github.com/joshdick/onedark.vim/
" license:    the mit license (mit)
" based on:   https://github.com/maxst/flatcolor/

" +----------------+
" | initialization |
" +----------------+

set background=dark

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name="onedark"

" set to "256" for 256-color terminals, or
" set to "16" to use your terminal emulator's native colors
" (a 16-color palette for this theme is not available yet.)
if !exists("g:onedark_termcolors")
  let g:onedark_termcolors = 256
endif

" mot all terminals support italics properly. if yours does, opt-in.
if !exists("g:onedark_terminal_italics")
  let g:onedark_terminal_italics = 1
endif

" this function was borrowed from flatcolor: https://github.com/maxst/flatcolor/
" it was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  if g:onedark_terminal_italics == 0 && has_key(a:style, "cterm") && a:style["cterm"] == "italic"
    unlet a:style.cterm
  endif
  if g:onedark_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

" +-----------------+
" | color variables |
" +-----------------+

let s:red = { "gui": "#e06c75", "cterm": "204", "cterm16": "1"} " alternate cterm: 168
let s:dark_red = { "gui": "#e64040", "cterm": "196", "cterm16": "9"}
let s:green = { "gui": "#98c379", "cterm": "114", "cterm16": "2"}
let s:dark_green = { "gui": "#6dc35c", "cterm": "36", "cterm16": "10"}
let s:yellow = { "gui": "#e5c07b", "cterm": "180", "cterm16": "3"}
let s:dark_yellow = { "gui": "#d19a66", "cterm": "173", "cterm16": "11"}
let s:blue = { "gui": "#61afef", "cterm": "39", "cterm16": "4"} " alternate cterm: 75
let s:dark_blue = { "gui": "#6097dc", "cterm": "32", "cterm16": "12"}
let s:purple = { "gui": "#c678dd", "cterm": "170", "cterm16": "5"} " alternate cterm: 176
let s:dark_purple = { "gui": "#8d73de", "cterm": "55", "cterm16": "13"}
let s:cyan = { "gui": "#56b6c2", "cterm": "38", "cterm16": "6"} " alternate cterm: 73
let s:dark_cyan = { "gui": "#53d3d2", "cterm": "110", "cterm16": "14"}
let s:white = { "gui": "#abb2bf", "cterm": "145", "cterm16" : "7" }
let s:black = { "gui": "#282c34", "cterm": "235", "cterm16": "8" }
let s:visual_black = { "gui": "NONE", "cterm": "NONE", "cterm16": s:black.cterm16 } " black out selected text in 16-color visual mode
let s:foreground = { "gui": "#ABB2BF", "cterm": "145", "cterm16": "NONE" }
let s:background = { "gui": "NONE", "cterm": "NONE", "cterm16": "NONE" }
let s:menu_grey = { "gui": "#3E4452", "cterm": "237", "cterm16": "7" }
let s:comment_grey = { "gui": "#5C6670", "cterm": "59", "cterm16": "15" }
let s:gutter_fg_grey = { "gui": "#636D83", "cterm": "238", "cterm16": "15" }
let s:gutter_bg_grey = { "gui": "#2C313A", "cterm": "NONE", "cterm16": "NONE" }
let s:cursor_grey =  { "gui": "#2C323B", "cterm": "236", "cterm16": "15" } " TODO: This cterm16 value doesn't work great here
let s:visual_grey = { "gui": "#3E4451", "cterm": "237", "cterm16": "15" }
let s:special_grey = { "gui": "#383C45", "cterm": "238", "cterm16": "15" }
let s:vertsplit = { "gui": "#181A1F", "cterm": "59", "cterm16": "15" }

" +---------------------------------------------------------+
" | Syntax Groups (descriptions and ordering from `:h w18`) |
" +---------------------------------------------------------+
call s:h("Comment", { "fg": s:comment_grey, "gui": "italic", "cterm": "italic" }) " any comment
call s:h("Constant", { "fg": s:cyan }) " any constant
call s:h("String", { "fg": s:green }) " a string constant: "this is a string"
call s:h("Character", { "fg": s:green }) " a character constant: 'c', '\n'
call s:h("Number", { "fg": s:dark_yellow }) " a number constant: 234, 0xff
call s:h("Boolean", { "fg": s:dark_yellow }) " a boolean constant: TRUE, false
call s:h("Float", { "fg": s:dark_yellow }) " a floating point constant: 2.3e10
call s:h("Identifier", { "fg": s:red }) " any variable name
call s:h("Function", { "fg": s:blue }) " function name (also: methods for classes)
call s:h("Statement", { "fg": s:purple }) " any statement
call s:h("Conditional", { "fg": s:purple }) " if, then, else, endif, switch, etc.
call s:h("Repeat", { "fg": s:purple }) " for, do, while, etc.
call s:h("Label", { "fg": s:purple }) " case, default, etc.
call s:h("Operator", { "fg": s:purple }) " sizeof", "+", "*", etc.
call s:h("Keyword", { "fg": s:purple }) " any other keyword
call s:h("Exception", { "fg": s:purple }) " try, catch, throw
call s:h("PreProc", { "fg": s:yellow }) " generic Preprocessor
call s:h("Include", { "fg": s:blue }) " preprocessor #include
call s:h("Define", { "fg": s:purple }) " preprocessor #define
call s:h("Macro", { "fg": s:purple }) " same as Define
call s:h("PreCondit", { "fg": s:yellow }) " preprocessor #if, #else, #endif, etc.
call s:h("Type", { "fg": s:yellow }) " int, long, char, etc.
call s:h("StorageClass", { "fg": s:yellow }) " static, register, volatile, etc.
call s:h("Structure", { "fg": s:yellow }) " struct, union, enum, etc.
call s:h("Typedef", { "fg": s:yellow }) " A typedef
call s:h("Special", { "fg": s:blue }) " any special symbol
call s:h("SpecialChar", { "fg": s:dark_yellow }) " special character in a constant
call s:h("Tag", {}) " you can use CTRL-] on this
call s:h("Delimiter", {}) " character that needs attention
call s:h("SpecialComment", { "fg": s:comment_grey }) " special things inside a comment
call s:h("Debug", {}) " debugging statements
call s:h("Underlined", { "gui": "underline", "cterm": "underline" }) " text that stands out, HTML links
call s:h("Ignore", {}) " left blank, hidden
call s:h("Error", { "fg": s:red }) " any erroneous construct
call s:h("Todo", { "fg": s:purple }) " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

" Highlighting Groups (descriptions and ordering from `:h highlight-groups`) {{{
call s:h("ColorColumn", { "bg": s:cursor_grey }) " used for the columns set with 'colorcolumn'
call s:h("Conceal", {}) " placeholder characters substituted for concealed text (see 'conceallevel')
call s:h("Cursor", { "fg": s:black, "bg": s:blue }) " the character under the cursor
call s:h("CursorIM", {}) " like Cursor, but used when in IME mode
call s:h("CursorColumn", { "bg": s:cursor_grey }) " the screen column that the cursor is in when 'cursorcolumn' is set
if &diff
  " Don't change the background color in diff mode
  call s:h("CursorLine", { "gui": "underline" }) " the screen line that the cursor is in when 'cursorline' is set
else
  call s:h("CursorLine", { "bg": s:cursor_grey }) " the screen line that the cursor is in when 'cursorline' is set
endif
call s:h("Directory", { "fg": s:blue }) " directory names (and other special names in listings)
call s:h("DiffAdd", { "bg": s:green, "fg": s:black }) " diff mode: Added line
call s:h("DiffChange", { "fg": s:yellow, "gui": "underline", "cterm": "underline" }) " diff mode: Changed line
call s:h("DiffDelete", { "bg": s:red, "fg": s:black }) " diff mode: Deleted line
call s:h("DiffText", { "bg": s:yellow, "fg": s:black }) " diff mode: Changed text within a changed line
if get(g:, 'onedark_hide_endofbuffer', 0)
    " If enabled, will style end-of-buffer filler lines (~) to appear to be hidden.
    call s:h("EndOfBuffer", { "fg": s:black }) " filler lines (~) after the last line in the buffer
endif
call s:h("ErrorMsg", { "fg": s:red }) " error messages on the command line
call s:h("VertSplit", { "fg": s:vertsplit }) " the column separating vertically split windows
call s:h("Folded", { "fg": s:comment_grey }) " line used for closed folds
call s:h("FoldColumn", {}) " 'foldcolumn'
call s:h("SignColumn", {}) " column where signs are displayed
call s:h("IncSearch", { "fg": s:yellow, "bg": s:comment_grey }) " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call s:h("LineNr", { "fg": s:gutter_fg_grey }) " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h("CursorLineNr", {}) " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
call s:h("MatchParen", { "fg": s:blue, "gui": "underline", "cterm": "underline" }) " The character under the cursor or just before it, if it is a paired bracket, and its match.
call s:h("ModeMsg", {}) " 'showmode' message (e.g., "-- INSERT --")
call s:h("MoreMsg", {}) " more-prompt
call s:h("NonText", { "fg": s:special_grey }) " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
call s:h("Normal", { "fg": s:foreground, "bg": s:background }) " normal text
call s:h("Pmenu", { "fg": s:white, "bg": s:menu_grey }) " Popup menu: normal item.
call s:h("PmenuSel", { "fg": s:cursor_grey, "bg": s:blue }) " Popup menu: selected item.
call s:h("PmenuSbar", { "bg": s:cursor_grey }) " Popup menu: scrollbar.
call s:h("PmenuThumb", { "bg": s:white }) " Popup menu: Thumb of the scrollbar.
call s:h("Question", { "fg": s:purple }) " hit-enter prompt and yes/no questions
call s:h("QuickFixLine", { "fg": s:black, "bg": s:yellow }) " Current quickfix item in the quickfix window.
call s:h("Search", { "fg": s:black, "bg": s:yellow }) " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
call s:h("SpecialKey", { "fg": s:special_grey }) " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
call s:h("SpellBad", { "fg": s:red, "gui": "underline", "cterm": "underline" }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call s:h("SpellCap", { "fg": s:dark_yellow }) " Word that should start with a capital. This will be combined with the highlighting used otherwise.
call s:h("SpellLocal", { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
call s:h("SpellRare", { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
call s:h("StatusLine", { "fg": s:white, "bg": s:cursor_grey }) " status line of current window
call s:h("StatusLineNC", { "fg": s:comment_grey }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
call s:h("StatusLineTerm", { "fg": s:white, "bg": s:cursor_grey }) " status line of current :terminal window
call s:h("StatusLineTermNC", { "fg": s:comment_grey }) " status line of non-current :terminal window
call s:h("TabLine", { "fg": s:comment_grey }) " tab pages line, not active tab page label
call s:h("TabLineFill", {}) " tab pages line, where there are no labels
call s:h("TabLineSel", { "fg": s:white }) " tab pages line, active tab page label
call s:h("Terminal", { "fg": s:white, "bg": s:black }) " terminal window (see terminal-size-color)
call s:h("Title", { "fg": s:green }) " titles for output from ":set all", ":autocmd" etc.
call s:h("Visual", { "bg": s:visual_grey }) " Visual mode selection
call s:h("VisualNOS", { "bg": s:visual_grey }) " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
call s:h("WarningMsg", { "fg": s:yellow }) " warning messages
call s:h("WildMenu", { "fg": s:black, "bg": s:blue }) " current match in 'wildmenu' completion

" Termdebug highlighting for Vim 8.1+ {{{
" See `:h hl-debugPC` and `:h hl-debugBreakpoint`.
call s:h("debugPC", { "bg": s:special_grey }) " the current position
call s:h("debugBreakpoint", { "fg": s:black, "bg": s:red }) " a breakpoint

" Language-Specific Highlighting {{{
" CSS
call s:h("cssAttrComma", { "fg": s:purple })
call s:h("cssAttributeSelector", { "fg": s:green })
call s:h("cssBraces", { "fg": s:white })
call s:h("cssClassName", { "fg": s:dark_yellow })
call s:h("cssClassNameDot", { "fg": s:dark_yellow })
call s:h("cssDefinition", { "fg": s:purple })
call s:h("cssFontAttr", { "fg": s:dark_yellow })
call s:h("cssFontDescriptor", { "fg": s:purple })
call s:h("cssFunctionName", { "fg": s:blue })
call s:h("cssIdentifier", { "fg": s:blue })
call s:h("cssImportant", { "fg": s:purple })
call s:h("cssInclude", { "fg": s:white })
call s:h("cssIncludeKeyword", { "fg": s:purple })
call s:h("cssMediaType", { "fg": s:dark_yellow })
call s:h("cssProp", { "fg": s:white })
call s:h("cssPseudoClassId", { "fg": s:dark_yellow })
call s:h("cssSelectorOp", { "fg": s:purple })
call s:h("cssSelectorOp2", { "fg": s:purple })
call s:h("cssTagName", { "fg": s:red })

" Go
call s:h("goDeclaration", { "fg": s:purple })
call s:h("goBuiltins", { "fg": s:cyan })
call s:h("goFunctionCall", { "fg": s:blue })
call s:h("goVarDefs", { "fg": s:red })
call s:h("goVarAssign", { "fg": s:red })
call s:h("goVar", { "fg": s:purple })
call s:h("goConst", { "fg": s:purple })
call s:h("goType", { "fg": s:yellow })
call s:h("goTypeName", { "fg": s:yellow })
call s:h("goDeclType", { "fg": s:cyan })
call s:h("goTypeDecl", { "fg": s:purple })

" HTML (keep consistent with Markdown, below)
call s:h("htmlArg", { "fg": s:dark_yellow })
call s:h("htmlBold", { "fg": s:dark_yellow, "gui": "bold", "cterm": "bold" })
call s:h("htmlBoldItalic", { "fg": s:green, "gui": "bold,italic", "cterm": "bold,italic" })
call s:h("htmlEndTag", { "fg": s:white })
call s:h("htmlH1", { "fg": s:red })
call s:h("htmlH2", { "fg": s:red })
call s:h("htmlH3", { "fg": s:red })
call s:h("htmlH4", { "fg": s:red })
call s:h("htmlH5", { "fg": s:red })
call s:h("htmlH6", { "fg": s:red })
call s:h("htmlItalic", { "fg": s:purple, "gui": "italic", "cterm": "italic" })
call s:h("htmlLink", { "fg": s:cyan, "gui": "underline", "cterm": "underline" })
call s:h("htmlSpecialChar", { "fg": s:dark_yellow })
call s:h("htmlSpecialTagName", { "fg": s:red })
call s:h("htmlTag", { "fg": s:white })
call s:h("htmlTagN", { "fg": s:red })
call s:h("htmlTagName", { "fg": s:red })
call s:h("htmlTitle", { "fg": s:white })

" JavaScript
call s:h("javaScriptBraces", { "fg": s:white })
call s:h("javaScriptFunction", { "fg": s:purple })
call s:h("javaScriptIdentifier", { "fg": s:purple })
call s:h("javaScriptNull", { "fg": s:dark_yellow })
call s:h("javaScriptNumber", { "fg": s:dark_yellow })
call s:h("javaScriptRequire", { "fg": s:cyan })
call s:h("javaScriptReserved", { "fg": s:purple })
" https://github.com/pangloss/vim-javascript
call s:h("jsArrowFunction", { "fg": s:purple })
call s:h("jsClassKeyword", { "fg": s:purple })
call s:h("jsClassMethodType", { "fg": s:purple })
call s:h("jsDocParam", { "fg": s:blue })
call s:h("jsDocTags", { "fg": s:purple })
call s:h("jsExport", { "fg": s:purple })
call s:h("jsExportDefault", { "fg": s:purple })
call s:h("jsExtendsKeyword", { "fg": s:purple })
call s:h("jsFrom", { "fg": s:purple })
call s:h("jsFuncCall", { "fg": s:blue })
call s:h("jsFunction", { "fg": s:purple })
call s:h("jsGenerator", { "fg": s:yellow })
call s:h("jsGlobalObjects", { "fg": s:yellow })
call s:h("jsImport", { "fg": s:purple })
call s:h("jsModuleAs", { "fg": s:purple })
call s:h("jsModuleWords", { "fg": s:purple })
call s:h("jsModules", { "fg": s:purple })
call s:h("jsNull", { "fg": s:dark_yellow })
call s:h("jsOperator", { "fg": s:purple })
call s:h("jsStorageClass", { "fg": s:purple })
call s:h("jsSuper", { "fg": s:red })
call s:h("jsTemplateBraces", { "fg": s:dark_red })
call s:h("jsTemplateVar", { "fg": s:green })
call s:h("jsThis", { "fg": s:red })
call s:h("jsUndefined", { "fg": s:dark_yellow })
" https://github.com/othree/yajs.vim
call s:h("javascriptArrowFunc", { "fg": s:purple })
call s:h("javascriptClassExtends", { "fg": s:purple })
call s:h("javascriptClassKeyword", { "fg": s:purple })
call s:h("javascriptDocNotation", { "fg": s:purple })
call s:h("javascriptDocParamName", { "fg": s:blue })
call s:h("javascriptDocTags", { "fg": s:purple })
call s:h("javascriptEndColons", { "fg": s:white })
call s:h("javascriptExport", { "fg": s:purple })
call s:h("javascriptFuncArg", { "fg": s:white })
call s:h("javascriptFuncKeyword", { "fg": s:purple })
call s:h("javascriptIdentifier", { "fg": s:red })
call s:h("javascriptImport", { "fg": s:purple })
call s:h("javascriptMethodName", { "fg": s:white })
call s:h("javascriptObjectLabel", { "fg": s:white })
call s:h("javascriptOpSymbol", { "fg": s:cyan })
call s:h("javascriptOpSymbols", { "fg": s:cyan })
call s:h("javascriptPropertyName", { "fg": s:green })
call s:h("javascriptTemplateSB", { "fg": s:dark_red })
call s:h("javascriptVariable", { "fg": s:purple })

" JSON
call s:h("jsonCommentError", { "fg": s:white })
call s:h("jsonKeyword", { "fg": s:red })
call s:h("jsonBoolean", { "fg": s:dark_yellow })
call s:h("jsonNumber", { "fg": s:dark_yellow })
call s:h("jsonQuote", { "fg": s:white })
call s:h("jsonMissingCommaError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonNoQuotesError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonNumError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonString", { "fg": s:green })
call s:h("jsonStringSQError", { "fg": s:red, "gui": "reverse" })
call s:h("jsonSemicolonError", { "fg": s:red, "gui": "reverse" })

" Markdown (keep consistent with HTML, above)
call s:h("markdownBlockquote", { "fg": s:comment_grey })
call s:h("markdownBold", { "fg": s:dark_yellow, "gui": "bold", "cterm": "bold" })
call s:h("markdownBoldItalic", { "fg": s:green, "gui": "bold,italic", "cterm": "bold,italic" })
call s:h("markdownCode", { "fg": s:green })
call s:h("markdownCodeBlock", { "fg": s:green })
call s:h("markdownCodeDelimiter", { "fg": s:green })
call s:h("markdownH1", { "fg": s:red })
call s:h("markdownH2", { "fg": s:red })
call s:h("markdownH3", { "fg": s:red })
call s:h("markdownH4", { "fg": s:red })
call s:h("markdownH5", { "fg": s:red })
call s:h("markdownH6", { "fg": s:red })
call s:h("markdownHeadingDelimiter", { "fg": s:red })
call s:h("markdownHeadingRule", { "fg": s:comment_grey })
call s:h("markdownId", { "fg": s:purple })
call s:h("markdownIdDeclaration", { "fg": s:blue })
call s:h("markdownIdDelimiter", { "fg": s:purple })
call s:h("markdownItalic", { "fg": s:purple, "gui": "italic", "cterm": "italic" })
call s:h("markdownLinkDelimiter", { "fg": s:purple })
call s:h("markdownLinkText", { "fg": s:blue })
call s:h("markdownListMarker", { "fg": s:red })
call s:h("markdownOrderedListMarker", { "fg": s:red })
call s:h("markdownRule", { "fg": s:comment_grey })
call s:h("markdownUrl", { "fg": s:cyan, "gui": "underline", "cterm": "underline" })

" Perl
call s:h("perlFiledescRead", { "fg": s:green })
call s:h("perlFunction", { "fg": s:purple })
call s:h("perlMatchStartEnd",{ "fg": s:blue })
call s:h("perlMethod", { "fg": s:purple })
call s:h("perlPOD", { "fg": s:comment_grey })
call s:h("perlSharpBang", { "fg": s:comment_grey })
call s:h("perlSpecialString",{ "fg": s:dark_yellow })
call s:h("perlStatementFiledesc", { "fg": s:red })
call s:h("perlStatementFlow",{ "fg": s:red })
call s:h("perlStatementInclude", { "fg": s:purple })
call s:h("perlStatementScalar",{ "fg": s:purple })
call s:h("perlStatementStorage", { "fg": s:purple })
call s:h("perlSubName",{ "fg": s:yellow })
call s:h("perlVarPlain",{ "fg": s:blue })

