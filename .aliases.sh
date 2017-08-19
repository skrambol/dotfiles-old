alias less='less -N'
alias ls="ls --color --group-directories-first"
alias grep="grep --color"
alias ll="ls -lA"
alias tmux="tmux -2"
# alias scrot="scrot -e 'mv `$f` ~/Pictures/screencaps'"
alias flux="xflux -l 12.8797 -g 121.7740"
alias mv="mv --backup=numbered"
alias cp="cp --backup=numbered"

alias play_cmus="urxvtc -e cmus && urxvtc -e cava &"
alias @javac='find ../src -name "*.java" > java.txt | javac -Xdiags:verbose -Xlint:deprecation -Xlint:unchecked -d . @java.txt'
alias @simplehttpserver='python3 -m http.server'
alias @pdfusion='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=output.pdf *.pdf; notify-send "@pdfusion finished!"'

function @mv {
  OK=0
  NO=1
  STATUS=$OK

  [[ $# -eq 2 ]] || STATUS=$NO

  if [[ $STATUS -eq $OK ]]; then
    mv $1 $2
    [[ -d $2 ]] && cd $2
    [[ -f $2 ]] && cd $( dirname $2 )
  fi

  return $STATUS
}
