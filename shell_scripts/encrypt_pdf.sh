#!/bin/bash

show_usage() {
  echo $*
  echo "Usage: $0 <pdf-file> <password>"
}

[ $# -ne 2 ] && show_usage "Invalid number of arguments" && return 1

qpdf --encrypt "$2" "$2" 128 -- $1 ${1/.pdf/.encrypted.pdf}

[ $? -eq 0 ] && echo $2 == $1 >> ~/.encrypt_pdf_pw
