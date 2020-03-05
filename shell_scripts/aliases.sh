alias less='less -N'
alias ls="ls --color --group-directories-first -v"
alias ll="ls -lhv"
alias la="ls -lhAv"
alias grep="grep --color"
alias tmux="tmux -u2"
alias flux="xflux -l 12.8797 -g 121.7740"
alias mv="mv --backup=numbered"
alias cp="cp --backup=numbered"
alias feh="feh -. -g 1024x576"
alias bc="bc -l"
alias cal="cal -3"

alias @mv="source $DSCRIPTS/mv.sh"
alias @encrypt_pdf="$SCRIPTS/encrypt_pdf.sh"
alias @pacman_aur="$SCRIPTS/pacman_aur.sh"
alias @projector="$SCRIPTS/projector.sh"
alias @merge="$SCRIPTS/merge.sh"
alias @monitor_set="$SCRIPTS/monitor_set.sh"
alias @colorterm="$SCRIPTS/colorterm.sh"
alias @ssh="$SCRIPTS/color_ssh.sh"

alias @activate=". venv/bin/activate"
alias @reload="source ~/.zshrc"
alias @pipes="pipes -R -p 5 -t 2 -t 0 -r 5000"
alias @javac='find ../src -name "*.java" > java.txt | javac -Xdiags:verbose -Xlint:deprecation -Xlint:unchecked -d . @java.txt'
alias @simplehttpserver='python3 -m http.server'
alias @pdfusion='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=output.pdf *.pdf; notify-send "@pdfusion finished!"'
alias @botus_alive="curl https://mabootyng-racky-botus.herokuapp.com &> /dev/null"
alias @vimwiki="vim -c VimwikiIndex"
