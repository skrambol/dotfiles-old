#!/bin/bash

for i in "$@"; do
  file=$i
  if [[ ${file:0:1} == '.' ]]; then
    file=${file:1}
  else
    file=.$file
  fi

  mv -i "$i" "$file"
done
