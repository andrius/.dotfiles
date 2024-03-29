" environment variables
let g:ssh_user=$LC_SSH_USER
let g:vim_user=$USER

" Leader mapping here does not working right
" let g:mapleader=",

map <Leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
map <LocalLeader>te :tabedit <c-r>=expand("%:p:h")<cr>/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
" wombat etc, check https://github.com/itchyny/lightline.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline={
     \ 'colorscheme': 'PaperColor',
     \ 'active': {
     \   'left': [ ['mode', 'paste'],
     \             ['fugitive', 'readonly', 'filename', 'modified'] ],
     \   'right': [ [ 'lineinfo' ], ['percent'] ]
     \ },
     \ 'component': {
     \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
     \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
     \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
     \ },
     \ 'component_visible_condition': {
     \   'readonly': '(&filetype!="help"&& &readonly)',
     \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
     \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
     \ },
     \ 'separator': { 'left': ' ', 'right': ' ' },
     \ 'subseparator': { 'left': ' ', 'right': ' ' }
     \ }

" let g:lightline = {
"      \ 'colorscheme': 'snazzy',
"      \ }

let g:lightline = { 'colorscheme': 'challenger_deep'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => airline
" https://github.com/vim-airline/vim-airline-themes
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
" let g:airline#extensions#vista#enabled = 1

" let g:airline_theme='atomic'
" let g:airline_theme='badwolf'
" let g:airline_theme='silver'
" let g:airline_theme='ayu_mirage'
let g:airline_theme='ayu_dark'
" let g:airline_theme='tomorrow'
" let g:airline_theme='papercolor'
" let g:airline_theme='oceanicnext'
" let g:airline_theme='bubblegum'
" let g:airline_theme='cobalt2'
" let g:airline_theme='sol'
" let g:airline_theme='solarized'

let g:tmuxline_powerline_separators=1
" let g:tmuxline_separators={
"    \ 'left' : '',
"    \ 'left_alt': '',
"    \ 'right' : '',
"    \ 'right_alt' : '',
"    \ 'space' : ' '}

" " To disable extensions, uncomment following line:
" let g:airline_extensions = []

let g:airline_theme = get(g:, 'airline_theme', 'dark')
if exists('*airline#themes#{g:airline_theme}#refresh')
  call airline#themes#{g:airline_theme}#refresh()
endif

let g:airline_powerline_fonts=1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled=1
" show buffer number
let g:airline#extensions#tabline#buffer_nr_show=1

" Show just the filename
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#whitespace#enabled=1

" show git branch
let g:airline#extensions#branch#enabled=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Custom UI and colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:PaperColor_Theme_Options = {
     \   'theme': {
     \     'default': {
     \       'transparent_background': 0
     \     }
     \   }
     \ }

let g:oceanic_next_terminal_bold=1
let g:oceanic_next_terminal_italic=1

" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme

let g:solarized_visibility="high" " one of "normal" (default), "low", "high";
let g:solarized_diffmode="high"   " one of "normal" (default), "low", "high";
let g:solarized_termtrans=1         " make terminal background transparent if set to 1 (default: 0);

" The following options were not available in the original Solarized:

let g:solarized_statusline="normal" " one of "normal" (default), "low" or "flat";
" let g:solarized_italics=1           " set to 0 to suppress italics (default is 1).
" let g:solarized_old_cursor_style=0  " set to 1 if you want to use the original Solarized's cursor style (default: 0). By default, the cursor is orange/red in light themes, and blue in dark themes (but please note that your terminal may override the cursor's color).
" let g:solarized_use16=0             " set to 1 to force using your 16 ANSI terminal colors.
" let g:solarized_extra_hi_groups=0   " set to 1 to enable Solarized filetype-specific syntax highlighting groups (default is 0). Please be aware that there is a long standing issue with syntax items defined in color schemes.

