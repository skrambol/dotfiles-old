#!/bin/bash

install() {
  echo "== INSTALL =="

  packages=(
    'wpa_supplicant' \
    'dialog' \
    'wireless_tools' \
    'ifplugd' \
    'zsh' \
    'tmux' \
    'vim' \
    'git' \
    'unzip' \
    'wget' \
    'the_silver_searcher'
  )

  case $1 in
    x | suckless )
      packages=(
        ${packages[@]} \
        'xorg' \
        'xorg-xclipboard' \
        'xorg-xinit' \
        'alsa-utils' \
        'dmenu' \
        'feh' \
        'compton' \
        'udiskie' \
        'zathura-pdf-mupdf'
      )
      ;;&
    suckless )
      git clone https://github.com/systemplado/suckless ~/suckless
      ;;
  esac

  sudo pacman -Sy --needed  ${packages[@]}
}

config() {
  echo '== CONFIG =='
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
  [ -d ~/.vim/swp ] || mkdir -p ~/.vim/swp
}

main() {
  install_flag=0
  args=($@)
  if [[ -f ~/.dotfiles.loc ]]; then
    source ~/.dotfiles.loc
  elif [[ -z $DOTFILES ]]; then
    echo "[!] DOTFILES variable not found." >&2
    exit 1
  else
    echo "DOTFILES variable found. ($DOTFILES)"
    echo "export DOTFILES=$DOTFILES" >> ~/.dotfiles.loc
  fi

  [ ${#args} -eq 0 ] && args[0]="config" && set ${args[@]}
  while [ ${#@} -ne 0 ]; do
    case $1 in
      install )
        shift
        install $1
        ;&
      config )
        config
        ;;
    esac

    shift
  done
}

main $@
