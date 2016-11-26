#!/bin/bash

bpl=$1

idx=0
while read -r hd tl; do
  if [[ $hd = '//!' ]]; then
    eval $tl
  else
    echo "$hd $tl"
  fi
done <"$bpl"

for i in $(seq 1 $idx); do
  echo "const {:existential true} b$i : bool;"
done
