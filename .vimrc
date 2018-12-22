"""""""""""""""""""""""""""""""""""
" Quinn Collins Vimrc configuration
"""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""
" Configuration Section
""""""""""""""""""""""""""""""""""

set nocompatible
set nowrap
set encoding=utf8
set mouse=a
syntax on
set backspace=indent,eol,start
set confirm

" Show linenumbers
set number
set ruler

" Set proper tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable Elite mode, no arrows
let g:elite_mode=1

" Enable highlighting of the current line
set cursorline

" search config
set ignorecase
set smartcase

""""""""""""""""""""""""""""""""""
" Theme and Styling
""""""""""""""""""""""""""""""""""

" ajh17/Spacegray
colorscheme spacegray

" itchyny/lightline 
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" ryanoasis/vim-devicons

" change cursorline highlight color
highlight cursorline ctermbg=235

""""""""""""""""""""""""""""""""""
" Programming
""""""""""""""""""""""""""""""""""

" pangloss/vim-javascript
let g:javascript_plugin_flow = 1

" mxw/vim-jsx
let g:jsx_ext_required = 0

" leshill/vim-json

""""""""""""""""""""""""""""""""""
" Utility 
""""""""""""""""""""""""""""""""""

" scrooloose/nerdtree

" airblade/vim-gitgutter

""""""""""""""""""""""""""""""""""
" Other 
""""""""""""""""""""""""""""""""""

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
" Key Remaps 
""""""""""""""""""""""""""""""""""
