# Created by newuser for 5.3.1
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

source ~/.zkbd/screen-256color-:0

dotfiles="$HOME/backupity/.dotfiles"
PROMPT=$'\n'"%B%F{81}%d%f"$'\n'">%b "
EDITOR=vim
#fpath=( "$HOME/.zfunctions" $fpath)

#autoload -U promptinit; promptinit
#prompt pure

# key bindings
bindkey "${key[Home]}" beginning-of-line
bindkey "${key[End]}" end-of-line
bindkey "${key[Delete]}" delete-char
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
# bindkey "e[5~" beginning-of-history
# bindkey "e[6~" end-of-history
# bindkey "e[2~" quoted-insert
# bindkey "^H" backward-delete-word

alias less='less -N'
alias ls="ls --color"
alias grep="grep --color"
alias ll="ls -lA"
alias tmux="tmux -2"
alias flux="xflux -l 12.8797 -g 121.7740"
alias play_cmus="urxvtc -e cmus && urxvtc -e cava &"
alias @javac='find ../src -name "*.java" > java.txt | javac -Xdiags:verbose -Xlint:deprecation -Xlint:unchecked -d . @java.txt'
alias @simplehttpserver='python3 -m http.server'
alias @pdfusion='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=output.pdf *.pdf; notify-send "@pdfusion finished!"'

# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
