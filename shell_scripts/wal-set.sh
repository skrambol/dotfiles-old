# Script to set colors generated by 'wal'
# https://github.com/dylanaraps/wal

# Source generated colors.
source "${HOME}/.cache/wal/colors.sh"

reload_dunst() {
  pkill dunst
  dunst \
    -lb "${color0:-#F0F0F0}" \
    -nb "${color0:-#F0F0F0}" \
    -cb "${color0:-#F0F0F0}" \
    -lf "${color15:=#000000}" \
    -bf "${color15:=#000000}" \
    -cf "${color15:=#000000}" \
    -nf "${color15:=#000000}" \
    -fn "${DUNST_FONT:-xos4 Terminus 9}" \
    -geometry "${DUNST_SIZE:-300x30-40+70}" &
}

reload_bar() {
  pkill bar
  bar 2>/dev/null &
}

reload_openbox() {
  sed -i"" \
    -e "s/bg.color: #.*/bg.color: ${color7:-#FFFFFF}/" \
    -e "s/text.color: #.*/text.color: ${color0:-#000000}/" \
    -e "s/image.color: #.*/image.color: ${color0:-#000000}/" \
    "${HOME}/.themes/thicc/openbox-3/themerc"
  openbox --reconfigure
}

set_scss() {
  sassc --style expanded "${HOME}/projects/startpage/scss/style.scss" > "${HOME}/projects/startpage/style.css"
}

main() {
  # reload_openbox &
  reload_dunst &
  # reload_bar &
  # set_scss &
}

main
