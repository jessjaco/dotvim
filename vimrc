"if hostname() == 'CSPHUB'
"    let PPDIR = $APDIR . '\Portable Python 2.7.2.1\App'
"    let $PATH .= ';' . PPDIR
"    let $PYTHONPATH .= ';' .  PPDIR . '\Lib'
"endif 

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set nocompatible
set smartindent
set shiftwidth=4
set expandtab
set tabstop=4
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
  set lines=999 columns=100
else
  " This is console Vim.
  if exists("+lines")
    set lines=50
  endif
  if exists("+columns")
    set columns=100
  endif
endif

