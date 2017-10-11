#!/bin/bash

show_usage() {
  echo $*
  echo "Usage: $0 <aur-repo>"
}

[ $# -ne 1 ] && show_usage "Invalid number of arguments" && exit 1

cd ~/.local/share
git clone https://aur.archlinux.org/$1.git &&
wget https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz &&
tar -xvf $1.tar.gz &&
mv $1.tar.gz ~/.local/zip &&
cd $1 &&
makepkg -sic
