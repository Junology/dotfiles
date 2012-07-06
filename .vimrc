set nocompatible
set number
set browsedir=buffer
set backupdir=~/.vimbackup
set clipboard=unnamed
set showmatch
set smartcase
set whichwrap=b,s,h,l,<,>,[,]

set laststatus=2

set autoindent
set smartindent
set tabstop<
set expandtab
set softtabstop=4
set shiftwidth=4
set list

au BufEnter * execute ":lcd " . expand("%:p:h")

let skk_jisyo='~/.skk-jisyo'
let skk_large_jisyo='/usr/share/skk/SKK-JISYO.L'
let skk_auto_save_jisyo=1
let skk_keep_state=0
let skk_egg_like_newline=1
let skk_show_annotation=1
let skk_use_face=1


