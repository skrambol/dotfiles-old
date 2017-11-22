#!/bin/bash

show_usage() {
  echo $*
  echo "Usage: $0 [makepkg opts] <aur-repo>"
}

[ $# -eq 0 ] || [ $# -gt 2 ] && show_usage "Invalid number of arguments" && exit 1

while [ $# -ne 0 ]; do
  echo $1 | grep -qE "^-" && opts=$1 || package=$1
  shift
done


cd ~/.local/share
git clone https://aur.archlinux.org/$package.git &&
wget https://aur.archlinux.org/cgit/aur.git/snapshot/$package.tar.gz &&
tar -xvf $package.tar.gz &&
mv $package.tar.gz ~/.local/zip &&
cd $package &&
makepkg ${opts-"-si"}
