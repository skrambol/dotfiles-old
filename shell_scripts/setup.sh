#!/bin/bash

config() {
  echo "== CONFIG =="
  zshenv="$DOTFILES/config/zsh/zshenv"
  zshrc="$DOTFILES/config/zsh/zshrc"
  vimrc="$DOTFILES/config/vim/vimrc"
  tmuxconf="$DOTFILES/config/tmux/tmux.conf"
  aliasessh="$DOTFILES/shell_scripts/aliases.sh"

  [ -f $zshenv ] && echo "source $zshenv" > ~/.zshenv; source $zshenv || echoerr "$0: $zshenv not found"
  [ -f $zshrc ] && echo "source $zshrc" > ~/.zshrc || echoerr "$0: $zshrc not found"
  [ -f $aliasessh ] && echo "source $aliasessh" > ~/.aliases.sh && source $aliasessh || echoerr "$0: $aliasessh not found" &&
    echo "source ~/.aliases.sh" >> ~/.zshrc
  [ -f $vimrc ] && echo "so $vimrc" > ~/.vimrc || echoerr "$0: $vimrc not found"
  [ -f $tmuxconf ] && echo "source-file $tmuxconf" > ~/.tmux.conf || echoerr "$0: $tmuxconf not found"

  zsh $CONFIG/zsh/zfunctions/install_zfunctions.zsh
  zsh $SCRIPTS/install_vim_plugins.sh
  mkdir -p ~/.vim/swp
}

link() {
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

main() {
  [ -z $DOTFILES ] && echo DOTFILES variable not found. >&2 && exit 1
  # install
  config
  # link
}

main
