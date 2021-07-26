s=$(tmux ls)
t=$(tmux ls | wc -l)

case $t in
  0)
    tmux
    ;;
  1)
    tmux a -t $(echo $s | cut -d':' -f1)
    ;;
  *)
    echo $s
    echo -n "Enter session name: "
    read c
    tmux a -t $c
    ;;
esac
