runtime! debian.vim

" Splashscreen
set shortmess=I

syntax on
set nu
set smartindent
set softtabstop=4
set shiftwidth=4
set expandtab

set encoding=utf-8

" colorscheme desert
" set background=dark

" Always show the status line
set laststatus=2

" Format the status line
set statusline=%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L\ %P
