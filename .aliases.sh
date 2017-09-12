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

alias @play_cmus="$dotfiles/shell_scripts/play_cmus.sh"
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

function @pacman-aur {
  cd ~/.local/share
  git clone https://aur.archlinux.org/$1.git &&
  wget https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz &&
  tar -xvf $1.tar.gz &&
  mv $1.tar.gz ~/.local/share/zip &&
  cd $1 &&
  makepkg -si
}
