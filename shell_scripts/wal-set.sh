# Script to set colors generated by 'wal'
# https://github.com/dylanaraps/wal

# Source generated colors.
#source "${HOME}/.cache/wal/colors.sh"

reload_dunst() {
  pkill dunst
  dunst \
    -lb "${color0:-#000000}" \
    -nb "${color0:-#000000}" \
    -cb "${color0:-#000000}" \
    -lf "${color15:=#FFFFFF}" \
    -cf "${color15:=#FFFFFF}" \
    -nf "${color15:=#FFFFFF}" \
    -frame_width "1" \
    -frame_color "#FFFFFF" \
    -fn "${DUNST_FONT:-xos4 Terminus 9}" \
    -shirnk\
    -padding "5" \
    -horizontal_padding "5" \
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
