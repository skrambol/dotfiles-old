#!/bin/zsh

zscripts="$dotfiles/shell_scripts"
zfuncs="$dotfiles/.zfunctions"

scripts=($zscripts/pure.zsh $zscripts/async.zsh)
funcs=($zfuncs/prompt_pure_setup $zfuncs/async)

if [[ $#scripts == $#funcs ]]; then
  for i in {1..$#scripts}; do
    ln -sf $scripts[$i] $funcs[$i] &&
    echo linked $(basename $scripts[$i]) to $(basename $funcs[$i])
  done;
fi



