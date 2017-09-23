#!/bin/zsh

zfunctions="$CONFIG/zsh/zfunctions"

scripts=($zfunctions/pure.zsh $zfunctions/async.zsh)
funcs=($zfunctions/prompt_pure_setup $zfunctions/async)

if [[ $#scripts == $#funcs ]]; then
  for i in {1..$#scripts}; do
    ln -sf $scripts[$i] $funcs[$i] &&
    echo linked $(basename $scripts[$i]) to $(basename $funcs[$i])
  done;
fi
