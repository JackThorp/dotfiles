set nocompatible	" be iMproved

" ---------- My Plugins ----------------------------------

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
" Plug 'iberianpig/ranger-explorer.vim'   " File explorer - requires ranger - maybe oneday
Plug 'dense-analysis/ale'           " ALE syntax checker
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all' } " Fuzzy Finder
Plug 'junegunn/fzf.vim'
Plug 'dbakker/vim-projectroot'
Plug 'airblade/vim-gitgutter'       " see diffs next to line number
" Plug 'vim-airline/vim-airline'    " Pimp the status bar
Plug 'tpope/vim-fugitive'           " Git helpers like blame..
Plug 'tpope/vim-rhubarb'            " Enables GBrowse
Plug 'davidhalter/jedi-vim'
Plug 'terryma/vim-smooth-scroll'    " Smooth scrolling up and down the buffer
"Plug 'SirVer/ultisnips'            " Snippet expander
"Plug 'honza/vim-snippets'          " ??
Plug 'JamshedVesuna/vim-markdown-preview'
" Colour themes
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'google/vim-searchindex'        " Gives a count of search results
Plug 'github/copilot.vim'

" Unused but maybe useful
" Plug 'ycm-core/YouCompleteMe'           " Text completion TODO GET THIS
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
" Plug 'Raimondi/delimitMate'            " Auto closes brackets and stuff
" Plug 'ludovicchabant/vim-gutentags'   " Depends on exhuberant ctags installed on system
" Plug 'vim-scripts/taglist.vim'        " source code browser READ MANUAL!
"Plug 'majutsushi/tagbar'
"Plug 'atom/fuzzy-finder'
"Plug 'digitaltoad/vim-jade'
"Plug 'kchmck/vim-coffee-script'
"Plug 'jcf/vim-latex'

call plug#end()

" Edit & source vimrc shortcuts
nmap <leader>ev :tabe ~/.vimrc<cr>
nmap <leader>sv :source ~u.vimrc<cr>
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let $FZF_DEFAULT_COMMAND='rg --hidden -l ""'
map <Space> <Leader>

syntax on " Enables syntax processing in vim
filetype plugin indent on	" enables filetype detection
au BufNewFile,BufRead *.es6 set filetype=javascript
au BufNewFile,BufRead *.ract set filetype=html


" --------- Colours and schemes --------------------------
colorscheme gruvbox
set background=dark

" --------- Indentation and formatting ------------------
set autoindent		" Copy indent from previous line
set smartindent		" Smart autoindenting 
set smarttab		  " <tab> depends on value of shiftwidth
set expandtab		  " Insert spaces for tab in insert mode
set nowrap		    " Don't wrap lines longer than width of window
set scrolloff=8		" Minimal number of lines above/below cursor on scrolling
set tabstop=2		  " Number of visual spaces a <Tab> counts for
set softtabstop=2	" Number of visual spaces a <Tab> counts for whilst editing
set shiftwidth=2	" Number of space the shift (>>, <<) commands uses
set foldmethod=indent " Works well for python. Maybe set ft rule at some point


" -------- Syntax & Static Analysis ------------------------------
let g:ale_linters = {"python": ["markdownlint", "ruff"]}
let g:ale_python_flake8_use_global = 1
let g:ale_linters_explicit = 1
let g:ale_lint_on_save = 1

let g:ale_fixers = {"python": ["ruff_format", "ruff"], 'javascript':['prettier'], 'css':['prettier']}
let g:ale_fix_on_save = 1
let g:ale_python_ruff_use_global = 1

let g:ale_python_ruff_format_options = ' --config '
    \ . shellescape(projectroot#get() . '/pyproject.toml')
" you can also use getcwd() instead of projectroot#get() if you always
" open files from the repo root

" let g:airline#extensions#coc#enabled = 1
" let g:airline#extensions#ale#enabled = 1
"autocmd BufWritePre *.py execute ':Black'
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=2

" -------- UI & General Settings ----------------------------
set number 			    " Turn on numbers
set ruler				    " Show line and column
"set rnu            " Relative line numbers
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

" Rename variable
nnoremap <leader>rn :%s/<C-R><C-W>/
" Copy file path. '+' is the clipboard register, @ enables register access
nnoremap <Leader>fp :let @+=expand('%:.')<CR>
"vnoremap <leader>p "_dP
" Copy entrire file to system clipboard
nnoremap <leader>Y gg"+yG
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

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

" Quickfix list shortcuts
noremap <C-j> :cn<CR>
noremap <C-k> :cp<CR>

" Clear the quick fix list!
function ClearQuickfixList()
  call setqflist([])
endfunction
command! ClearQuickfixList call ClearQuickfixList()
nmap <leader>cf :ClearQuickfixList<cr>

" -------- Navigation & Search settings ----------------------------
set hlsearch		" Highlight all matches of a search
nnoremap  <leader><bs> :nohlsearch<CR> 
set incsearch		" Show matches whilst searching
set ignorecase		" Ignore case of normal letters
nnoremap <leader>nt :NERDTree %<CR>

" pull <cword> onto search/command line
" nnoremap <leader> cw "*yiw
nnoremap sw /<C-R><C-W>/<CR>
nnoremap fw :Rg! <C-R><C-W><CR>

let g:fzf_layout = { 'down': '~30%' }
" let g:fzf_layout = { 'layout': 'reverse'}
let g:fzf_buffers_jump = 1 " Jump to existing buffer if open (I think)

" Run :Rg! (with bang) and get full screen with preview window
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --hidden --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Run :Files! to get fullscreen + preview
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'
let $FZF_DEFAULT_COMMAND='rg --hidden -l ""'

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
nmap <leader>f :Files!<CR>      
nmap <leader>h :History<CR>
nmap <leader>l :BLines<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>rg :Rg!
nmap <leader>t :Tags 
nmap <leader>d :BTags <CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" ------------- Git and version control --------------
nnoremap <leader>gd :Gvdiff!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
