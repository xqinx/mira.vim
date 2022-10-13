" -----------------------------------------------------------------------------
" Name:           Mira
" Description:    Color scheme for BOOX Mira (e-ink) display
" Author:         xqinx
" Website:        https://github.com/xqinx/mira.vim
" License:        MIT
" -----------------------------------------------------------------------------

" Init: {{{
highlight clear
if exists("syntax_on")
 syntax reset
endif

let g:colors_name = 'mira'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif
" }}}
" Palette: {{{
let s:palette = {}

" values taken from https://www.ditig.com/256-colors-cheat-sheet
let s:palette.grey3 = [232, '#080808'] " rgb(8,8,8),hsl(0,0%,3%)
let s:palette.grey7 = [233, '#121212'] " rgb(18,18,18),hsl(0,0%,7%)
let s:palette.grey11 = [234, '#1c1c1c'] " rgb(28,28,28),hsl(0,0%,10%)
let s:palette.grey15 = [235, '#262626'] " rgb(38,38,38),hsl(0,0%,14%)
let s:palette.grey19 = [236, '#303030'] " rgb(48,48,48),hsl(0,0%,18%)
let s:palette.grey23 = [237, '#3a3a3a'] " rgb(58,58,58),hsl(0,0%,22%)
let s:palette.grey27 = [238, '#444444'] " rgb(68,68,68),hsl(0,0%,26%)
let s:palette.grey30 = [239, '#4e4e4e'] " rgb(78,78,78),hsl(0,0%,30%)
let s:palette.grey35 = [240, '#585858'] " rgb(88,88,88),hsl(0,0%,34%)
let s:palette.grey39 = [241, '#626262'] " rgb(98,98,98),hsl(0,0%,37%)
let s:palette.grey42 = [242, '#6c6c6c'] " rgb(108,108,108),hsl(0,0%,40%)
let s:palette.grey46 = [243, '#767676'] " rgb(118,118,118),hsl(0,0%,46%)
let s:palette.grey50 = [244, '#808080'] " rgb(128,128,128),hsl(0,0%,50%)
let s:palette.grey54 = [245, '#8a8a8a'] " rgb(138,138,138),hsl(0,0%,54%)
let s:palette.grey58 = [246, '#949494'] " rgb(148,148,148),hsl(0,0%,58%)
let s:palette.grey62 = [247, '#9e9e9e'] " rgb(158,158,158),hsl(0,0%,61%)
let s:palette.grey66 = [248, '#a8a8a8'] " rgb(168,168,168),hsl(0,0%,65%)
let s:palette.grey70 = [249, '#b2b2b2'] " rgb(178,178,178),hsl(0,0%,69%)
let s:palette.grey74 = [250, '#bcbcbc'] " rgb(188,188,188),hsl(0,0%,73%)
let s:palette.grey78 = [251, '#c6c6c6'] " rgb(198,198,198),hsl(0,0%,77%)
let s:palette.grey82 = [252, '#d0d0d0'] " rgb(208,208,208),hsl(0,0%,81%)
let s:palette.grey85 = [253, '#dadada'] " rgb(218,218,218),hsl(0,0%,85%)
let s:palette.grey89 = [254, '#e4e4e4'] " rgb(228,228,228),hsl(0,0%,89%)
let s:palette.grey93 = [255, '#eeeeee'] " rgb(238,238,238),hsl(0,0%,93%)
let s:palette.none = ['NONE', 'NONE'] " special name for transparent
let s:palette.slategrey2 = [87, '#5fffff'] " rgb(95,255,255),hsl(180,100%,68%)
let s:palette.plum2= [183, '#d7afff'] " rgb(215,175,255),hsl(270,100%,84%)
" }}}
" Mira Specific Gray Scale Settings: {{{
let s:fg0 = s:palette.grey3
let s:fg1 = s:palette.grey11
let s:fg2 = s:palette.grey19
let s:fg3 = s:palette.grey27
let s:fg4 = s:palette.grey39
let s:fg5 = s:palette.grey50

let s:bg0 = s:palette.grey93
let s:bg1 = s:palette.grey89
" let s:bg2 = s:palette.grey78
" slategrey2 gives a middle ground between dark and light with Mira settings to
" dark==6 and light==0
" and plum2 the same effect for dark==10 and light==0
" let s:bg2 = s:palette.slategrey2
let s:bg2 = s:palette.plum2
let s:bg3 = s:palette.grey70
let s:bg4 = s:palette.grey62
let s:bg5 = s:palette.grey54

let s:none = s:palette.none
" }}}
" Highlight Function: {{{
function! s:highlight(group, fg, bg, ...)
  " Arg: group, fg, bg, gui, guisp
  execute 'highlight' a:group
        \ 'ctermfg=' . a:fg[0]
        \ 'guifg=' . a:fg[1]
        \ 'ctermbg=' . a:bg[0]
        \ 'guibg=' . a:bg[1]
        \ 'cterm=' . (a:0 >= 1 ?
          \ a:1 :
          \ 'NONE')
        \ 'gui=' . (a:0 >= 1 ?
          \ a:1 :
          \ 'NONE')
        \ 'guisp=' . (a:0 >= 2 ?
          \ a:2[0] :
          \ 'NONE')
endfunction
" }}}

