set nocompatible
" Turn off filetype until Vundle is initialized
filetype off

" set the runtime path to include Vundle and initialize
if has('nvim')
  let s:editor_root=expand('~/.config/nvim')
else
  let s:editor_root=expand('~/vimfiles')
endif  


"Install vundle if not installed
let vundle_installed=1
let vundle_readme=s:editor_root . '/bundle/vundle/README.md'

if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent call mkdir(s:editor_root . 'bundle', "p")
  slient execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "bundle/vundle"
  let vundle_installed=0
endif  

let &rtp=&rtp . ',' . s:editor_root . '/bundle/Vundle'
call vundle#rc(s:editor_root . '/bundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'vim-scripts/Vim-R-plugin'
Plugin 'jalvesaq/Nvim-R'
Plugin 'ervandew/screen'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'godlygeek/tabular'
Plugin 'sukima/xmledit'
"Plugin 'jalvesaq/R-Vim-runtime' Do we need this?
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set showcmd "Show partial command in status line
set shiftwidth=2 " Number of spaces for each level of indent
set expandtab " Use spaces when you press tab
set tabstop=2 " Number of spaces for each tab
set smarttab " Not sure, was in sensible.vim
set ruler " Tells us where the cursor is 
set wildmenu " Helps with wildcard expansion
set cc=80 " Make column 80 red

" enable syntax highlighting
syntax enable

" Make options
" make needs tabs
autocmd FileType make setlocal noexpandtab shiftwidth=8 softtabstop=0

" Pandoc options
" Hard wrap at 80 for "pandoc" documents plus some "smartyness"
let g:pandoc#formatting#mode="h"
let g:pandoc#spell#enabled=0

" python options
autocmd FileType python setlocal shiftwidth=4 tabstop=4


" R options
" Hard wrap comments only at 80 columns, and start the next line with a 
" comment character
autocmd FileType r setlocal tw=80 formatoptions-=t formatoptions+=arqrwj
" Use terminal R with vim-r-plugin
let vimrplugin_applescript = 0
" Try to remap _ remapping to ;
let vimrplugin_assign_map = ";"
let R_assign_map = ";"
let vimrplugin_assign = 0


" Xml options
" For indenting xml correctly
map <F2><Esc>:1,$!xmllint --format -<CR>

" Set window size
"if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
"  set lines=60 columns=90
"else
  " This is console Vim.
"  if exists("+columns")
"    set lines=999 columns=90
"  endif
"endif

" Set colorscheme, should look fine if terminal is reported as 256 color 
" To check 'echo $TERM'. Haven't checked windows yet
colorscheme jellybeans

" syntastic recommended settings and lintr recommmended settings
" Caused some probs with neovim, just check these
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_r_lintr_checker = 0
let g:syntastic_r_checkers = 0

" Hub specific options
if hostname() == "CSPHUB"
  let vimrplugin_r_path = 'C:\\Program Files\\R\\R-3.2.3\\bin\\x64'
endif 

