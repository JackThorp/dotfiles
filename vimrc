set nocompatible	" be iMproved
filetype off		" required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"let vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" ---------- My Plugins ----------------------------------
Plugin 'majutsushi/tagbar'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/syntastic'
Plugin 'digitaltoad/vim-jade'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-scripts/taglist.vim'

call vundle#end()

syntax on
filetype plugin indent on	" required!

" --------- Colours and schemes --------------------------
 
colorscheme molokai
let g:molokai_original = 1

set t_ut= 
set t_Co=256

" --------- Indentation and formatting ------------------

set autoindent		" Copy indent from previous line
set smartindent		" Smart autoindenting 
set smarttab		" <tab> depends on value of shiftwidth
set expandtab		" Insert spaces for tab in insert mode
set nowrap		" Don't wrap lines longer than width of window
set scrolloff=5		" Minimal number of lines above/below cursor on scrolling
set tabstop=2		" Number of spaces a <Tab> counts for
set softtabstop=2	" Number of spaces a <Tab> counts for whilst editing
set shiftwidth=2	" Number of space the shift (>>, <<) commands uses


" -------- General Settings ----------------------------
set number 				" Turn on numbers
set ruler				" Show line and column
set mouse=a				" Enable mouse scrolling, pane selection
set directory=~/.vim/swapfiles//	" Set swapfile location outside wd


" -------- Search settings ----------------------------
set hlsearch		" Highlight all matches of a search
set incsearch		" Show matches whilst searching
set ignorecase		" Ignore case of normal letters
