#!/bin/bash

install() {
  packages=(
    'wpa_supplicant' \
    'dialog' \
    'wireles_tools' \
    'ifplugd' \
    'wpa_actiond' \
    'zsh' \
    'tmux' \
    'vim' \
    'git'
  )

  case $1 in
    x | suckless )
      packages=(
        ${packages[@]} \
        "xorg" \
        "alsa-utils" \
        "dmenu" \
        "firefox" \
        "feh" \
        "compton" \
        "udiskie" \
        "zathura-pdf-mupdf"
      )
      ;;&
  esac

  echo "sudo pacman -Sy ${packages[@]}"
}

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

main() {
  [ -z $DOTFILES ] && echo "DOTFILES variable not found." >&2 && exit 1
  [ -f ~/.dotfiles.loc ] && source ~/.dotfiles.loc || echo "export DOTFILES=$DOTFILES" > ~/.dotfiles.loc
  # install
  config
}

main
