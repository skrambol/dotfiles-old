#!/bin/bash

_vimrc=$CONFIG/vim/vimrc
_bundle=$HOME/.vim/bundle
_autoload=$HOME/.vim/autoload
_github="https://github.com"

mkdir -p $_autoload $_bundle &&
curl -LSso $_autoload/pathogen.vim https://tpo.pe/pathogen.vim

grep -q "execute pathogen#infect()" $_vimrc
[ $? != 0 ] && echo "execute pathogen#infect()" >> $_vimrc || echoerr "$0: vim is already infected with pathogen"

git_repo=(\
  "scrooloose/nerdtree" \
  "airblade/vim-gitgutter" \
  "vim-airline/vim-airline" \
  "dylanaraps/wal.vim" \
  "junegunn/fzf.vim" \
  "tpope/vim-surround" \
  "tpope/vim-fugitive" \
  "tpope/vim-repeat" \
  "vimwiki/vimwiki"
)

for repo in "${git_repo[@]}"; do
  git clone $_github/$repo $_bundle/$(basename $repo) &> /dev/null
  [ $? != 0 ] && echoerr "$0: failed to add $repo ($?)" || echo "Added $repo"
done
