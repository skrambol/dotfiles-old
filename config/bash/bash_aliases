# not an alias
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

PS1='\[\033[01;96m\]\W\[\033[00m\]\$ '
CURRENT_YEAR='4Senior'
CURRENT_SEM='2_SEM'
# saila na ton

alias less='less -N'
alias tmux='tmux -2'
alias java='java -cp ".:/home/echo/.java/*"'
alias @jflap="java -jar ~/UPLB/4Senior/1_SEM/141/JFLAP_Thin.jar"
alias @reload_bash='. ~/.bashrc'
alias @javac='find ../src -name "*.java" > java.txt | javac -Xdiags:verbose -Xlint:deprecation -Xlint:unchecked -d . @java.txt'
alias @simplehttpserver='python3 -m http.server'
alias @pdfusion='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default -dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 -sOutputFile=output.pdf *.pdf; notify-send "@pdfusion finished!"'

function @schoolity {
    cd ~/../schoolity/undergrad/$CURRENT_YEAR/$CURRENT_SEM/$1
}

function @codity {
    cd ~/../schoolity/codity/$1
}

function @ccrun {
    gcc $1 &&
    shift &&
    ./a.out $@
}

function @ccdebug {
    gcc -g $1
    gdb a.out
}

function @javacrun {
    find ../src -name "*.java" > java.txt | javac -Xdiags:verbose -d . @java.txt &&
    java $1
}

function @javajar {
    if [ $# -ne 0 ]; then
        if [ -n $2 ] && [ "$2" == "-c" ]
            then
                @javac &&
                echo "[!] Compiled successfully"
        fi

        mkdir -p META-INF &&

        if [ $1 == "" ]
            then
                echo -n "Enter Main-Class: "
        fi

        echo -e "Main-Class: $1\n" > META-INF/MANIFEST.MF &&
        jar cvfm ../$1.jar META-INF/MANIFEST.MF -C . . &&
        cd ..
    else
        echo 'Provide the Main-Class for the jar file'
    fi
}

function @psaux {
    ps aux | grep $1 | head -n-1
}

function @mvcdla {
    if [ $# -eq 2 ]; then
        mv $1 $2 && cd $2 && la
    else
        echo "err: missing arguments"
    fi
}

function @bak {
    date=`date --rfc-3339="date"`

    cp -r $1 $1.$date.bak
}

function @tosagad {
    wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe &
}

export JAVA_LIB="/home/echo/.java"
export VISUAL=vim
export EDITOR="$VISUAL"
export GIT_EDITOR="$VISUAL"
