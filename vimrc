" Don't make vim compatible with vi
set nocompatible

" Turn off filetype until Vundle is initialized
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'rkulla/pydiction'
Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'ervandew/screen'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'godlygeek/tabular'
Plugin 'sukima/xmledit'
Plugin 'jalvesaq/R-Vim-runtime'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" For indenting newlines in a reasonable way
set smartindent

" Number of spaces for each level of indent
set shiftwidth=2

" Use spaces when you press tab
set expandtab

" Number of spaces for each tab
set tabstop=2

" Not sure, was in sensible.vim
set smarttab

" Tells us where the cursor is 
set ruler

" Shows command in lower right
set showcmd

" Helps with wildcard expansion
set wildmenu

" Make column 80 red
set cc=80

" enable syntax highlighting
syntax enable

" Set location of pydiction (autocomplete plugin for python) file
" This _should_ work everywhere
let g:pydiction_location = '~\vimfiles\bundle\pydiction\complete-dict'
"
" Hard wrap at 80 for "pandoc" documents plus some "smartyness"
let g:pandoc#formatting#mode="h"
let g:pandoc#spell#enabled=0

" For indenting xml correctly
map <F2><Esc>:1,$!xmllint --format -<CR>

" Options for R files - may be useful elsewhere. Hard wrap comments only at 80
" columns, and start the next line with a comment character
autocmd FileType r setlocal tw=80 formatoptions-=t formatoptions+=acqrow
" Use terminal R with vim-r-plugin
let vimrplugin_applescript = 0
" Try to remap _ remapping to ;
let vimrplugin_assign_map = ";"
"let vimrplugin_assign = 0

"
" make needs tabs
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" Set window size
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=60 columns=90
else
  " This is console Vim.
  if exists("+columns")
    set columns=90
  endif
endif

" Set colorscheme, should look fine if terminal is reported as 256 color 
" To check 'echo $TERM'. Haven't checked windows yet
colorscheme jellybeans

" syntastic recommended settings and lintr recommmended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_enable_r_lintr_checker = 0
"let g:syntastic_r_checkers = 0

" Hub specific options
if hostname() == "CSPHUB"
  let vimrplugin_r_path = 'C:\\Program Files\\R\\R-3.2.3\\bin\\x64'
endif 