" Common Highlight Groups: {{{
call s:highlight('Normal', s:fg1, s:bg0)
call s:highlight('Terminal', s:fg1, s:none)
call s:highlight('Conceal', s:fg1, s:none, 'underline')
call s:highlight('Folded', s:fg4, s:bg0)
call s:highlight('NonText', s:fg4, s:none)
call s:highlight('MatchParen', s:fg1, s:bg0, 'reverse')
call s:highlight('Whitespace', s:fg3, s:none)
call s:highlight('SpecialKey', s:fg3, s:none)

call s:highlight('Visual', s:bg0, s:fg1)
call s:highlight('VisualNOS', s:fg1, s:bg2)

call s:highlight('ToolbarLine', s:fg3, s:none)
call s:highlight('ToolbarButton', s:fg3, s:bg2)
call s:highlight('FoldColumn', s:fg4, s:none)
call s:highlight('SignColumn', s:fg3, s:none)
call s:highlight('ColorColumn', s:none, s:bg0)
call s:highlight('LineNr', s:fg3, s:bg0)
call s:highlight('CursorLineNr', s:fg1, s:none)
" }}}
" Cursor: {{{
" call s:highlight('Cursor', s:fg1, s:bg0, 'reverse')
call s:highlight('Cursor', s:none, s:none, 'reverse')
highlight! link vCursor Cursor
highlight! link iCursor Cursor
highlight! link lCursor Cursor
highlight! link CursorIM Cursor
highlight! link TermCursor Cursor
call s:highlight('CursorLine', s:none, s:bg1)
call s:highlight('CursorColumn', s:none, s:bg2)
" Make insert mode cursor a block instead of a bar, which is hard to see
set guicursor=n-v-c-sm:block,i-ci-ve:block-iCursor-blinkoff500-blinkon500,r-cr-o:hor20
" }}}
" Status Line And Split: {{{
" call s:highlight('StatusLine', s:fg1, s:bg3)
" call s:highlight('StatusLineNC', s:bg0, s:bg4)
call s:highlight('StatusLine', s:bg0, s:fg3)
call s:highlight('StatusLineNC', s:bg0, s:fg4)
call s:highlight('VertSplit', s:fg4, s:none)
highlight! link WinSeparator VertSplit
call s:highlight('TabLine', s:bg1, s:fg1, 'reverse')
call s:highlight('TabLineFill', s:fg1, s:bg0)
call s:highlight('TabLineSel', s:bg0, s:fg2)
call s:highlight('QuickFixLine', s:fg1, s:none, 'italic')
" }}}
" Search: {{{
" set both to none such that it works with Cursor(also both set to none) in a
" way both of them can toggle the color, therefore easier to find where the
" cursor is in the highlighted word
call s:highlight('Search', s:none, s:none, 'reverse')
call s:highlight('IncSearch', s:fg4, s:none, 'reverse')
call s:highlight('Substitute', s:fg2, s:bg1)
" }}}
" Diff: {{{
call s:highlight('DiffAdd', s:fg1, s:bg0, 'bold')
call s:highlight('DiffChange', s:fg1, s:bg0, 'underline')
call s:highlight('DiffText', s:fg1, s:bg1, 'bold,italic,underline')
call s:highlight('DiffDelete', s:fg1, s:bg0, 'strikethrough')
" }}}
" Messages: {{{
call s:highlight('Directory', s:fg1, s:bg0, 'bold')
call s:highlight('ErrorMsg', s:fg1, s:bg0, 'bold,underline,reverse')
call s:highlight('WarningMsg', s:fg1, s:bg0, 'bold')
call s:highlight('ModeMsg', s:fg1, s:none, 'bold')
call s:highlight('MoreMsg', s:fg1, s:none)
call s:highlight('Question', s:fg1, s:bg0)
" }}}
" Popups: {{{
call s:highlight('Pmenu', s:fg1, s:bg0)
call s:highlight('PmenuSel', s:fg1, s:bg0, 'reverse')
highlight! link WildMenu PmenuSel
call s:highlight('PmenuSbar', s:bg0, s:bg3)
call s:highlight('PmenuThumb', s:bg0, s:bg3)
call s:highlight('NormalFloat', s:fg1, s:bg0)
" }}}
" Spell: {{{
call s:highlight('SpellBad', s:none, s:none, 'underline')
call s:highlight('SpellCap', s:none, s:none, 'underline')
call s:highlight('SpellLocal', s:none, s:none, 'underline')
call s:highlight('SpellRare', s:none, s:none, 'underline')
" }}}
" Syntax: {{{
call s:highlight('Comment', s:fg4, s:none, 'italic')
call s:highlight('Constant', s:fg1, s:none)
call s:highlight('Identifier', s:fg0, s:none, 'bold')
call s:highlight('Statement', s:none, s:none, 'bold')
call s:highlight('PreProc', s:none, s:none, 'italic')
call s:highlight('Type', s:none, s:none, 'bold')
call s:highlight('Special', s:none, s:bg0)
call s:highlight('Underlined', s:none, s:none, 'underline')
call s:highlight('Error', s:none, s:bg1, 'underline')
call s:highlight('Todo', s:fg0, s:bg2)
" }}}

" Customize fzf Colors: {{{
let g:fzf_colors =
            \ { 'fg':      ['fg', 'Normal'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
" }}}
