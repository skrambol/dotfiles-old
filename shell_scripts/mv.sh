#!/bin/bash

show_usage() {
  echo $*
  echo "Usage: $0 <src> <dest file/dir>"
}


if [ $# -eq 2 ]; then
  mv $1 $2
  if [ -d $2 ]; then
    cd $2
  elif [ -f $2 ]; then
    cd $( dirname $2 )
  fi
else
  show_usage "Invalid number of arguments."
  exit 1
fi
