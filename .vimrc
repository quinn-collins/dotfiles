
" Quinn Collins Vimrc configuration
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""
let mapleader = " "
" Basic
set encoding=UTF-8
set mouse=n
set backspace=indent,eol,start
set confirm
set foldmethod=indent
set nofoldenable
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
set hlsearch
set incsearch

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
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
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

"Polyglot
let g:polyglot_disabled = ['markdown.plugin']

" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" fzf
set rtp+=/usr/local/opt/fzf " homebrew
" source /usr/share/doc/fzf/examples/fzf.vim " apt
""""""""""""""""""""""""""""""""""
" Key Remaps
""""""""""""""""""""""""""""""""""
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
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


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
