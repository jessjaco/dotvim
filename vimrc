" Use pathogen. Other people seem to use other stuff now, but I havent had a 
" chance to figure out why
source ~/vimfiles/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect('~/vimfiles/bundle/{}')

" Don't make vim compatible with vi
set nocompatible

" For indenting newlines in a reasonable way
set smartindent

" Number of spaces for each level of indent
set shiftwidth=2

" Use spaces when you press tab
set expandtab

" Number of spaces for each tab
set tabstop=2

" Make column 80 red
set cc=80

" enable syntax highlighting
syntax enable

" enable filetype detection 
filetype plugin on
filetype indent on

" Hard wrap at 80 for "pandoc" documents plus some "smartyness"
let g:pandoc#formatting#mode="h"

" For indenting xml correctly
map <F2><Esc>:1,$!xmllint --format -<CR>

" Set location of pydiction (autocomplete plugin for python) file
" This _should_ work everywhere
let g:pydiction_location = '~\vimfiles\bundle\pydiction\complete-dict'

" Set window size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=60 columns=90
else
  " This is console Vim.
  if exists("+lines")
    set lines=35
  endif
  if exists("+columns")
    set columns=90
  endif
endif

