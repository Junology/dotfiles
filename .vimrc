" Pathogen package manager
execute pathogen#infect()

" general settings
syntax on
filetype on
filetype plugin indent on

if &compatible
  set nocompatible
endif

set number
set browsedir=buffer
" set backupdir=~/.vimbackup
set clipboard=unnamed
set showmatch
set smartcase
set whichwrap=b,s,h,l,<,>,[,]

" set laststatus=2

set autoindent
set smartindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set list
set listchars=tab:\ \ ,eol:$

set laststatus=2 " show status line always

" lightline.vim and color scheme
if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
  \ 'component': {
  \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
  \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
  \ },
  \ 'component_visible_condition': {
  \   'readonly': '(&filetype!="help"&& &readonly)',
  \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
  \ }}

colorscheme hybrid
set background=dark " or light

" ???
au BufEnter * execute ":lcd " . expand("%:p:h")

" Setting of skk.vim
let skk_jisyo='~/.skk-jisyo'
let skk_large_jisyo='/usr/share/skk/SKK-JISYO.L'
let skk_auto_save_jisyo=1
let skk_keep_state=0
let skk_egg_like_newline=1
let skk_show_annotation=1
let skk_use_face=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim2hs
" syntastic
" vimproc
" VimShell
" idris-vim
"
