set nocompatible	" be iMproved

" ---------- My Plugins ----------------------------------
"Plug 'majutsushi/tagbar'
"Plug 'atom/fuzzy-finder'
"Plug 'digitaltoad/vim-jade'
"Plug 'kchmck/vim-coffee-script'
"Plug 'jcf/vim-latex'

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'     " Auto closes brackets and stuff
" Plug 'scrooloose/syntastic'     " Syntax checker
Plug 'python/black'             
Plug 'w0rp/ale'                 " ALE syntax checker
Plug 'vim-scripts/taglist.vim'  " source code browser READ MANUAL!
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " Fuzzy Finder
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'   " see diffs next to line number
Plug 'tmhedberg/SimpylFold'     " Python code block folding
Plug 'vim-airline/vim-airline'  " Pimp the status bar
" Plug 'davidhalter/jedi-vim'     " Python autocompletion & goto
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'tpope/vim-fugitive'       " Git helpers like blame..

call plug#end()


syntax on " Enables syntax processing in vim
filetype plugin indent on	" enables filetype detection
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.ract set filetype=html


" --------- Colours and schemes --------------------------
colorscheme badwolf

" --------- Indentation and formatting ------------------
set autoindent		" Copy indent from previous line
set smartindent		" Smart autoindenting 
set smarttab		  " <tab> depends on value of shiftwidth
set expandtab		  " Insert spaces for tab in insert mode
set nowrap		    " Don't wrap lines longer than width of window
set scrolloff=5		" Minimal number of lines above/below cursor on scrolling
set tabstop=2		  " Number of visual spaces a <Tab> counts for
set softtabstop=2	" Number of visual spaces a <Tab> counts for whilst editing
set shiftwidth=2	" Number of space the shift (>>, <<) commands uses

" -------- ALE Syntax Checker ------------------------------
let g:ale_python_black_options = "--line-length=99"

" -------- UI & General Settings ----------------------------
set number 			" Turn on numbers
set ruler				" Show line and column
set rnu         " Relative line numbers
set mouse=a			" Enable mouse scrolling, pane selection
set directory=~/.vim/swapfiles//	" Set swapfile location outside wd
set showcmd     " show last command in bottom right"
set cursorline  " highlught line of cursor
set showmatch   " highlight matching paranthesis
set bs=2        " Set backspace so delete key works in insert mode
set colorcolumn=99

" -------- Search settings ----------------------------
set hlsearch		" Highlight all matches of a search
" nnoremap  <leader><space> :nohlsearch<CR> " leader key is \"
set incsearch		" Show matches whilst searching
set ignorecase		" Ignore case of normal letters

" Use rg for the :grep program (as it's faster than ag)
"   * use "-t html" to only search one filetype
"   * use "-w" to match on word boundaries
if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif

" Search codebase for word under cursor (v useful)
nnoremap gw :grep <cword> . <CR>


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
