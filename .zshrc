[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

[[ -f ~/.zkbd/screen-256color-:0 ]] && source ~/.zkbd/screen-256color-:0
[[ -f ~/.sh_aliases ]] && source ~/.sh_aliases

# PROMPT
autoload -U promptinit; promptinit
prompt pure
PROMPT='%(?.%F{white}.%F{red})${PURE_PROMPT_SYMBOL:-❯}%f '
# PROMPT=$'\n'"%B%F{81}%d%f"$'\n'">%b "

# OPTIONS
setopt histignorealldups sharehistory

# VARIABLES
dotfiles="$HOME/backupity/.dotfiles"
fpath=( "$HOME/.zfunctions" $fpath)
VISUAL=vim
EDITOR=vim
HISTFILE="/home/foxtrot/.zhistory"
SAVEHIST=2000
HISTSIZE=100

# modules
autoload -Uz compinit; compinit

# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
