set nocompatible	" be iMproved

" ---------- My Plugins ----------------------------------
"Plug 'majutsushi/tagbar'
"Plug 'atom/fuzzy-finder'
"Plug 'digitaltoad/vim-jade'
"Plug 'kchmck/vim-coffee-script'
"Plug 'jcf/vim-latex'

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'Raimondi/delimitMate'            " Auto closes brackets and stuff
Plug 'python/black'             
Plug 'w0rp/ale'                       " ALE syntax checker
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' } " Fuzzy Finder
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'         " see diffs next to line number
" Plug 'tmhedberg/SimpylFold'           " Python code block folding
" Plug 'vim-airline/vim-airline'        " Pimp the status bar
Plug 'tpope/vim-fugitive'             " Git helpers like blame..
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'davidhalter/jedi-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jdsimcoe/abstract.vim'
" Plug 'ludovicchabant/vim-gutentags'   " Depends on exhuberant ctags installed on system
" Plug 'vim-scripts/taglist.vim'        " source code browser READ MANUAL!
Plug 'terryma/vim-smooth-scroll'        " Smooth scrolling up and down the buffer
Plug 'SirVer/ultisnips'                 " Snippet expander
Plug 'honza/vim-snippets'               " ??

" Plug 'ycm-core/YouCompleteMe'           " Text completion TODO GET THIS


call plug#end()

" Edit & source vimrc shortcuts
nmap <leader>ev :tabe ~/.vimrc<cr>
nmap <leader>sv :source ~/.vimrc<cr>
map <Space> <Leader>

syntax on " Enables syntax processing in vim
filetype plugin indent on	" enables filetype detection
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.ract set filetype=html


" --------- Colours and schemes --------------------------
colorscheme abstract
set background=dark

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
set foldmethod=indent " Works well for python. Maybe set ft rule at some point


" -------- Syntax & Static Analysis ------------------------------
let g:ale_python_black_options = "--line-length=99"
" let g:airline#extensions#coc#enabled = 1
"let g:ale_python_isort_executable = '~/scripts/docker-isort.sh'
"let g:ale_python_isort_use_global = 1

" -------- UI & General Settings ----------------------------
set number 			    " Turn on numbers
set ruler				    " Show line and column
set rnu             " Relative line numbers
set mouse=a			    " Enable mouse scrolling, pane selection
set showcmd         " show last command in bottom right"
set cursorline      " highlught line of cursor
set showmatch       " highlight matching paranthesis
set bs=2            " Set backspace so delete key works in insert mode
set colorcolumn=99
set cmdheight=1     " Size of command window.
set splitbelow      " Always open new horizontal split at beneath
set splitright      " Always open new vertical split on the right"
set title           " set tab name to file name
set laststatus=2    " Always show file name in status bar. Even if one buffer open

" Drop the w for moving between windows and tabs
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" shift h and shift l to cycle tabs!
nnoremap H gT
nnoremap L gt

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 15, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 15, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 15, 2)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 15, 2)<CR>

" -------- Text Editing -----------------------------------
" Copy and cut
vmap <leader>c "*y
nmap <leader>yy "+yy"

" Renane variable
nnoremap <leader>rn :%s/<C-R><C-W>/

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<A-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"--------- Files & Buffers -------------------------------
set autoread                      " Set to autoread a file when it is changed from the outside
" au CursorHold,CursorHoldI * checktime " Run checktime to auroread when cursor still for a few secs
set directory=~/.vim/swapfiles//	" Set swapfile location outside wd
set hidden                        " Don't have to save or discrad to hide the buffer
set updatetime=300                " Time before changes are written to disk 

" TODO shortcut for ':!mkdir -p %:h' which will create intermediate dirs afte :e

" -------- Navigation & Search settings ----------------------------
set hlsearch		" Highlight all matches of a search
nnoremap  <leader><bs> :nohlsearch<CR> 
set incsearch		" Show matches whilst searching
set ignorecase		" Ignore case of normal letters

" pull <cword> onto search/command line
" nnoremap <leader> cw "*yiw
nnoremap sw /<C-R><C-W>/<CR>
nnoremap fw :Rg <C-R><C-W><CR>

let g:fzf_layout = { 'down': '~30%' }
" let g:fzf_layout = { 'layout': 'reverse'}
let g:fzf_buffers_jump = 1 " Jump to existing buffer if open (I think)

" Run :Rg! (with bang) and get full screen with preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Run :Files! to get fullscreen + preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" Add ctrl-q to build quick fix list
let g:fzf_action = {
 \ 'ctrl-q': function('s:build_quickfix_list'),
 \ 'ctrl-t': 'tab split',
 \ 'ctrl-x': 'split',
 \ 'ctrl-v': 'vsplit' }

" Use rg for the :grep program (as it's faster than ag)
"   * use "-t html" to only search one filetype
"   * use "-w" to match on word boundaries
if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif


" Map keys for go-to definition, go-to reference.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Map keys to search files, history and lines in file
nmap <leader>f :Files<CR>      
nmap <leader>h :History<CR>
nmap <leader>l :BLines<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>rg :Rg 
nmap <leader>t :Tags 
nmap <leader>d :BTags <CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! TestCurrent()
  execute("!clear && " . expand("%p") . <C-R><C-W>)
endfunction
" ------------- Functions -----------------------------
map <leader>rt :call TestCurrent() <CR>

function! RunISort() abort 
    try
        let b:ale_fixers={'python': ['isort',]}
        ALEFix
    finally
        unlet b:ale_fixers
    endtry
endfunction

command! RunISort call RunISort()
