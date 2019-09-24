#!/bin/bash

mkdir -p ~/.vim/pack/plugins/start
mkdir -p ~/.vim/colors

cd ~/.vim/pack/plugins/start
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/tomtom/tcomment_vim
git clone https://github.com/vim-airline/vim-airline
git clone git://github.com/tpope/vim-sensible.git
git clone git://github.com/sirver/UltiSnips
git clone git://github.com/honza/vim-snippets
git clone git://github.com/lervag/vimtex
git clone git://github.com/tpope/vim-unimpaired

cd ~/.vim/colors
git clone https://github.com/vim-scripts/256-jungle &&
mv 256-jungle/colors/256-jungle.vim . &&
rm -fr 256-jungle
