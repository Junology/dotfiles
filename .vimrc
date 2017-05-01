" general settings
if &compatible
  set nocompatible
endif

set number
set browsedir=buffer
set backupdir=~/.vimbackup
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

syntax enable
filetype on
filetype plugin indent on

" ???
au BufEnter * execute ":lcd " . expand("%:p:h")

" Setting of skk.vim
set runtimepath+=$HOME/.vim/skk.vim
let skk_jisyo='~/.skk-jisyo'
let skk_large_jisyo='/usr/share/skk/SKK-JISYO.L'
let skk_auto_save_jisyo=1
let skk_keep_state=0
let skk_egg_like_newline=1
let skk_show_annotation=1
let skk_use_face=1

" vim2hs
set runtimepath+=$HOME/.vim/vim2hs

" syntastic
set runtimepath+=$HOME/.vim/syntastic

" vimproc
set runtimepath+=$HOME/.vim/vimproc.vim

" VimShell
set runtimepath+=$HOME/.vim/vimshell.vim

" idris-mode
set runtimepath+=$HOME/.vim/idris-vim

