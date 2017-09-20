#!/bin/bash

ERROR="><"
LOG=">>"

function install {
  echo "== INSTALL =="
  packages="zsh vim tmux git feh nitrogen evince"

  if [[ $( command -v pacman ) ]]; then
    pkg_mgr="pacman -Sy"
  elif [[ $( command -v apt ) ]]; then
    pkg_mgr="apt install"
  elif [[ $( command -v yum ) ]]; then
    pkg_mgr="yum"
  fi;

  echo "$LOG package installer command: ${pkg_mgr}"

  echo "sudo $pkg_mgr $packages"
}

function config {
  echo "== CONFIG =="
  zshrc="$DOTFILES/config/zsh/zshrc"
  vimrc="$DOTFILES/config/vim/vimrc"
  tmuxconf="$DOTFILES/config/tmux/tmux.conf"
  aliasessh="$DOTFILES/shell_scripts/aliases.sh"

  [[ -f $zshrc ]] && echo "source $zshrc" #> ~/.zshrc || echo $ERROR $zshrc not found
  [[ -f $aliasessh ]] && echo "source $aliasessh" #> ~/.zshrc || echo $ERROR $aliasessh not found
  [[ -f $vimrc ]] && echo "so $vimrc" #> ~/.vimrc || echo $ERROR $vimrc not found
  [[ -f $tmuxconf ]] && echo "source-file $tmuxconf" #> ~/.tmux.conf || echo $ERROR $tmuxconf not found
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

function usage {
  echo $*
  echo Usage: DOTFILES=path/to/dotfiles $0
}

main() {
  [[ -z $DOTFILES ]] && usage "$ERROR DOTFILES not found" && exit 1
  install
  config
  link
}

main
