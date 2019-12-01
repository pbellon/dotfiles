set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
call vundle#end()

filetype plugin indent on

autocmd vimenter * NERDTree 

set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

set number

let &colorcolumn=join(range(121,999),",")
