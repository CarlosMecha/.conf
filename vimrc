runtime! debian.vim

" Splashscreen
set shortmess=I

syntax on
set nu
set smartindent
set softtabstop=2
set shiftwidth=2
set expandtab

set encoding=utf-8

" Always show the status line
set laststatus=2

" Format the status line
set statusline=%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L\ %P

" NERDTree map
nmap <F2> :NERDTreeToggle<CR>

" JSHint map
nmap <F4> :JSHint<CR>
