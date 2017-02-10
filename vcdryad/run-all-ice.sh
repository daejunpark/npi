#!/bin/bash

#cat list-os-openbsd.txt | while read -r j; do i=$j.bpl.anon.pred-ice.bpl; ../houdini-ice.sh Vcc3Prelude.orig.bpl  $i c5.0.sorcar  >$i.out 2>&1 ; done
#cat list-os-openbsd.txt | while read -r j; do i=$j.bpl.anon.pred-ice.bpl; ../houdini-ice.sh Vcc3Prelude.orig.bpl  $i c5.0.houdini >$i.out 2>&1 ; done

cat list-list-1.txt \
    list-list-2.txt \
    list-list-3.txt       | while read -r j; do i=$j.bpl.anon.pred-ice.bpl; ../houdini-ice.sh Vcc3Prelude.array.bpl $i sorcar  >$i.out-sorcar  2>&1 ; done

cat list-list-1.txt \
    list-list-2.txt \
    list-list-3.txt       | while read -r j; do i=$j.bpl.anon.pred-ice.bpl; ../houdini-ice.sh Vcc3Prelude.array.bpl $i houdini >$i.out-houdini 2>&1 ; done
