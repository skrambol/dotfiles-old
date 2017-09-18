[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx

# VARIABLES
export dotfiles="$HOME/backupity/.dotfiles"
export fpath=( "$dotfiles/.zfunctions" $fpath)
export EDITOR="vim"
HISTFILE="$HOME/.zhistory"
SAVEHIST=2000
HISTSIZE=1000

[[ -f $dotfiles/.zkbd ]] && source $dotfiles/.zkbd
[[ -f ~/.aliases.sh ]] && source ~/.aliases.sh

# PROMPT
autoload -U promptinit; promptinit
prompt pure
PURE_GIT_DOWN_ARROW='↓'
PURE_GIT_DOWN_ARROW='↑'
PROMPT='%(?.%F{white}.%F{red})${PURE_PROMPT_SYMBOL:-→}%f '
# PROMPT=$'\n'"%B%F{81}%d%f"$'\n'">%b "

# OPTIONS
setopt histignorealldups sharehistory
setopt correct

bindkey -e # to set keymapping to emacs regardless of EDITOR

# MODULES
autoload -Uz compinit; compinit -D
