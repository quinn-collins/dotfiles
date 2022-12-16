"""""""""""""""""""""""""""""""""""
" Quinn Collins Vimrc configuration
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""
let mapleader = " "
" Basic
set nocompatible
set encoding=UTF-8
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
colorscheme nord
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'FugitiveHead'
      \ },
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

" coc.nvim
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

"" Function for lightline
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

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