set background=dark
" set background=light
" colorscheme hemisu
" colorscheme noctu
" colorscheme PaperColor
" colorscheme OceanicNext
" colorscheme OceanicNextLight
" colorscheme peaksea
colorscheme ayu
" colorscheme onehalflight
" colorscheme github
" colorscheme solarized8_high " high-contrast variant
" colorscheme solarized8      " the default Solarized theme
" colorscheme solarized8_low  " low-contrast variant
" colorscheme solarized8_flat " flat variant
" colorscheme summerfruit256
" colorscheme PaperColor
" colorscheme tokyonight
" colorscheme challenger_deep

if vim_user == 'ak'
  " set background=light
  " colorscheme onehalflight
  " colorscheme github
  " let ayucolor="light"
  " colorscheme ayu
  " let g:SnazzyTransparent=1
  " colorscheme snazzy
  " colorscheme PaperColor
  " colorscheme solarized8_high
endif

if ssh_user == 'andrius'
  " set background=light
  " colorscheme onehalflight
  " colorscheme github
  " let ayucolor="light"
  " colorscheme ayu
  " let g:SnazzyTransparent=1
  " colorscheme snazzy
  " colorscheme PaperColor
  " colorscheme solarized8_high
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Customisation of rafi vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if dein#tap('caw.vim')
  function! InitCaw() abort
    if ! &l:modifiable
      silent! nunmap <buffer> <Leader>V
      silent! xunmap <buffer> <Leader>V
      silent! nunmap <buffer> <Leader>v
      silent! xunmap <buffer> <Leader>v
      silent! nunmap <buffer> gc
      silent! xunmap <buffer> gc
      silent! nunmap <buffer> gcc
      silent! xunmap <buffer> gcc
    else
      xmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
      nmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
      xmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
      nmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
      nmap <buffer> gc <Plug>(caw:hatpos:toggle)
      xmap <buffer> gc <Plug>(caw:hatpos:toggle)
      nmap <buffer> gcc <Plug>(caw:prefix)
      xmap <buffer> gcc <Plug>(caw:prefix)
    endif
  endfunction
  " autocmd MyAutoCmd FileType * call InitCaw()
  autocmd user_events FileType * call InitCaw()
  call InitCaw()
endif

" Remove trailing whitespace on write
autocmd BufWritePre * %s/\s\+$//e

" " shift+arrow selection
" nmap <silent> <S-Up> :TmuxNavigateUp<cr>
" nmap <silent> <S-Down> :TmuxNavigateDown<cr>
" nmap <silent> <S-Left> :TmuxNavigateLeft<cr>
" nmap <silent> <S-Right> :TmuxNavigateRight<cr>

" Load user custom local settings
if filereadable(expand('$VIMPATH/config/user.vim'))
  call s:source_file('user.vim')
endif

set termguicolors
" " Disable termguicolors for mosh sessions
" let mosh_session=$LC_MOSH_SESSION
" if mosh_session == ''
"   set termguicolors
" else
"   set termguicolors!
" endif

" This should work with ojroques/vim-oscyank, check local.plugins.yaml
if exists('##TextYankPost')
  set clipboard& clipboard^=unnamed,unnamedplus
  " augroup BlinkClipboardIntegration
  "   autocmd!
  "   " autocmd TextYankPost * silent! if v:event.operator ==# 'y' | call OSCYankReg(join(v:event["regcontents"],"\n")) | endif
	"   " autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | OSCYankReg join(+, "\n") | endif
	"   autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '+' | OSCYank join(v:event["regcontents"], "\n") | endif
  " augroup END
	autocmd TextYankPost * if v:event.operator is 'y' && v:event.regname is '' | execute 'OSCYankRegister "' | endif
endif

autocmd BufNewFile,BufRead *.cr set syntax=crystal filetype=crystal

" cmd - backspace as ÿ (0xFF) mapped with blink
inoremap <Char-0xFF> <Delete>

" vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
