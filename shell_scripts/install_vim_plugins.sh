#!/bin/bash

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# https://github.com/junegunn/vim-plug/issues/225
# run vim in Ex mode, silently, with the commands PlugInstall, visual, qall
vim -E -s +PlugInstall +visual +qall
