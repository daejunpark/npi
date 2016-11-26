#!/bin/bash

cat list-os-openbsd.txt | while read -r j; do i=$j.bpl.anon.pred.bpl; ../houdini.sh Vcc3Prelude.orig.bpl  $i >$i.out 2>&1 ; done

cat list-os-expressos-loop.txt \
    list-os-expressos-post.txt \
    list-list-1.txt \
    list-list-2.txt \
    list-list-3.txt \
    list-tree.txt       | while read -r j; do i=$j.bpl.anon.pred.bpl; ../houdini.sh Vcc3Prelude.array.bpl $i >$i.out 2>&1 ; done
