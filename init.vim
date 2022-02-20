set nocompatible

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
"  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
"       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" let Vundle manage Vundle, required
Plug 'jalvesaq/Nvim-R'
Plug 'ervandew/screen'

" linter
" Also may need to install specific programs, e.g. jshint
Plug 'dense-analysis/ale'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Markdown tools
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-rmarkdown'
Plug 'gabrielelana/vim-markdown'

" Ctrl-P to preview md in browser
Plug 'JamshedVesuna/vim-markdown-preview'

Plug 'godlygeek/tabular'
Plug 'sukima/xmledit'
Plug 'flazz/vim-colorschemes'

" Python
" Semantic highlighting (if having issues, then run :UpdateRemotePlugins)
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'Vimjas/vim-python-pep8-indent'
" Needs black python package (see ale section)
Plug 'ambv/black'
" To edit ipynb files, needs jupytext python package
Plug 'goerz/jupytext.vim'

" Javascript specific stuff
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" *s (s for surroundings)
" ds' <- removes single quotes
" cs'" <- changes single quotes to double
" ys e.g ysiw) 'you surround' selection (here, iw) with character (here ')')
Plug 'tpope/vim-surround'

" Tab completion (not working???)
" Plug 'ervandew/supertab'
" Plug 'davidhalter/jedi-vim'

" For stan
Plug 'maverickg/stan.vim'

" Homebrew fzf
set rtp+=/usr/local/opt/fzf
Plug 'junegunn/fzf.vim'

" Status line
Plug 'itchyny/lightline.vim'

" netrw replacement
Plug 'scrooloose/nerdtree'

" HTML macros
Plug 'mattn/emmet-vim'

" Recognize nunjucks, among others
Plug 'lepture/vim-jinja'

" All of your Plugins must be added before the following line
call plug#end()

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
" styler required styler R package
" prettier requires prettier node package
let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'python': ['black'], 'r': ['styler'], 'javascript': ['prettier'],
  \ 'html': ['prettier'], 'jinja': ['prettier']
  \ }
let g:ale_fix_on_save = 1

" See https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions
let g:coc_global_extensions = [
  \'coc-css', 'coc-html', 'coc-html-css-support', 'coc-json',
  \ 'coc-pyright', 'coc-r-lsp'
  \ ]

" toggle file chooser
map <C-o> :NERDTreeToggle<CR>

" Support comments in json
autocmd FileType json syntax match Comment +\/\/.\+$+
