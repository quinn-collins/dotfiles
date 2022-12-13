"""""""""""""""""""""""""""""""""""
" Quinn Collins Vimrc configuration
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""
" Basic
set nocompatible
set encoding=utf8
set mouse=a
set backspace=indent,eol,start
set confirm
filetype indent plugin on

" Indentation
set tabstop=2
set shiftwidth=2
set expandtab

" Gui
syntax on
set laststatus=2
set cursorline
set nowrap
set ruler
set number

" Search
set ignorecase
set smartcase

" Enable Elite mode, no arrows
let g:elite_mode=1

""""""""""""""""""""""""""""""""""
" Theme and Styling
""""""""""""""""""""""""""""""""""

set termguicolors
set noshowmode
colorscheme gruvbox8
set background=dark
let g:lightline = {
    \ 'colorscheme': 'seoul256',
    \ }


""""""""""""""""""""""""""""""""""
" Functions
""""""""""""""""""""""""""""""""""
" Disable arrow movement, resize splits instead.
if get(g:, 'elite_mode')
    nnoremap <Up>     :resize +2<CR>
    nnoremap <Down>   :resize -2<CR>
    nnoremap <Left>   :vertical resize +2<CR>
    nnoremap <Right>  :vertical resize -2<CR>
endif

""""""""""""""""""""""""""""""""""
" Plugin Config
""""""""""""""""""""""""""""""""""

" Ale
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
let g:ale_fix_on_save = 1

"Polyglot
let g:polyglot_disabled = ['markdown.plugin']

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" fzf
set rtp+=/usr/local/opt/fzf
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-s': 'vsplit' }
""""""""""""""""""""""""""""""""""
" Key Remaps
""""""""""""""""""""""""""""""""""
let mapleader = " "
nnoremap <SPACE> <Nop>
imap jk <Esc>
nmap fg <C-z>
nmap <leader>wl <C-w>l
nmap <leader>wh <C-w>h
nmap <leader>wk <C-w>k
nmap <leader>wj <C-w>j
nnoremap j jzz
nnoremap k kzz
vnoremap j jzz
vnoremap k kzz
nnoremap n nzz
nnoremap N Nzz
nmap <leader>ww <C-w><C-x>
nnoremap <C-j> <esc>:m .+1<cr>==
nnoremap <C-k> <esc>:m .-2<cr>==
inoremap <C-j> <esc>:m .+1<cr>==gi
inoremap <C-k> <esc>:m .-2<cr>==gi

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" FZF
nnoremap <leader>f :FZF<CR>

" YCM
nmap <leader>y <plug>(YCMHover)

" ALE
nnoremap <leader>an :ALENext <cr>
nnoremap <leader>aN :ALEPrevious <cr>
