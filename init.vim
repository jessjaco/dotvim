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
  silent execute "!git clone https://github.com/gmarik/vundle " . s:editor_root . "/bundle/vundle"
  let vundle_installed=0
endif

let &rtp=&rtp . ',' . s:editor_root . '/bundle/vundle'
call vundle#rc(s:editor_root . '/bundle')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'jalvesaq/Nvim-R'
Plugin 'ervandew/screen'

" linter
" Also may need to install specific programs, e.g. jshint
Plugin 'dense-analysis/ale'

" Markdown tools
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'vim-pandoc/vim-rmarkdown'
Plugin 'gabrielelana/vim-markdown'

" Ctrl-P to preview md in browser
Plugin 'JamshedVesuna/vim-markdown-preview'

Plugin 'godlygeek/tabular'
Plugin 'sukima/xmledit'
Plugin 'flazz/vim-colorschemes'

" Python
Plugin 'numirias/semshi'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'ambv/black'

" Javascript specific stuff
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'

" *s (s for surroundings)
" ds' <- removes single quotes
" cs'" <- changes single quotes to double
" ys e.g ysiw) 'you surround' selection (here, iw) with character (here ')')
Plugin 'tpope/vim-surround'

" Tab completion (not working???)
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim'

" For stan
Plugin 'maverickg/stan.vim'

" Homebrew fzf
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'

" Status line
Plugin 'itchyny/lightline.vim'

" netrw replacement
Plugin 'scrooloose/nerdtree'

" HTML macros
Plugin 'mattn/emmet-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Global options
set showcmd "Show partial command in status line
set shiftwidth=2 " Number of spaces for each level of indent
set expandtab " Use spaces when you press tab
set tabstop=2 " Number of spaces for each tab
set smarttab " Not sure, was in sensible.vim
set ruler " Tells us where the cursor is
set wildmenu " Helps with wildcard expansion
set cc=80 " Make column 80 red
set nohlsearch " Turn off annoying highlighting when searching

" enable syntax highlighting
syntax enable

" turn titlebar on and have display current working directory
set title
set titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')}


" CSS
autocmd FileType css set omnifunc=csscomplete#CompleteCSS " turn on native completion
autocmd FileType css let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" HTMl
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags " turn on native completion
autocmd FileType html let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" Make options
" make needs tabs
autocmd FileType make setlocal noexpandtab softtabstop=0

" python options
autocmd FileType python setlocal shiftwidth=4 tabstop=4

" R options
" Hard wrap comments only at 80 columns, and start the next line with a
" comment character
autocmd FileType r setlocal tw=80 formatoptions-=t formatoptions+=arqrwj
" Try to remap _ remapping to ;
let R_assign_map = ";"
"let R_assign = 0 " Turn off '_' to '<-' mapping
let R_in_buffer = 0

" Pandoc options
" Hard wrap at 80 for "pandoc" documents plus some "smartyness"
let g:pandoc#formatting#mode="h"
let g:pandoc#spell#enabled=0
" lets inline r commands in rmd files extend lines.
au CursorMovedI *.rmd call ModifyTextWidth() " Use only within *.md files

" for markdown plugin (not using pandoc, at least for now)
autocmd FileType markdown setlocal tw=80 formatoptions-=t formatoptions+=arqrwj

function! ModifyTextWidth()
    if getline(".")=~'^.*`r.*$'
        setlocal textwidth=500
    else
        setlocal textwidth=80 " Otherwise use normal textwidth
    endif
endfunction

" Xml options
" For indenting xml correctly
map <F2><Esc>:1,$!xmllint --format -<CR>

" Set colorscheme, should look fine if terminal is reported as 256 color
" To check 'echo $TERM'. Haven't checked windows yet
" Makes the background black instead of some kinda gray
let g:jellybeans_overrides = { 'background': { 'guibg': '000000' }, }
colorscheme jellybeans
highlight ColorColumn term=reverse ctermbg=232 guibg=232

" All of these need to be installed on your system.
"
" If you don't like pylint's error about constants not being UPPERCASE,
" generate ~/.pylintrc via pyline --generate-rcfile > ~/.pylintrc then read
" through it.
"
" pylint requires pyline python package
" mypy requires mypy python package
" lintr requires lintr R package
let b:ale_linters = ['jshint', 'flake8', 'pylint', 'mypy', 'lintr', 'yamllint']
let g:ale_python_flake8_options = '--max-line-length=88'

"
" black requires black python package
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'], 'python': ['black'], 'r': ['styler'], 'javascript': ['prettier'], 'html': ['prettier'] }
let g:ale_fix_on_save = 1

" toggle file chooser
map <C-o> :NERDTreeToggle<CR>
