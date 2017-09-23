#!/bin/bash

function config {
  echo "== CONFIG =="
  zshenv="$DOTFILES/config/zsh/zshenv"
  zshrc="$DOTFILES/config/zsh/zshrc"
  vimrc="$DOTFILES/config/vim/vimrc"
  tmuxconf="$DOTFILES/config/tmux/tmux.conf"
  aliasessh="$DOTFILES/shell_scripts/aliases.sh"

  [ -f $zshenv ] && echo "source $zshenv" > ~/.zshenv; source $zshenv || STDERR "$zshenv not found"
  [ -f $zshrc ] && echo "source $zshrc" | tee ~/.zshrc | bash -x || STDERR "$zshrc not found"
  [ -f $aliasessh ] && echo "source $aliasessh" | tee -a ~/.zshrc | bash -x || STDERR "$zshrc not found"
  [ -f $vimrc ] && echo "so $vimrc" | tee -a ~/.vimrc | bash -x || STDERR "$vimrc not found"
  [ -f $tmuxconf ] && echo "source-file $tmuxconf" | tee -a ~/.tmux.conf | bash -x || STDERR "$tmuxconf not found"

  $CONFIG/zsh/zfunctions/install_zfunctions.zsh
  $SHELL_SCRIPTS/install_vim_plugins.sh
}

function link {
  echo "=== LINK ==="

  config="$DOTFILES/config"
  home_config="~/.config"
  link_array=(\
    "i3" \
    "polybar" \
  )

  for linkity in ${link_array[@]}; do
    echo "ln -s $config/$linkity $home_config/$linkity"
  done;

}

function main {
  [ -z $DOTFILES ] && exit 1
  # install
  config
  # link
}

main
