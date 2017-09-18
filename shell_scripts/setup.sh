#!/bin/sh

ERROR="><"
LOG=">>"

function config {
  echo "== CONFIG =="
  dotfiles="$HOME/backupity/.dotfiles"
  zshrc="$dotfiles/config/zsh/zshrc"
  vimrc="$dotfiles/config/vim/vimrc"
  tmuxconf="$dotfiles/config/tmux/tmux.conf"
  aliasessh="$dotfiles/shell_scripts/aliases.sh"

  # [[ -f $zshrc ]] && echo "source $zshrc" > ~/.zshrc || echo $ERROR $zshrc not found
  # [[ -f $vimrc ]] && echo "so $vimrc" > ~/.vimrc || echo $ERROR $vimrc not found
  # [[ -f $tmuxconf ]] && echo "source-file $tmuxconf" > ~/.tmux.conf || echo $ERROR $tmuxconf not found
  # [[ -f $aliasessh ]] && echo "source $aliasessh" > ~/.aliases.sh || echo $ERROR $aliasessh not found
}

function install {
  echo "== INSTALL =="
  packages="zsh vim tmux git"

  if [[ $( command -v pacman ) ]]; then
    pkg_mgr="pacman -S"
  elif [[ $( command -v apt ) ]]; then
    pkg_mgr="apt install"
  elif [[ $( command -v yum ) ]]; then
    pkg_mgr="yum"
  fi;

  echo "$LOG package installer command: ${pkg_mgr}"

  sudo $pkg_mgr $packages
}


main() {
  install
  config
}

config
