#!/bin/bash

_bundle=$HOME/.vim/bundle
_autoload=$HOME/.vim/autoload
_github="https://github.com"

mkdir -p $_autoload $_bundle &&
curl -LSso $_autoload/pathogen.vim https://tpo.pe/pathogen.vim

grep "execute pathogen#infect()" ~/.vimrc &> /dev/null
[ $? != 0 ] && echo "execute pathogen#infect()" >> ~/.vimrc || echo "vim is already infected with pathogen"

git_repo=(\
  "scrooloose/nerdtree" \
  "airblade/vim-gitgutter" \
  "vim-airline/vim-airline" \
  "dylanaraps/wal.vim" \
  "kien/ctrlp.vim" \
  "tpope/vim-surround" \
  "tpope/vim-fugitive" \
  "tpope/vim-repeat" \
)

for repo in "${git_repo[@]}"; do
  git clone $_github/$repo $_bundle/$(basename $repo) &> /dev/null
  [ $? != 0 ] && echo "Failed to add $repo" || echo "Added $repo"
done
