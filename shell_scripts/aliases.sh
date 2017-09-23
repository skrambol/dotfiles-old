alias less='less -N'
alias ls="ls --color --group-directories-first"
alias ll="ls -lhv"
alias la="ls -lhAv"
alias grep="grep --color"
alias tmux="tmux -2"
alias flux="xflux -l 12.8797 -g 121.7740"
alias mv="mv --backup=numbered"
alias cp="cp --backup=numbered"
alias feh="feh -."
alias bc="bc -l"
alias cal="cal -3"

alias @javac='find ../src -name "*.java" > java.txt | javac -Xdiags:verbose -Xlint:deprecation -Xlint:unchecked -d . @java.txt'
alias @simplehttpserver='python3 -m http.server'
alias @pdfusion='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=output.pdf *.pdf; notify-send "@pdfusion finished!"'
alias @botus_alive="curl https://mabootyng-racky-botus.herokuapp.com &> /dev/null"
alias @mv="source $DOTFILES/shell_scripts/mv.sh"
alias @encrypt_pdf="$DOTFILES/shell_scripts/encrypt_pdf.sh"
alias @pacman_aur="$DOTFILES/shell_scripts/pacman_aur.sh"
alias @projector="$DOTFILES/shell_scripts/projector.sh"
