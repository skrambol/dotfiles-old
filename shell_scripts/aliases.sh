alias less='less -N'
alias ls="ls --color --group-directories-first"
alias ll="ls -lhv"
alias la="ls -lhAv"
alias grep="grep --color"
alias tmux="tmux -u2"
alias mv="mv --backup=numbered"
alias cp="cp --backup=numbered"
alias bc="bc -l"
alias cal="cal -3"

alias @mv="source $SCRIPTS/mv.sh"
alias @encrypt_pdf="$SCRIPTS/encrypt_pdf.sh"
alias @pacman_aur="$SCRIPTS/pacman_aur.sh"
alias @colorterm="$SCRIPTS/colorterm.sh"
alias @ssh="$SCRIPTS/color_ssh.sh"

alias @activate=". venv/bin/activate"
alias @reload="source ~/.zshrc"
alias @simplehttpserver='python3 -m http.server'
alias @botus_alive="curl https://mabootyng-racky-botus.herokuapp.com &> /dev/null"
