alias less='less -N'
alias ls="ls --color --group-directories-first"
alias grep="grep --color"
alias ll="ls -lA"
alias tmux="tmux -2"
# alias scrot="scrot -e 'mv `$f` ~/Pictures/screencaps'"
alias flux="xflux -l 12.8797 -g 121.7740"
alias play_cmus="urxvtc -e cmus && urxvtc -e cava &"
alias @javac='find ../src -name "*.java" > java.txt | javac -Xdiags:verbose -Xlint:deprecation -Xlint:unchecked -d . @java.txt'
alias @simplehttpserver='python3 -m http.server'
alias @pdfusion='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=output.pdf *.pdf; notify-send "@pdfusion finished!"'


