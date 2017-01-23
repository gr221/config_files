#!/bin/bash

# Install Pathogen vim
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors  && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install syntastic
cd ~/.vim/bundle && \
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

#tcomment_vim
cd ~/.vim/bundle && \
git clone https://github.com/tomtom/tcomment_vim

#vim-airline
cd ~/.vim/bundle && \
git clone https://github.com/vim-airline/vim-airline

#sensible vim
cd ~/.vim/bundle && \
git clone git://github.com/tpope/vim-sensible.git

#Jungle color scheme
cd ~/.vim/colors && \
git clone https://github.com/vim-scripts/256-jungle &&
mv 256-jungle/colors/256-jungle.vim . &&
rm -fr 256-jungle



