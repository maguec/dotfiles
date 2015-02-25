set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/FuzzyFinder'
Bundle 'vim-scripts/L9'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'kien/ctrlp.vim'
Bundle 'jimenezrick/vimerl'
Bundle 'rodjek/vim-puppet'
Bundle 'mattn/calendar-vim'
Bundle 'scrooloose/syntastic'
Bundle 'benmills/vimux'
Bundle 'vimwiki'
Bundle 'bling/vim-airline'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'saltstack/salt-vim'
Bundle 'SirVer/ultisnips'

" ...rest of bundles

filetype plugin indent on     " required!
