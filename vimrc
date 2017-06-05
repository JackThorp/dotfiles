set nocompatible	" be iMproved
" ---------- My Plugins ----------------------------------
"Plugin 'majutsushi/tagbar'
"Plugin 'tomasr/molokai'
"Plugin 'atom/fuzzy-finder'
"Plugin 'scrooloose/syntastic'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'kchmck/vim-coffee-script'
"Plugin 'vim-scripts/taglist.vim'
"Plugin 'jcf/vim-latex'
"Plugin 'scrooloose/nerdtree'

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'   " Auto closes brackets and stuff

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


" -------- UI & General Settings ----------------------------
set number 			" Turn on numbers
set ruler				" Show line and column
set mouse=a			" Enable mouse scrolling, pane selection
set directory=~/.vim/swapfiles//	" Set swapfile location outside wd
set showcmd     " show last command in bottom right"
set cursorline  " highlught line of cursor
set showmatch   " highlight matching paranthesis


" -------- Search settings ----------------------------
set hlsearch		" Highlight all matches of a search
nnoremap  <leader><space> :nohlsearch<CR> " leader key is \"
set incsearch		" Show matches whilst searching
set ignorecase		" Ignore case of normal letters

