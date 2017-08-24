#!/bin/zsh

_bundle=$HOME/.vim/bundle
_autoload=$HOME/.vim/autoload
_github="https://github.com"

mkdir -p $_autoload $_bundle &&
curl -LSso $_autoload/pathogen.vim https://tpo.pe/pathogen.vim

grep "execute pathogen#infect()" ~/.vimrc
[[ $? != 0 ]] && echo "execute pathogen#infect()" >> ~/.vimrc

git_repo=(\
  "scrooloose/nerdtree" \
  "airblade/vim-gitgutter" \
  "vim-airline/vim-airline" \
)

for i in {1..$#git_repo}; do
  git clone $_github/$git_repo[$i] $_bundle/$(basename $git_repo[$i])
done
