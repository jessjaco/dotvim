source ~/vimfiles/bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect('~/vimfiles/bundle/{}')
set nocompatible
set smartindent
set shiftwidth=2
set expandtab
set tabstop=2
set cc=80
syntax enable
filetype plugin on
filetype indent on
" For indenting xml correctly
map <F2><Esc>:1,$!xmllint --format -<CR>
" This _should_ work everywhere
let g:pydiction_location = '~\vimfiles\bundle\pydiction\complete-dict'

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

