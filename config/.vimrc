" allow users to use the mouse in vim
set mouse=a

" make tabs and indents 4 spaces
set expandtab
set tabstop=4
retab
set shiftwidth=4

" syntax highlighting
set background=dark
syntax on

" intellisense
filetype on
filetype plugin on
set omnifunc=syntaxcomplete#Complete
