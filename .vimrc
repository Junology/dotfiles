" Common settings even available in vim.tiny
set nocompatible

"encoding
set encoding=utf-8
scriptencoding utf-8 
set fileencoding=utf-8
set fileencodings=utf-8

filetype on
filetype plugin indent on

set number
set clipboard=unnamed
set browsedir=buffer
set showmatch
set smartcase
set whichwrap=b,s,h,l,<,>,[,]
set autoindent
set smartindent
set tabstop=4
set expandtab
set softtabstop=4
set shiftwidth=4
set list
set listchars=tab:\ \ ,eol:$

set laststatus=2 " always show status line
set statusline=%{mode()}:\ %<%f\ %h%m%r%=%-14.(%l/%L,%c%V%)\ [%{toupper(&ft)},%{&fileencoding}]
	
" Skip the following in vim.tiny
if 0 | endif

" Colorscheme
colorscheme slate
set background=dark

" syntax highlight
syntax on

" lightline.vim
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
